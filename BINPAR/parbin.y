%{
    #include <string.h>
    #include <stdlib.h>
    #include <stdio.h>
    extern int yylex();
    int cx, cy, i, n;

%}

%union {
    char* ca ;
}

%token <ca> A
%type <ca> O

%%
    S: O {
        cx = 0 ;
        cy = 0 ;

        n = strlen($1) ;

        for(i=0; i<n; i++) {
            if($1[i]=='0') cx++ ;
            else if($1[i]=='1') cy++ ;
        }
        if(cx % 2 == 0 || cy % 2 == 0) {
            printf("Cadena aceptada", $1);
            exit(-1) ;
        }
        else {
            printf("Cadena rechazada", $1);
            exit(-1);
        }
    } ;
    O: A {$$ = $1;}
    ;
%%

int yyerror(char* mensaje) {
    printf("Error...\n");
    exit(-1);
}

main() {
    printf("*************************NUMEROS PARES BINARIOS****************************");
    printf("Ingrese el numero binario con par de 0's y 1's");
    yyparse();
}