%{
#include <stdio.h> /* para utilizar printf en la sección de reglas */
%}

digito [0-9]
constante {digito}+
%option noyywrap

%%
FLOAT_NUM    [0-9]+\.[0-9]+        { printf("reconocido-FLOAT_NUM\n"); }
INTEGER_NUM  \b[0-9]+\b            { printf("reconocido-INTEGER_NUM\n"); }
LONG_NUM     \b[0-9]+l\b           { printf("reconocido-LONG_NUM\n"); }

ADD_OP       \+                    { printf("reconocido-ADD_OP\n"); }
SUB_OP       -                     { printf("reconocido-SUB_OP\n"); }
DIV_OP       /                     { printf("reconocido-DIV_OP\n"); }
MUL_OP       \*                    { printf("reconocido-MUL_OP\n"); }
ASSIGN_OP    =                     { printf("reconocido-ASSIGN_OP\n"); }

GREATER_THAN >                     { printf("reconocido-GREATER_THAN\n"); }
LESS_THAN    <                     { printf("reconocido-LESS_THAN\n"); }
EQUALS_VAL   ==                    { printf("reconocido-EQUALS_VAL\n"); }
EQUALS_REF   ===                   { printf("reconocido-EQUALS_REF\n"); }

OPEN_PAREN   \(                    { printf("reconocido-OPEN_PAREN\n"); }
CLOSE_PAREN  \)                    { printf("reconocido-CLOSE_PAREN\n"); }
OPEN_BRACE   \{                    { printf("reconocido-OPEN_BRACE\n"); }
CLOSE_BRACE  \}                    { printf("reconocido-CLOSE_BRACE\n"); }
SEMICOLON    ;                     { printf("reconocido-SEMICOLON\n"); }
COLON        :                     { printf("reconocido-COLON\n"); }

CONST_DEF    \bconst\b|\bfinal\b   { printf("reconocido-CONST_DEF\n"); }
FUNC_DEF     \bfct\b               { printf("reconocido-FUNC_DEF\n"); }
VOID_FUNC    \bvoidfct\b           { printf("reconocido-VOID_FUNC\n"); }
RETURN_KEY   \brtn\b               { printf("reconocido-RETURN_KEY\n"); }

PRINT_CMD    \bclg\s*\(\s*\)       { printf("reconocido-PRINT_CMD\n"); }
SCAN_CMD     \bscn\s*\(\s*\)       { printf("reconocido-SCAN_CMD\n"); }
INT_FUNC     \bent\s*\(\s*\)       { printf("reconocido-INT_FUNC\n"); }
FLOAT_FUNC   \bflt\s*\(\s*\)       { printf("reconocido-FLOAT_FUNC\n"); }

STRING_CONCAT \$                  { printf("reconocido-STRING_CONCAT\n"); }
COMMA        ,                     { printf("reconocido-COMMA\n"); }

COND_IF      \bif\b                { printf("reconocido-COND_IF\n"); }
COND_ELSE    \belse\b              { printf("reconocido-COND_ELSE\n"); }
LOOP_WHILE   \bwhile\b             { printf("reconocido-LOOP_WHILE\n"); }
LOOP_FOR     \bfor\b               { printf("reconocido-LOOP_FOR\n"); }

IDENTIFIER   \b[a-zA-Z_][a-zA-Z0-9_]*\b { printf("reconocido-IDENTIFIER\n"); }
STRING_LITERAL "[^"]*"             { printf("reconocido-STRING_LITERAL\n"); }

[ \t\n]+     { /* Ignorar espacios en blanco */ }
.            { printf("Caracter no reconocido: %s\n", yytext); }
%%

int main()
{
    return yylex();
}
