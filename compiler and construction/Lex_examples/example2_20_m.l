%{
/* a LEX program that adds line numbers
   to lines of text, printing the new text
   to the standard output
*/
#include <stdio.h>
int lineno = 1;
%}
line .*\n
%option noyywrap
%%

{line} { printf("%5d %s", lineno++, yytext); }
%%

/* Input filename can be passed as a command line argument */
int main(int argc, char *argv[])
{ 
	FILE *inF;
	if (argc == 2 && (inF = fopen(argv[1], "r")))
		yyin = inF;

	yylex();

	if (inF) fclose(inF);
	return 0;
}
