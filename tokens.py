class TokenSpecs:
    TOKEN_LIST = [
        ("FLOAT_NUM", r"\d+\.\d+"),  
        ("INTEGER_NUM", r"\b\d+\b"),  
        ("LONG_NUM", r"\b\d+l\b"),  

        # Operadores
        ("ADD_OP", r"\+"),
        ("SUB_OP", r"-"),
        ("DIV_OP", r"/"),
        ("MUL_OP", r"\*"),
        ("ASSIGN_OP", r"="),

        # Comparaciones
        ("GREATER_THAN", r">"),  
        ("LESS_THAN", r"<"),  
        ("EQUALS_VAL", r"=="),
        ("EQUALS_REF", r"==="),

        # Paréntesis y delimitadores
        ("OPEN_PAREN", r"\("),
        ("CLOSE_PAREN", r"\)"),
        ("OPEN_BRACE", r"\{"),
        ("CLOSE_BRACE", r"\}"),
        ("SEMICOLON", r";"),
        ("COLON", r":"),

        # Constantes y funciones
        ("CONST_DEF", r"\bconst\b|\bfinal\b"),
        ("FUNC_DEF", r"\bfct\b"),
        ("VOID_FUNC", r"\bvoidfct\b"),
        ("RETURN_KEY", r"\brtn\b"),

        # Entrada y salida
        ("PRINT_CMD", r"\bclg\s*\(\s*\)"),
        ("SCAN_CMD", r"\bscn\s*\(\s*\)"),
        ("INT_FUNC", r"\bent\s*\(\s*\)"),
        ("FLOAT_FUNC", r"\bflt\s*\(\s*\)"),

        # Concatenación y separador
        ("STRING_CONCAT", r"\$"),
        ("COMMA", r","),

        # Condicionales y Bucles
        ("COND_IF", r"\bif\b"),
        ("COND_ELSE", r"\belse\b"),
        ("LOOP_WHILE", r"\bwhile\b"),
        ("LOOP_FOR", r"\bfor\b"),

        # Identificadores y literales
        ("IDENTIFIER", r"\b[a-zA-Z_][a-zA-Z0-9_]*\b"),
        ("STRING_LITERAL", r'"[^"]*"'),

        # Espacios (ignorar)
        ("WHITESPACE", r"[ \t\n]+"),
    ]

    @classmethod
    def fetch_tokens(cls):
        return cls.TOKEN_LIST
