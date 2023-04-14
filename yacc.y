%{
/* Definition section */
#include<stdio.h>
int flag=0;
float half=0.5f;
%}

%token NUMBER
%token IDENTIFIER

/* Rule Section */
%%


ArithmeticExpression: E {

		printf("\n ANS IS = %d \n",$$ );

		return 0;
};

   
E: IDENTIFIER NUMBER NUMBER IDENTIFIER {
 $$=half*$2*$3*$3;
} 
|IDENTIFIER NUMBER NUMBER {
 $$= $2*$3*1.0;
}

|NUMBER NUMBER NUMBER IDENTIFIER {
$$=$1*$3*1.0 + half*$2*$3*$3*1.0;


}
|NUMBER NUMBER NUMBER  {$$=$2*$3+$1;}



;
	
%%

void main()
{
   printf("\n PhyGPT\n");
  
   yyparse();
   if(flag==0)
   printf("\nYay Your Question is Correct.\n\n");
}
  
void yyerror()
{
   printf("\n Oops Your Question is wrong\n\n");
   flag=1;
}

