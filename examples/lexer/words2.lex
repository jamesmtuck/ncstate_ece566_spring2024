%{
#include <stdio.h>  
%}


%%

.                        //
int                      printf("int\n");
for                      printf("for\n");
while                    printf("while\n");
[a-zA-Z_][a-zA-Z0-9_]*   printf("id\n");

%%
