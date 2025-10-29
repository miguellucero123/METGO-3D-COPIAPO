#!/usr/bin/env python3
"""
Servidor HTTP simple para servir archivos HTML locales
Útil para abrir weatherlocal_completo.html sin problemas de seguridad del navegador
"""

import http.server
import socketserver
import webbrowser
import os
import sys

PORT = 8000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Agregar headers CORS para permitir recursos externos
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Cache-Control', 'no-store, no-cache, must-revalidate')
        super().end_headers()

def main():
    # Verificar que estamos en el directorio correcto
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    if not os.path.exists('weatherlocal_completo.html'):
        print("Error: No se encuentra weatherlocal_completo.html")
        print("Asegúrate de estar en la carpeta correcta.")
        sys.exit(1)
    
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        print("=" * 50)
        print(f"Servidor HTTP iniciado en el puerto {PORT}")
        print("=" * 50)
        print(f"\n📂 Sirviendo archivos desde: {os.getcwd()}")
        print(f"\n🌐 Abriendo navegador...")
        print(f"\n📄 URL: http://localhost:{PORT}/weatherlocal_completo.html")
        print(f"\n⚠️  Presiona Ctrl+C para detener el servidor\n")
        
        # Abrir el navegador automáticamente
        url = f"http://localhost:{PORT}/weatherlocal_completo.html"
        webbrowser.open(url)
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n\n🛑 Deteniendo servidor...")
            print("✅ Servidor detenido correctamente.")

if __name__ == "__main__":
    main()

