%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
FILE *yyin;

// Declaraciones de funciones
int fn_verificarRango(char* ptr);
int yyerror(void);
%}

/SECCION DE OPCIONES/
%option noyywrap
%option yylineno

/* SECCION TOKENS */
DIGITO          [0-9]
LETRA           [a-zA-Z]
ESPACIO         [ \t]

FLOAT_NUM      {DIGITO}+\.{DIGITO}+
INTEGER_NUM    \b{DIGITO}+\b
LONG_NUM       \b{DIGITO}+l\b

ADD_OP         \+
SUB_OP         -
DIV_OP         /
MUL_OP         \*
ASSIGN_OP      =

GREATER_THAN   >
LESS_THAN      <
EQUALS_VAL     ==
EQUALS_REF     ===

OPEN_PAREN     \(
CLOSE_PAREN    \)
OPEN_BRACE     \{
CLOSE_BRACE    \}
SEMICOLON      ;
COLON          :

CONST_DEF      \bconst\b|\bfinal\b
FUNC_DEF       \bfct\b
VOID_FUNC      \bvoidfct\b
RETURN_KEY     \brtn\b

PRINT_CMD      \bclg\s*\(\s*\)
SCAN_CMD       \bscn\s*\(\s*\)
INT_FUNC       \bent\s*\(\s*\)
FLOAT_FUNC     \bflt\s*\(\s*\)

STRING_CONCAT  \$
COMMA          ,

COND_IF        \bif\b
COND_ELSE      \belse\b
LOOP_WHILE     \bwhile\b
LOOP_FOR       \bfor\b

IDENTIFIER     \b{LETRA}({LETRA}|{DIGITO}|_)*\b
STRING_LITERAL "[^"]*"

%%
{FLOAT_NUM}      {printf("\nFLOAT_NUM (%s)", yytext);}
{INTEGER_NUM}    {printf("\nINTEGER_NUM (%s)", yytext);}
{LONG_NUM}       {printf("\nLONG_NUM (%s)", yytext);}

{ADD_OP}        {printf("\nADD_OP (%s)", yytext);}
{SUB_OP}        {printf("\nSUB_OP (%s)", yytext);}
{DIV_OP}        {printf("\nDIV_OP (%s)", yytext);}
{MUL_OP}        {printf("\nMUL_OP (%s)", yytext);}
{ASSIGN_OP}     {printf("\nASSIGN_OP (%s)", yytext);}

{GREATER_THAN}  {printf("\nGREATER_THAN (%s)", yytext);}
{LESS_THAN}     {printf("\nLESS_THAN (%s)", yytext);}
{EQUALS_VAL}    {printf("\nEQUALS_VAL (%s)", yytext);}
{EQUALS_REF}    {printf("\nEQUALS_REF (%s)", yytext);}

{OPEN_PAREN}    {printf("\nOPEN_PAREN (%s)", yytext);}
{CLOSE_PAREN}   {printf("\nCLOSE_PAREN (%s)", yytext);}
{OPEN_BRACE}    {printf("\nOPEN_BRACE (%s)", yytext);}
{CLOSE_BRACE}   {printf("\nCLOSE_BRACE (%s)", yytext);}
{SEMICOLON}     {printf("\nSEMICOLON (%s)", yytext);}
{COLON}         {printf("\nCOLON (%s)", yytext);}

{CONST_DEF}     {printf("\nCONST_DEF (%s)", yytext);}
{FUNC_DEF}      {printf("\nFUNC_DEF (%s)", yytext);}
{VOID_FUNC}     {printf("\nVOID_FUNC (%s)", yytext);}
{RETURN_KEY}    {printf("\nRETURN_KEY (%s)", yytext);}

{PRINT_CMD}     {printf("\nPRINT_CMD (%s)", yytext);}
{SCAN_CMD}      {printf("\nSCAN_CMD (%s)", yytext);}
{INT_FUNC}      {printf("\nINT_FUNC (%s)", yytext);}
{FLOAT_FUNC}    {printf("\nFLOAT_FUNC (%s)", yytext);}

{STRING_CONCAT} {printf("\nSTRING_CONCAT (%s)", yytext);}
{COMMA}         {printf("\nCOMMA (%s)", yytext);}

{COND_IF}       {printf("\nCOND_IF (%s)", yytext);}
{COND_ELSE}     {printf("\nCOND_ELSE (%s)", yytext);}
{LOOP_WHILE}    {printf("\nLOOP_WHILE (%s)", yytext);}
{LOOP_FOR}      {printf("\nLOOP_FOR (%s)", yytext);}

{IDENTIFIER}    {printf("\nIDENTIFIER (%s)", yytext);}
{STRING_LITERAL}{printf("\nSTRING_LITERAL (%s)", yytext);}

[ \t\n]+        { /* Ignorar espacios en blanco */ }
.               { yyerror(); }
%%

int main(int argc, char *argv[]) {
    if ((yyin = fopen(argv[1], "rt")) == NULL) {
        printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
        return 1;
    }
    else {
        printf("\nEl archivo %s se abrio correctamente\n", argv[1]);
        yylex();
    }
    printf("\nFLEX Finalizo la lectura del archivo %s \n", argv[1]);
    fclose(yyin);
    return 0;
}

int fn_verificarRango(char* ptr) {
    int value = atoi(ptr);
    if (value < -32768 || value > 32767) {
        printf("\nError: variable fuera de rango: %s", yytext);
        return yyerror();
    }
    return 0;
}

int yyerror(void) {
    printf("\nError lexico: Caracter invalido: %s, saliendo ...\n", yytext);
    exit(1);
}
