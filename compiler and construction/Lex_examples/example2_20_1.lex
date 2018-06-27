	/* Definition Section */
%{
/* a LEX program that adds line numbers
   to lines of text, printing the new text
   to the standard output
*/
#include <stdio.h>
int lineno = 1;
%option noyywrap
%}

line .*\n
%%

	/* Rules Section */
{line} { printf("%5d %s", lineno++, yytext); }
%%

	/* Auxiliary, C-code, Section */
int main() { yylex(); return 0; }
