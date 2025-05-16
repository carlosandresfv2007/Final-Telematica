from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return 'Bienvenido al curso de Telemática PRUEBA CI/CD, ULTIMA ENTREGA'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8090)
