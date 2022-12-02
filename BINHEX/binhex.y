%{
    #include<string.h>
    #include<stdlib.h>
    #include<stdio.h>
    extern int yylex();
    int n, k, i, j ; 
    char sg[][k] ;
    char* s;
%}
%token <cadbin> BIN
%type <cadbin> OUT
%union {
    char* cadbin;
}
%%
    S: OUT {
        n = strlen($1) ;
        masbit($1, k) ;
        j = k - 1 ;
        for(i = n - 1; i >= 0; i--) {
            while(j >= 0) {
                sg[i][j] = $1[i];
                if(i == (j * 4) - 1) {
                    j-- ;
                }
                printf("%s", sg[i][j]);
            }
        }
    }
    ;
    OUT: BIN {$$ = $1;};
%%
char* masbit(char* $1, int k) {
    if(n % 4 == 0) {
        k = n / 4 ;
    }
    else {
        return masbit(strcat('0',$1), k) ;
    }
    return $1;
}
int yyerror(char* mensaje) {
    printf("Error...\n");
    exit(-1);
}
main() {
    printf("*********************BINARIO HEXADECIMAL*********************");
    printf("\nIngrese los digitos binarios a convertir:");
    yyparse();
}
