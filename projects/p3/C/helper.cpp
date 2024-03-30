#include <fstream>
#include <memory>
#include <algorithm>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <set>
#include <vector>
#include <utility>

#include "llvm-c/Core.h"

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/LinkAllPasses.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Analysis/InstructionSimplify.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Analysis/LoopAnalysisManager.h"
#include "llvm/IR/PassManager.h"
//#include "llvm/Analysis/CGSCCAnalysisManager.h"
//#include "llvm/Analysis/ModuleAnalysisManager.h"

using namespace llvm;

extern FunctionCallee AssertFT;
extern FunctionCallee AssertCFG;

//LLVMContext& getGlobalContext();

void BuildExit(Module *M)
{
  // make exit declaration
  std::vector<Type*> exit_arg_types;
  exit_arg_types.push_back(Type::getInt32Ty(M->getContext()));
  FunctionType *exit_type = FunctionType::get(Type::getVoidTy(M->getContext()), exit_arg_types, true);
  Function::Create(exit_type, Function::ExternalLinkage, "exit", M);
}

void BuildPrintf(Module *M)
{
  // declare i32 @printf(ptr noundef, ...)
  std::vector<Type*> printf_arg_types;
  printf_arg_types.push_back(Type::getInt8PtrTy(M->getContext()));
  printf_arg_types.push_back(Type::getInt32Ty(M->getContext()));
  FunctionType *printf_type = FunctionType::get(Type::getInt32Ty(M->getContext()), printf_arg_types, true);
  Function::Create(printf_type, Function::ExternalLinkage, "printf", M); 
}

FunctionCallee BuildAssertFT(Module *M)
{
  LLVMContext &Context = M->getContext();
  
  std::vector<Type*> v;
  v.push_back(IntegerType::get(M->getContext(),32));
  v.push_back(IntegerType::get(M->getContext(),32));

  ArrayRef<Type*> Params(v);
  FunctionType* FunType = FunctionType::get(Type::getVoidTy(Context),Params,false);
  
  FunctionCallee fun = M->getOrInsertFunction("assert_ft",FunType);

  Function *F = cast<Function>(fun.getCallee());
  // add code to function that does the following:
  // two basic blocks
  // 1. if (arg0 == arg1) return;
	// 2. assert(0);
  
  BasicBlock *BB1 = BasicBlock::Create(Context,"entry",F);
  BasicBlock *BB2 = BasicBlock::Create(Context,"fail",F);
  BasicBlock *BB3 = BasicBlock::Create(Context,"exit",F);
  IRBuilder<> Builder(BB1);
  Value *cmp = Builder.CreateICmpNE(F->getArg(0),Builder.getInt32(0));
  Builder.CreateCondBr(cmp,BB2,BB3);
  Builder.SetInsertPoint(BB2);
  // call fprintf to print the error message
  std::vector<Value*> args;
  Value* s = Builder.CreateGlobalStringPtr("Assertion failed at %d\n");
  // cast s to i8*
  //s = Builder.CreatePointerCast(s,Type::getInt8PtrTy(Context));
  args.push_back(s);
  args.push_back(F->getArg(1));
  Builder.CreateCall(F->getParent()->getFunction("printf"),args,"assertcheck");
  Builder.CreateCall(F->getParent()->getFunction("exit"),Builder.getInt32(1));
  Builder.CreateBr(BB3);
  Builder.SetInsertPoint(BB3);
  Builder.CreateRetVoid();  
  
  return fun;

}

