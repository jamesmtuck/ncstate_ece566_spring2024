// #include <stdio.h>
// #include <stdlib.h>
// #include <unistd.h>


// #include "llvm-c/Core.h"

// #include "llvm/IR/LLVMContext.h"
// #include "llvm/IR/Module.h"
// #include "llvm/PassManager.h"
// #include "llvm/Analysis/CallGraphSCCPass.h"
// #include "llvm/Bitcode/ReaderWriter.h"
// #include "llvm/Assembly/PrintModulePass.h"
// #include "llvm/DebugInfo.h"
// #include "llvm/Analysis/Verifier.h"
// #include "llvm/Analysis/LoopPass.h"
// #include "llvm/Analysis/RegionPass.h"
// #include "llvm/Analysis/CallGraph.h"
// #include "llvm/Target/TargetLibraryInfo.h"
// #include "llvm/Target/TargetMachine.h"
// #include "llvm/ADT/StringSet.h"
// #include "llvm/ADT/Triple.h"
// #include "llvm/Support/PassNameParser.h"
// #include "llvm/Support/Signals.h"
// #include "llvm/Support/Debug.h"
// #include "llvm/IRReader/IRReader.h"
// #include "llvm/Support/ManagedStatic.h"
// #include "llvm/Support/PluginLoader.h"
// #include "llvm/Support/PrettyStackTrace.h"
// #include "llvm/Support/SystemUtils.h"
// #include "llvm/Support/ToolOutputFile.h"
// #include "llvm/Support/SourceMgr.h"
// #include "llvm/LinkAllPasses.h"
// #include "llvm/Transforms/IPO/PassManagerBuilder.h"
// #include <memory>
// #include <algorithm>

#include <fstream>
#include <memory>
#include <algorithm>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <set>
#include <vector>
#include <utility>
#include <time.h>

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

static LLVMContext Context;

static cl::opt<std::string>
InputFilename(cl::Positional, cl::desc("<input bitcode>"), cl::init("-"));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Output filename"), cl::value_desc("filename"));


static cl::opt<bool>
NoFlowInject("no-flow-errors",
  cl::desc("Inject control flow errors."),
  cl::init(false));

static cl::opt<bool>
NoDataInject("no-data-errors",
  cl::desc("Inject data flow errors."),
  cl::init(false));

static cl::opt<unsigned>
NumErrors("inject-count",
  cl::desc("Inject num errors."),
  cl::init(1));

static inline std::string
GetFileNameRoot(const std::string &InputFilename) {
  std::string IFN = InputFilename;
  std::string outputFilename;
  int Len = IFN.length();
  if ((Len > 2) &&
      IFN[Len-3] == '.' &&
      ((IFN[Len-2] == 'b' && IFN[Len-1] == 'c') ||
       (IFN[Len-2] == 'l' && IFN[Len-1] == 'l'))) {
    outputFilename = std::string(IFN.begin(), IFN.end()-3); // s/.bc/.s/
  } else {
    outputFilename = IFN;
  }
  return outputFilename;
}

void  BuildFlip(Module *M);
Value *FlipRandomBit(Instruction *I);
Value *FlipControlBit(Instruction *I);  
  
