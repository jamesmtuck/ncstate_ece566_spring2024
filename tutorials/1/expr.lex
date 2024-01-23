%{
#include <stdio.h>
#include <iostream>
#include <math.h>

#include "expr.y.hpp"


#define print quiet

void quiet(const char *, ...) {
}
  
%}


%option noyywrap

%% // begin tokens

[ \n\t]    // ignore a space, a tab, a newline

[Rr][0-7]   {
  print("REG %s\n", yytext);
  yylval.reg = yytext[1] - '0'; 
  return REG;
 }

[0-9]+      {
  print("IMMEDIATE %s\n",yytext);
  yylval.imm = atoi(yytext);
  return IMMEDIATE;
}
          
"="         { print("ASSIGN\n"); return ASSIGN; }

;         { print("SEMI\n"); return SEMI;    }
"("       { print("LPAREN\n"); return LPAREN;  }
")"       { print("RPAREN\n"); return RPAREN;  }
"["       { print("LBRACKET\n"); return LBRACKET; }
"]"       { print("RBRACKET\n"); return RBRACKET; }
"-"       { print("MINUS\n"); return MINUS;   }
"+"       { print("PLUS\n");   return PLUS;  }


"//".*\n  

.         {   // If we match anything unexpected, just exit the scanner and report an error.
              printf("syntax error!\n"); exit(1);
          }

%% // end tokens


// put more C code that I want in the final scanner

#ifdef SCANNER_ONLY

// This is the main function when we compile just the scanner: make scanner
int main(int argc, char *argv[])
{
  // all the rules above are combined into a single function called yylex, we call it to trigger
  // the scanner to read the input and match tokens:

  yylex();
  // yylex has a return value, but we ignore it for now.
 
  return 0;
}

#endif