FunctionCallee BuildAssertCFG(Module *M)
{
  LLVMContext &Context = M->getContext();
  
  std::vector<Type*> v;
  v.push_back(IntegerType::get(Context,32));
  v.push_back(IntegerType::get(Context,32));  
  v.push_back(IntegerType::get(Context,32));
  
  ArrayRef<Type*> Params2(v);
  FunctionType* FunType2 = FunctionType::get(Type::getVoidTy(Context),Params2,false);
  FunctionCallee fun = M->getOrInsertFunction("assert_cfg_ft",FunType2);
  Function *F = cast<Function>(fun.getCallee());
  
  BasicBlock *BB1 = BasicBlock::Create(Context,"entry",F);
  BasicBlock *BB2 = BasicBlock::Create(Context,"fail",F);
  BasicBlock *BB3 = BasicBlock::Create(Context,"exit",F);
  IRBuilder<> Builder(BB1);
  Value *cmp = Builder.CreateICmpNE(F->getArg(0),Builder.getInt32(0));
  Builder.CreateCondBr(cmp,BB2,BB3);
  Builder.SetInsertPoint(BB2);
  // call fprintf to print the error message
  std::vector<Value*> args;
  Value* s = Builder.CreateGlobalStringPtr("**Possible soft-error detected at due to control flow into block %d (%d). Exiting program.\n");
  // cast s to i8*
  //s = Builder.CreatePointerCast(s,Type::getInt8PtrTy(Context));
  args.push_back(s);
  args.push_back(F->getArg(1));
  args.push_back(F->getArg(2));
  Builder.CreateCall(F->getParent()->getFunction("printf"),args,"assertcheck");
  Builder.CreateCall(F->getParent()->getFunction("exit"),Builder.getInt32(1));
  Builder.CreateBr(BB3);
  Builder.SetInsertPoint(BB3);
  Builder.CreateRetVoid();
  
  return fun;

}

void  BuildHelperFunctions(Module *M)
{
  BuildExit(M);
  BuildPrintf(M);

  AssertFT = BuildAssertFT(M);
  AssertCFG = BuildAssertCFG(M);  
}

//
// Run all O2 optimizations
//
void RunO2(Module *M) {
  // Create the analysis managers.
  // These must be declared in this order so that they are destroyed in the
  // correct order due to inter-analysis-manager references.
  LoopAnalysisManager LAM;
  FunctionAnalysisManager FAM;
  CGSCCAnalysisManager CGAM;
  ModuleAnalysisManager MAM;
  
  // Create the new pass manager builder.
  // Take a look at the PassBuilder constructor parameters for more
  // customization, e.g. specifying a TargetMachine or various debugging
  // options.
  PassBuilder PB;
  
  // Register all the basic analyses with the managers.
  PB.registerModuleAnalyses(MAM);
  PB.registerCGSCCAnalyses(CGAM);
  PB.registerFunctionAnalyses(FAM);
  PB.registerLoopAnalyses(LAM);
  PB.crossRegisterProxies(LAM, FAM, CGAM, MAM);
  
  // Create the pass manager.
  // This one corresponds to a typical -O2 optimization pipeline.
  ModulePassManager MPM = PB.buildPerModuleDefaultPipeline(OptimizationLevel::O2);
  
  // Optimize the IR!
  MPM.run(*M, MAM);
}


static llvm::Statistic nFunctions = {"", "Functions", "number of functions"};
static llvm::Statistic nInstructions = {"", "Instructions", "number of instructions"};
static llvm::Statistic nLoads = {"", "Loads", "number of loads"};
static llvm::Statistic nStores = {"", "Stores", "number of stores"};
static llvm::Statistic cfgEdges = {"", "cfgEdges", "number of CFG edges"};
static llvm::Statistic instCoverage = {"", "instCoverage", "number of protected instructions"};
static llvm::Statistic cfgCoverage = {"", "cfgEdgeCoverage", "number of protected CFG edges"};

struct AssertVisitor : public InstVisitor<AssertVisitor> {
  std::vector<CallInst*> ft;
  std::vector<CallInst*> cfg;  
    
  unsigned Count;
  AssertVisitor() {}
  
  void visitCallInst(CallInst &CI) {
    if(CI.getCalledFunction()==AssertFT.getCallee())
      ft.push_back(&CI);

    if(CI.getCalledFunction()==AssertCFG.getCallee())
      cfg.push_back(&CI);

  }
};