int
main (int argc, char ** argv)
{
  cl::ParseCommandLineOptions(argc, argv, "llvm system compiler\n");

  char filename[1024];
  if (argc < 3) {
    fprintf(stderr,"Not enough positional arguments to %s.\n",argv[0]);
    return 1;
  }

  srand(time(NULL));

  
  // Handle creating output files and shutting down properly
  llvm_shutdown_obj Y;  // Call llvm_shutdown() on exit.
  
  // LLVM idiom for constructing output file.
  std::unique_ptr<ToolOutputFile> Out;
  std::string ErrorInfo;
  std::error_code EC;
  Out.reset(new ToolOutputFile(OutputFilename.c_str(), EC,
			       sys::fs::OF_None));
  
  EnableStatistics();

  // Read in module
  SMDiagnostic Err;
  std::unique_ptr<Module> M;
  M = parseIRFile(InputFilename, Err, Context);


  if (M.get() == 0) {
    Err.print(argv[0], errs());
    return 1;
  }

  BuildFlip(M.get());
  
  // If we don't yet have an output filename, make one.
  if (OutputFilename.empty()) {
    if (InputFilename == "-")
      OutputFilename = "-";
    else
      {
	OutputFilename = GetFileNameRoot(InputFilename);	
	OutputFilename+=".fi.bc";
      }
  }

  Module::iterator fit, fend;
  Function::iterator bit, bend;
  BasicBlock::iterator it, iend;

  int ctrlInjCnt=0;
  int dataInjCnt=0;

  Module *m = M.get();

  int attempts = 0;

  // Loop until we have injected enough errors.  
  // Based on simple probability, we should eventually escape,
  // but, may need to revisit for a few possible pathological cases
  // that will trigger an infinite loop
  while (ctrlInjCnt+dataInjCnt < NumErrors)     
    {
      attempts++;

      if (attempts > 100*NumErrors) {
	printf("Failed to insert requested number of errors.\n");
	break;
      }
      
      bool injected = false;
      for(fit=m->begin(), fend=m->end(); fit!=fend && !injected; fit++)
	{
	  Function *F = &*fit;

	  if (F->getName() == "assert_ft" || F->getName() == "assert_cfg_ft" || F->getName()=="flip") continue;
	  
	  if(!F->empty())
	    {
	      for(bit=F->begin(),bend=F->end(); bit!=bend && !injected; bit++)
		{
		  BasicBlock *BB = &*bit;
		  
		  for (it=BB->begin(),iend=BB->end(); it!=iend && !injected; it++)
		    {
		      Instruction *I = &*it;
		      int r = rand() % 1023;

		      // pick an instruction with a certain probability. This
		      // helps guarantee we don't pick the same instruction every time
		      if (r < 20) {
			
			// If we are allowed to inject control flow errors
			if (!NoFlowInject)
			  {
			    if( isa<BranchInst>(I) )
			      {
				BranchInst *BI = (BranchInst*)I;
				
				if (BI->isConditional())
				  {
				    Value *V = BI->getCondition();
				    // Invert the condition
				    BinaryOperator *BO = 
				      BinaryOperator::Create(Instruction::Xor,V,ConstantInt::get(V->getType(),1),"fi_inv",I);
				    BI->setCondition(BO);
				    ctrlInjCnt++;
				    injected = true;
				    break;
				  }			    
			      }
			  }

			// If we are allowed to inject data errors
			if (!NoDataInject && !isa<BranchInst>(I) )
			  {
			    // Find an integer operand
			    unsigned i;
			    for(i=0; i<I->getNumOperands(); i++)
			      {
				Value *v = I->getOperand(i);
				if (v->getType()->isIntegerTy() && isa<Instruction>(v) && !isa<PHINode>(v) && v->getType()==IntegerType::get(Context,32))
				  {
				    // inject a 0 or 1 based on random number
				    // note: we may not actually change the behavior
				    // if we replace with the same value.
				    // Since it's probabilistic anyway, no reason to 
				    // check.

				    Instruction *v_I = cast<Instruction>(v);
				    Value *flip = FlipRandomBit(v_I);
				    I->setOperand(i,flip);
				    
				    dataInjCnt++;
				    injected = true;
				    break;
				  }
				
			      } 
			  }     
			    
		      }
		    }
		}	  
	    }
	} 
    }


  legacy::PassManager Passes;
  Passes.add(createVerifierPass());
  Passes.run(*M.get());
  
  WriteBitcodeToFile(*M.get(),Out->os());

  Out->keep();

  return 0;
}


static FunctionCallee Flip;

Value *FlipRandomBit(Instruction *I)
{
  BasicBlock::iterator it(I);
  ++it;
  IRBuilder<> Builder(&*it);  
  std::vector<Value*> args;
  args.push_back(I);
  return Builder.CreateCall(Flip.getFunctionType(),Flip.getCallee(),args,"flip");
}

Value *FlipControlBit(Instruction *I)
{
  BasicBlock::iterator it(I);
  ++it;
  IRBuilder<> Builder(&*it);  
  return Builder.CreateNot(I,"flip");
}



void  BuildFlip(Module *M)
{
  {
    std::vector<Type*> rand_arg_types;
    FunctionType *rand_type = FunctionType::get(IntegerType::get(Context,32), rand_arg_types, true);
    Function::Create(rand_type, Function::ExternalLinkage, "rand", M);
  }

  
  std::vector<Type*> v;
  v.push_back(IntegerType::get(Context,32));

  ArrayRef<Type*> Params(v);
  FunctionType* FunType = FunctionType::get(IntegerType::get(Context,32),Params,false);
  
  Flip = M->getOrInsertFunction("flip",FunType);

  Function *F = cast<Function>(Flip.getCallee());
  // add code to function that does the following:
  // two basic blocks
  // 1. if (arg0 == arg1) return;
	// 2. assert(0);
 
  BasicBlock *BB1 = BasicBlock::Create(Context,"entry",F);

  IRBuilder<> Builder(BB1);
  Value *ret = Builder.CreateCall(F->getParent()->getFunction("rand"));
  ret = Builder.CreateAnd(ret, ConstantInt::get(IntegerType::get(Context,32), 0x1F));
  Builder.CreateRet(Builder.CreateXor(F->getArg(0),Builder.CreateShl(ConstantInt::get(IntegerType::get(Context,32), 1), ret)));
}
