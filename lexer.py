import re
from tokens import TokenSpecs  # ✅ Asegura que el nombre del archivo sea tokens.py

class LexicalScanner:
    def __init__(self):
        self.token_patterns = TokenSpecs.fetch_tokens()
    def scan_code(self, source_code):
        valid_tokens = []  
        lexical_errors = []  
        current_pos = 0  
        current_line = 1  

        while current_pos < len(source_code):
            match_found = None
            for token_type, pattern in self.token_patterns:
                regex = re.compile(pattern)
                match_found = regex.match(source_code, current_pos)

                if match_found:
                    lexeme = match_found.group(0)
                    if token_type != "WHITESPACE":  
                        valid_tokens.append((current_line, token_type, lexeme))
                    current_pos = match_found.end()
                    break

            if not match_found:
                lexical_errors.append((current_line, source_code[current_pos]))
                current_pos += 1  

            if source_code[current_pos - 1] == "\n":
                current_line += 1  

        return valid_tokens, lexical_errors
