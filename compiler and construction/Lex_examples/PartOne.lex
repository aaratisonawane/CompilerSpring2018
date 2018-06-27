/* Name: Aarati Sonawane */
/* 700#: 700675608 */
%{
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
int lineno = 0;
int wordno = 0;
int charno = 0;
%}
line \n
letter [a-zA-Z]
digit [0-9]
word ({letter}|{digit})+
character .
%option noyywrap
%%
{line} { lineno++; }
{word} { wordno++, charno += strlen(yytext); }
{character} { charno++; }
%%
int main(int argc, char *argv[]){
if (argc == 2){
yyin = fopen(argv[1], "r");
yylex();
printf("Number of characters : %d\n", charno);
printf("Number of words : %d\n", wordno);
printf("Number of lines : %d\n", lineno);
return 0;
}
}


