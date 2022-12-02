❯ cat al.l
%{
#include "y.tab.h"
%}

%%
[01]* { yylval.ca = yytext; return A;}
. {return yytext[0];}
%%

int yywrap() {
    return 1;
}% 
