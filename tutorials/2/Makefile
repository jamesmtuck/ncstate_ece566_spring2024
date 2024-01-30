.PHONY: all clean

LLVMCONFIG=llvm-config-17
CXX = clang++-17
CXXFLAGS = -g -Wall -Wno-deprecated-register \
           -Wno-unneeded-internal-declaration \
           -Wno-unused-function

all:
	flex -o expr.lex.cpp expr.lex
	bison -d -o expr.y.cpp expr.y
	$(CXX) $(CXXFLAGS) -c -o expr.lex.o expr.lex.cpp `$(LLVMCONFIG) --cppflags`
	$(CXX) $(CXXFLAGS) -c -o expr.y.o expr.y.cpp `$(LLVMCONFIG) --cppflags`
	$(CXX) $(CXXFLAGS) -o t2 expr.y.o expr.lex.o  `$(LLVMCONFIG) --ldflags --libs --system-libs`

clean:
	rm -Rf t2 expr.lex.cpp expr.y.cpp expr.y.hpp *.o *~
