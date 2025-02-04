import tkinter as tk
from tkinter import ttk, scrolledtext
from lexer import LexicalScanner  # ✅ Importa correctamente el lexer

class LexicalAnalyzerApp:
    def __init__(self):
        self.scanner = LexicalScanner()
        self.create_ui()

    def create_ui(self):
        """Configura la interfaz gráfica con un diseño optimizado."""
        self.window = tk.Tk()
        self.window.title("🔍 Analizador Léxico")
        self.window.geometry("850x650")
        self.window.configure(bg="#1e1e1e")

        main_container = tk.Frame(self.window, bg="#252526", padx=10, pady=10)
        main_container.pack(fill="both", expand=True, padx=15, pady=15)

        tk.Label(main_container, text="Analizador Léxico", font=("Arial", 16, "bold"), fg="#ffffff", bg="#252526").pack(pady=5)

        input_container = tk.Frame(main_container, bg="#252526")
        input_container.pack(fill="both", expand=True, padx=10, pady=5)

        self.source_code_input = scrolledtext.ScrolledText(
            input_container, width=80, height=10, font=("Consolas", 12), bg="#1e1e1e", fg="#ffffff",
            insertbackground="white", borderwidth=2, relief="flat"
        )
        self.source_code_input.pack(fill="both", expand=True, padx=5, pady=5)

        self.analyze_btn = tk.Button(
            main_container, text="🔍 Analizar Código", font=("Arial", 12, "bold"),
            fg="white", bg="#007acc", padx=20, pady=8, borderwidth=0, relief="flat",
            command=self.execute_analysis
        )
        self.analyze_btn.pack(pady=8)
        self.analyze_btn.bind("<Enter>", lambda e: self.analyze_btn.config(bg="#005f99"))
        self.analyze_btn.bind("<Leave>", lambda e: self.analyze_btn.config(bg="#007acc"))

        self.setup_results_ui(main_container)

    def setup_results_ui(self, parent):
        """Configura la sección de resultados con una mejor organización visual."""
        results_container = tk.Frame(parent, bg="#252526")
        results_container.pack(fill="both", expand=True, padx=10, pady=5)

        ttk.Separator(results_container, orient="horizontal").pack(fill="x", pady=5)

        tk.Label(results_container, text="Tokens Generados ✅", font=("Arial", 14, "bold"), fg="#32cd32", bg="#252526").pack(pady=5)
        self.tokens_view = ttk.Treeview(results_container, columns=("Línea", "Tipo", "Valor"), show="headings", height=7)
        self.tokens_view.heading("Línea", text="Línea")
        self.tokens_view.heading("Tipo", text="Tipo")
        self.tokens_view.heading("Valor", text="Valor")
        self.tokens_view.pack(fill="both", expand=True, padx=10, pady=5)

        tk.Label(results_container, text="Errores Léxicos ❌", font=("Arial", 14, "bold"), fg="#ff6347", bg="#252526").pack(pady=5)
        self.error_view = ttk.Treeview(results_container, columns=("Línea", "Caracter"), show="headings", height=5)
        self.error_view.heading("Línea", text="Línea")
        self.error_view.heading("Caracter", text="Caracter")
        self.error_view.pack(fill="both", expand=True, padx=10, pady=5)

    def execute_analysis(self):
        """Ejecuta el análisis léxico y muestra los resultados."""
        source_text = self.source_code_input.get("1.0", tk.END)
        tokens, errors = self.scanner.scan_code(source_text)

        for row in self.tokens_view.get_children():
            self.tokens_view.delete(row)
        for row in self.error_view.get_children():
            self.error_view.delete(row)

        for token in tokens:
            self.tokens_view.insert("", tk.END, values=token)
        for error in errors:
            self.error_view.insert("", tk.END, values=error)

    def start(self):
        """Ejecuta la interfaz gráfica."""
        self.window.mainloop()