struct CollectInst : public InstVisitor<CollectInst> {
  std::set<Instruction*> s;
    
  unsigned Count;
  CollectInst() {}
  
  void visitInstruction(Instruction &I) {
    s.insert(&I);
  }
};



void backtrace(Instruction *I, std::set<Instruction*> &bt) {
  if (bt.find(I) == bt.end()) {
    bt.insert(I);
    for (int i=0; i<I->getNumOperands(); i++) {
      Value* op = I->getOperand(i);
      if ( isa<Instruction>(op) ) {
	backtrace(cast<Instruction>(op),bt);
      }
    }
  }
}

PHINode *get_phi(Instruction *I) {
  if ( isa<PHINode>(I) ) return cast<PHINode>(I);

  for (int i=0; i<I->getNumOperands(); i++) {
    Value* op = I->getOperand(i);
    if ( isa<Instruction>(op) ) {
      PHINode *phi = get_phi(cast<Instruction>(op));
      if (phi) { return phi; }
    }
  }
  
  return nullptr;
}


long cfg_edges(Function *F) {
  int cfg_edges = 2; // entry and exit
  for (auto BB = F->begin(); BB != F->end(); BB++) {
    for (pred_iterator PI = pred_begin(&*BB), E = pred_end(&*BB); PI != E; ++PI) {
      cfg_edges++;      
    }
  }
  return cfg_edges;
}

long branch_coverage(std::vector<CallInst*> &seed)
{
  std::set< std::pair<BasicBlock*,BasicBlock*> > edges;

  std::set<Instruction*> branchs;
  for (CallInst* CI: seed) {
    PHINode *phi = get_phi(CI);
    BasicBlock *pbb = phi->getParent();
    if (phi) {
      // for each arg in phi:
      for (int i=0; i<phi->getNumIncomingValues(); i++) {
	BasicBlock *bb = phi->getIncomingBlock(i);
	edges.insert( {bb,pbb} );
      }
    }    
  }

  return edges.size();
}

long instruction_coverage(std::vector<CallInst*> &seed) {
  std::set<Instruction*> bt;
  for (auto I: seed) {
    Instruction * val;
    if (I->getNumOperands() > 0) {
      val = cast<Instruction>(I->getOperand(0));
      if (val && val->getNumOperands() > 0)
	{
	  val = cast<Instruction>(val->getOperand(0));
	  if (val && isa<ICmpInst>(val)) {
	    // don't add I
	    for (int i=0; i<val->getNumOperands(); i++) {
	      Value* op = val->getOperand(i);
	      if ( isa<Instruction>(op) ) {
		backtrace(cast<Instruction>(op),bt);
	      }
	    }
	  }
	}
    }
  }
  return bt.size();
}


double estimate_fault_coverage(Module *M) {
  double cov = 0.0;

  AssertVisitor av;
  av.visit(M);
  CollectInst s;
  s.visit(M);

  long total = s.s.size();
  long ft_cov = instruction_coverage(av.ft);

  cfgCoverage = branch_coverage(av.cfg);

  instCoverage = ft_cov;

  ///errs() << total << " " << ft_cov << "\n";

  if (total==0)
    return 0.0;
  
  cov = (double)(ft_cov)/(double)total;
  return cov;   
}


void summarize(Module *M) {
    for (auto i = M->begin(); i != M->end(); i++) {
        if (i->begin() != i->end()) {
            nFunctions++;
	    cfgEdges += cfg_edges(&*i);
        }

        for (auto j = i->begin(); j != i->end(); j++) {
            for (auto k = j->begin(); k != j->end(); k++) {
                Instruction &I = *k;
                nInstructions++;
                if (isa<LoadInst>(&I)) {
                    nLoads++;
                } else if (isa<StoreInst>(&I)) {
                    nStores++;
                }
            }
        }	
    }

    estimate_fault_coverage(M);
    //errs() << "Fault Coverage = " << (int) (estimate_fault_coverage(M)*100) << "\n";
}


