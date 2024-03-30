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

static LLVMContext Context;

LLVMContext& getGlobalContext() {
  return Context;
}


static void SoftwareFaultTolerance(Module *);

static void print_csv_file(std::string outputfile);

static cl::opt<std::string>
        InputFilename(cl::Positional, cl::desc("<input bitcode>"), cl::Required, cl::init("-"));

static cl::opt<std::string>
        OutputFilename(cl::Positional, cl::desc("<output bitcode>"), cl::Required, cl::init("out.bc"));

static cl::opt<bool>
        NoSWFT("no-swft",
              cl::desc("Do not perform SWFT."),
              cl::init(false));

static cl::opt<bool>
        Verbose("verbose",
                    cl::desc("Verbose stats."),
                    cl::init(false));

static cl::opt<bool>
        NoCheck("no",
                cl::desc("Do not check for valid IR."),
                cl::init(false));


void RunO2(Module *M);
void BuildHelperFunctions(Module *);
void summarize(Module *M);
FunctionCallee AssertFT;
FunctionCallee AssertCFG;

int main(int argc, char **argv) {
    // Parse command line arguments
    cl::ParseCommandLineOptions(argc, argv, "llvm system compiler\n");

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

    // If errors, fail
    if (M.get() == 0)
    {
        Err.print(argv[0], errs());
        return 1;
    }

    // Run O2 optimizations
    RunO2(M.get());
  
    if (!NoSWFT) {
      BuildHelperFunctions(M.get());      
      SoftwareFaultTolerance(M.get());
    }

    // Collect statistics on Module
    summarize(M.get());
    print_csv_file(OutputFilename);

    if (Verbose)
        PrintStatistics(errs());

    // Verify integrity of Module, do this by default
    if (!NoCheck)
    {
        legacy::PassManager Passes;
        Passes.add(createVerifierPass());
        Passes.run(*M.get());
    }

    // Write final bitcode
    WriteBitcodeToFile(*M.get(), Out->os());
    Out->keep();

    return 0;
}

static void print_csv_file(std::string outputfile)
{
    std::ofstream stats(outputfile + ".stats");
    auto a = GetStatistics();
    for (auto p : a) {
        stats << p.first.str() << "," << p.second << std::endl;
    }
    stats.close();
}

// Collect this statistic; increment for each instruction you add.
static llvm::Statistic SWFTAdded = {"", "SWFTadd", "SWFT added instructions"};



static void SoftwareFaultTolerance(Module *M) {
  Module::FunctionListType &list = M->getFunctionList();

  std::vector<Function*> flist;
  // FIND THE ASSERT FUNCTIONS AND DO NOT INSTRUMENT THEM
  for(Module::FunctionListType::iterator it = list.begin(); it!=list.end(); it++) {
    Function *fptr = &*it;
    if (fptr->size() > 0 && fptr != AssertFT.getCallee() && fptr != AssertCFG.getCallee())
      flist.push_back(fptr);
  }

  // PROTECT CODE IN EACH FUNCTION
  for(std::vector<Function*>::iterator it=flist.begin(); it!=flist.end(); it++)
    {
      // CALL A FUNCTION TO REPLICATE CODE in *it
    }
}




