%token MATRIX ADD MUL SUB LP RP assignop comma sc EXIT INPUT OUTPUT
%union 
{
        int number;
        char *string;
}

%token <number> SIZE
%token <string> VAR
%token <string> NUM_LIST

%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char *name[10];
char *d;
char *new;
int m[10];
int n[10];
int cnt=0;
int flag;
int i,x=0,x2=0,x3=0,y=0,y2=0,y3=0;
void yyerror(char *);
int yylex(void);
FILE *fp;
%}

%%

Statements: /* empty */
	    |Statements Declaration  {printf("Declaration Syntax Accepted\n");}
	    |Statements Function     {printf("Operation Syntax Accepted\n");}
	    |Statements Calculation  {printf("Calculation syntax Accepted\n");}
	    |Statements Exit         {exit(0);};

Exit: EXIT			     {fprintf(fp,"\n\n}");}	;

Declaration: MATRIX VAR LP SIZE comma SIZE RP sc  {     i=0;flag=0;
							while(i<cnt)
							{	if(strcmp($2,name[i])==0)
								{flag=1;}
							i++;
							} 
							if(flag==0){
							name[cnt]=$2;m[cnt]=$4;n[cnt]=$6;cnt++;
							fprintf(fp,"\n int %s[%d][%d];",$2,$4,$6);
							
						
							}	
							else {
							printf("Multiple Declaration not Allowed\n");}
						}

	     | MATRIX VAR LP SIZE RP sc {		i=0;flag=0;
							while(i<cnt)
							{	if(strcmp($2,name[i])==0)
								{flag=1;}
							i++;
							} 
							if(flag==0){
							name[cnt]=$2;m[cnt]=$4;n[cnt]=$4;cnt++;
							fprintf(fp,"\n int %s[%d][%d];",$2,$4,$4);
							}	
							else {
							printf("Multiple Declaration not Allowed\n");}
						};		
Function: INPUT LP VAR RP sc	{ 	flag=0;i=0;
					while(i<cnt) 
						{	if(strcmp($3,name[i])==0)
								{flag=1;}
						i++;
						} 
					if(flag==0)
						{printf("Undefined Variable %s\n",$3);}
					else
						{ printf("Semantically Correct\n");
						i=0;
						while(i<cnt) 
						{	if(strcmp($3,name[i])==0)
								{
								fprintf(fp,"\n\n for (int i=0;i<%d;i++)\n{",m[i]);
								fprintf(fp,"\n for (int j=0;j<%d;j++)\n{",n[i]);
								d="%d";
								fprintf(fp,"\n scanf(\"%s\",&%s[i][j]);\n}\n}",d,$3);
								}
								i++;
						} 						

							
						}
					}        


	|OUTPUT LP VAR RP sc	{ 	flag=0;i=0;
					while(i<cnt) 
						{	if(strcmp($3,name[i])==0)
								{flag=1;}
						i++;
						} 
					if(flag==0)
						{printf("Undefined Variable %s\n",$3);}
					else
						{ printf("Semantically Correct\n");
						i=0;
						while(i<cnt) 
						{	if(strcmp($3,name[i])==0)
								{
								fprintf(fp,"\n\n for (int i=0;i<%d;i++)\n{",m[i]);
								fprintf(fp,"\n for (int j=0;j<%d;j++)\n{",n[i]);
								new="\\n";
								fprintf(fp,"\n printf(\"%s\",%s[i][j]);\n}printf(\"%s\");\n}",d,$3,new);
								}
								i++;
						} 						

							
						}
					}          


	| VAR assignop NUM_LIST sc	{
					i=0;flag=0;
							while(i<cnt)
							{	if(strcmp($1,name[i])==0)
								{flag=1;}
							i++;
							} 
							if(flag==0){
							fprintf(fp,"\n int %s = %s;",$1,$3);				
							}	
							else {
							printf("Multiple Declaration not Allowed\n");}
	 
					}; 

Calculation: VAR assignop VAR ADD VAR sc	{i=0;x=0;x2=0;x3=0;y=0;y2=0;y3=0;
							while(i<cnt)
							{	if(strcmp($1,name[i])==0)
									{ x=m[i];y=n[i];}
								if(strcmp($3,name[i])==0)
									{ x2=m[i];y2=n[i];}
								if(strcmp($5,name[i])==0)
									{ x3=m[i];y3=n[i];}
							i++;
							}
						if(x==x2&&x==x3&&y==y2&&y==y3)
							{ 
							printf("Semantically Correct\n");

							fprintf(fp,"\n\n for (int i=0;i<%d;i++)\n{",x);
							fprintf(fp,"\n for (int j=0;j<%d;j++)\n{",y);
							fprintf(fp,"\n %s[i][j] = %s[i][j] + %s[i][j];\n}\n}",$1,$3,$5);

							}
						else{printf("Order of Matrices do not match\n");}
						}
							
		|VAR assignop VAR SUB VAR sc 	{i=0;x=0;x2=0;x3=0;y=0;y2=0;y3=0;
							while(i<cnt)
							{	if(strcmp($1,name[i])==0)
									{ x=m[i];y=n[i];}
								if(strcmp($3,name[i])==0)
									{ x2=m[i];y2=n[i];}
								if(strcmp($5,name[i])==0)
									{ x3=m[i];y3=n[i];}
							i++;
							}
						if(x==x2&&x==x3&&y==y2&&y==y3)
							{ 
							printf("Semantically Correct\n");
							fprintf(fp,"\n\n for (i=0;i<%d;i++)\n{",x);
							fprintf(fp,"\n for (j=0;j<%d;j++)\n{",y);
							fprintf(fp,"\n %s[i][j] = %s[i][j] - %s[i][j];\n}\n}",$1,$3,$5);

							}

						else{printf("Order of Matrices do not match\n");}
						}
		|VAR assignop VAR MUL VAR sc	{i=0;x=0;x2=0;x3=0;y=0;y2=0;y3=0;
							while(i<cnt)
							{	if(strcmp($1,name[i])==0)
									{ x=m[i];y=n[i];}
								if(strcmp($3,name[i])==0)
									{ x2=m[i];y2=n[i];}
								if(strcmp($5,name[i])==0)
									{ x3=m[i];y3=n[i];}
							i++;
							}
						if(y2==x3&&x==x2&&y==y3)
							{ 
							printf("Semantically Correct\n");
							fprintf(fp,"\n\n for (i=0;i<%d;i++)\n{",x);
							fprintf(fp,"\n for (j=0;j<%d;j++)\n{",y);
							fprintf(fp,"\n for (k=0;j<%d;j++)\n{",y2);
							fprintf(fp,"\n %s[i][j] += %s[i][k] * %s[k][j];\n}\n}\n}",$1,$3,$5);

							}
						else{printf("Order of Matrices don't match\n");}
						};


%%

int yywrap()
{
return 1;
}

void yyerror(char *s) {
    printf("%s\n", s);
}

int main(void) {
fp=fopen("proj.c","w");
fprintf(fp,"#include<stdio.h>\n#include<string.h>\n\nvoid main()\n{\nint i,j,k;\n");
    yyparse();
    
}
