%{
#include <stdio.h>
#include <iostream>
#include <math.h>
%}


%option noyywrap

%% // begin tokens

[ \n\t]    // ignore a space, a tab, a newline

[Rr][0-7]   { printf("REG %s\n", yytext); }

[0-9]+      { printf("IMMEDIATE %s\n",yytext); }
          
"="         { printf("ASSIGN\n"); }

;         { printf("SEMI\n");     }
"("       { printf("LPAREN\n");   }
")"       { printf("RPAREN\n");   }
"["       { printf("LBRACKET\n"); }
"]"       { printf("RBRACKET\n"); }
"-"       { printf("MINUS\n");    }
"+"       { printf("PLUS\n");     }


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
