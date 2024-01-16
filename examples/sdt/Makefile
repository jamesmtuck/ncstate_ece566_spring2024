LLVMCONFIG=llvm-config-17

LLVMINCLUDE=$(shell $(LLVMCONFIG) --includedir)

LLVMLIBS=$(shell $(LLVMCONFIG) --libs --system-libs)
LLVMLIBDIR=$(shell $(LLVMCONFIG) --libdir)

all:
	@bison -y -d -o calc.y.c calc.y
	@flex -ocalc.lex.c calc.lex
	@clang++-17  $(shell $(LLVMCONFIG) --cxxflags --ldflags) -m64 -I$(LLVMINCLUDE) -L$(LLVMLIBDIR) -o calc main.c calc.y.c calc.lex.c -ll $(LLVMLIBS)
	@echo [Built calc.]
clean:
	@rm -Rf calc.lex.c calc.y.c calc.y.h calc *~ *.bc *.ll
	@echo [Clean.]
