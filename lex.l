%{
/* Definition section */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "y.tab.h"
extern int yylval;
char* token;
%}

/* Rule Section */
%%

[0-9]+ {
		yylval=atoi(yytext);
		return NUMBER;	
	}
MS2 {

}
CONSTANT {

return IDENTIFIER;
}
REST {

return IDENTIFIER;
}
ACCELARATION|SPEED|VELOCITY|TIME|DISTANCE {printf("%s is KEYWORD\n",yytext);}


[\t] ;
" " ;
[\n] return 0;

. {}

%%
int yywrap()
{
 return 1;
}