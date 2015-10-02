%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
%}

%%
MATRIX 					{return MATRIX;}
INPUT 					{return INPUT;}
OUTPUT 					{return OUTPUT;}
ADD 					{return ADD;}
SUB 					{return SUB;}
MUL 					{return MUL;}
EXIT					{return EXIT;}	
[a-zA-Z][a-zA-Z]* 			{yylval.string=strdup(yytext);return VAR;}
"(" 					{return LP;}
")" 					{return RP;}
[0-9][0-9]* 				{yylval.number=atoi(yytext); return SIZE;}
:= 					{return assignop;} 
, 					{return comma;}
; 					{return sc;}
"{"("{"[0-9][0-9]*(,[0-9][0-9]*)*"}")(,"{"[0-9][0-9]*(,[0-9][0-9]*)*"}")*"}" 	{yylval.string=strdup(yytext);return NUM_LIST;}
[\n \t]+ 						;
%%



