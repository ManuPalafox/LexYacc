❯ cat al.l
%{
#include "y.tab.h"
%}

%%
[01]* {yylval.cadbin = yytext; return BIN;}
. {return yytext[0];}
%%

int yywrap() {
    return 1 ;
}%   
