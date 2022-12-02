%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	extern int yylex();
	
	void yyerror(char *msg);
	int flag;
	
	int i;
	int k =0;	
%}

%union {
	char* f;
}

%token <f> STR
%type <f> E

%%

S : E {
		flag = 0;
        k = strlen($1) - 1;
        if (k % 2 != 0) {

            for (i = 0; i <= k / 2; i++) {
                if ($1[i] == $1[k - i]) {} else {
                    flag = 1;
                }
            }
             if (flag == 1) printf("%s no es capicua\n", $1);
                else printf("%s si es capicua\n", $1);

            exit(0);

        } else {

            for (i = 0; i < k / 2; i++) {
                if ($1[i] == $1[k - i]) {} else {
                    flag = 1;
                }
            }
            if (flag == 1) printf("El numero no es capicua\n", $1);
            else printf("El numero es capicua", $1);

            exit(0);

        }
	}
;

E : STR {$$ = $1;}
;

%%

void yyerror(char *msg) {
	fprintf(stderr, "%s\n", msg);
	exit(1);
}

int main() {
    printf("**************Programa 3 Numeros Capicua******************* ");
    printf("Digite un numero del 1 al 1000:");
	yyparse();
	return 0;
}
