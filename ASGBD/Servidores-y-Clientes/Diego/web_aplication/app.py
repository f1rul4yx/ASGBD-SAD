#!/usr/bin/env python
# Shebang: indica al sistema que este fichero debe ejecutarse con el intérprete de Python
# (útil si ejecutas el script directamente en sistemas Unix: ./app.py).

from flask import Flask, render_template, request, session, redirect, url_for
# from flask import ...
# - Flask: clase que crea la aplicación web.
# - render_template: función para renderizar plantillas HTML Jinja2 (templates/*.html).
# - request: objeto que representa la petición HTTP entrante (datos del formulario, método, etc.)
# - session: diccionario seguro para guardar datos por sesión (se almacena en cookie firmada).
# - redirect: para redirigir a otra ruta.
# - url_for: genera la URL para una función de vista (útil para no hardcodear rutas).

from pymongo import MongoClient
from pymongo.errors import OperationFailure
# PyMongo:
# - MongoClient: cliente que gestiona la conexión con el servidor MongoDB.
# - OperationFailure: excepción que PyMongo lanza cuando una operación falla (p. ej. auth fallida).

import os
# Usamos os para generar la clave secreta de la sesión con os.urandom()

app = Flask(__name__)
# Creamos la aplicación Flask.
# __name__ permite a Flask saber la ubicación del módulo para cargar templates, static, etc.

app.secret_key = os.urandom(24)
# secret_key: clave necesaria para firmar cookies de sesión.
# - Se usa para proteger la integridad de session.
# - os.urandom(24) genera 24 bytes aleatorios cada vez que arranques la app.
#   -> Nota: eso invalida sesiones al reiniciar la app (ok en desarrollo).
#   -> En producción querrás una clave persistente (no generarla cada arranque).



@app.route('/')
def index():
    # Ruta raíz: muestra la página principal (index.html).
    # render_template busca templates/index.html y lo devuelve como HTML al navegador.
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    # Ruta /login que admite GET y POST:
    # - GET: mostrar formulario de login.
    # - POST: procesar los datos enviados por el formulario.

    # Datos de configuración de la conexión al servidor MongoDB.
    # En este ejemplo están hardcodeados en la función; podrías moverlos a config.py o variables de entorno.
    MONGODB_HOST = '192.168.122.187'
    MONGODB_PORT = '27017'
    MONGODB_DATABASE = 'db'

    # request.method contiene el método HTTP usado (GET o POST).
    if request.method == 'POST':
        # Si es POST, leemos los valores del formulario. Los nombres 'username' y 'password'
        # deben coincidir con los atributos name="" de los inputs del formulario en login.html.
        usuario = request.form['username']
        password = request.form['password']

        # Construimos la URI de conexión a MongoDB usando las credenciales que el usuario introdujo.
        # authSource indica la base de datos donde se creó el usuario (importante para la autenticación).
        uri = f"mongodb://{usuario}:{password}@{MONGODB_HOST}:{MONGODB_PORT}/?authSource={MONGODB_DATABASE}"

        try:
            # Intentamos crear un cliente PyMongo usando la URI. serverSelectionTimeoutMS define
            # el tiempo máximo en ms para intentar conectar al servidor (evita bloqueos largos).
            client = MongoClient(uri, serverSelectionTimeoutMS=2000)

            # db aquí es un objeto Database (no una colección). Accedemos a la base de datos MONGODB_DATABASE.
            db = client[MONGODB_DATABASE]

            # list_collection_names() fuerza a PyMongo a comunicarse con el servidor y, por tanto,
            # también obliga a que la autenticación ocurra ahora. Si las credenciales son inválidas,
            # PyMongo lanzará una OperationFailure al intentar esta operación.
            colecciones = db.list_collection_names()

            # Si hemos llegado hasta aquí, la autenticación ha sido correcta y el usuario puede listar colecciones.
            # Guardamos las credenciales en la sesión para poder reutilizarlas en otras rutas sin pasarlas por la URL.
            # Nota de seguridad: esto está bien en entorno de laboratorio controlado; en producción es preferible
            # soluciones más sólidas (tokens, no almacenar contraseñas en sesión, cifrado, etc.)
            session['usuario'] = usuario
            session['password'] = password

            # Renderizamos la plantilla collections.html pasando:
            # - usuario: nombre del usuario autenticado (para mostrar en la UI).
            # - colecciones: lista de nombres de colecciones accesibles para ese usuario.
            return render_template(
                'collections.html',
                usuario=usuario,
                colecciones=colecciones
            )
        
        except OperationFailure:
            # Si la autenticación falla o el usuario no tiene permisos, entramos aquí.
            # Mostramos de nuevo la página de login con un mensaje de error.
            return render_template('login.html', error="Usuario o contraseña incorrectos.")
        except Exception as e:
            # Capturamos cualquier otra excepción (timeout, host inaccesible, errores de red, etc.)
            # NOTA: en producción evita mostrar el error crudo al usuario (potencial fuga de información).
            return render_template('login.html', error=f"Error de conexión: {e}")

    # Si no es POST (es GET), simplemente mostramos el formulario de login.
    return render_template('login.html')

@app.route('/coleccion/<nombre>')
def ver_coleccion(nombre):
    # Ruta para ver los documentos de una colección concreta.
    # <nombre> es parte de la URL y Flask lo pasa como argumento a la función.

    # Mismos parámetros de conexión (podrías centralizarlos).
    MONGODB_HOST = '192.168.122.187'
    MONGODB_PORT = '27017'
    MONGODB_DATABASE = 'db'

    # Recuperamos credenciales de la sesión. Si no existen, redirigimos al login.
    usuario = session.get('usuario')
    password = session.get('password')

    # Si no hay credenciales guardadas, el usuario no ha hecho login: redirigimos.
    if not usuario or not password:
        # redirect(url_for('login')) redirige al endpoint 'login' (evita hardcodear '/login').
        return redirect(url_for('login'))

    # Construimos nuevamente la URI con las credenciales guardadas en la sesión.
    uri = f"mongodb://{usuario}:{password}@{MONGODB_HOST}:{MONGODB_PORT}/?authSource={MONGODB_DATABASE}"

    try:
        # Creamos el cliente y accedemos a la base de datos.
        client = MongoClient(uri, serverSelectionTimeoutMS=2000)
        db = client[MONGODB_DATABASE]

        # db[nombre] accede a la colección cuyo nombre es 'nombre'.
        # .find() devuelve un cursor; list(...) lo consume y devuelve una lista de documentos.
        # IMPORTANTE: aquí se asume que el usuario tiene permisos para leer esa colección.
        documentos = list(db[nombre].find())

        # Renderizamos la plantilla que muestra los documentos. Pasamos:
        # - nombre: nombre de la colección (para mostrar en título).
        # - documentos: lista de documentos (cada doc es un dict / BSON -> convertido por Jinja al render).
        # - usuario: opcionalmente pasada para mostrar quién está viendo los datos.
        return render_template(
            'documents.html',
            nombre=nombre,
            documentos=documentos,
            usuario=usuario
        )
    
    except OperationFailure:
        # Si el usuario no tiene permiso para esta colección, PyMongo lanzará OperationFailure.
        # En ese caso devolvemos el login con un mensaje (podrías hacer una página de "403" dedicada).
        return render_template('login.html', error="No tienes permiso para acceder a esta colección.")
    except Exception as e:
        # Otros errores (p. ej. colección inexistente, timeout, problemas de red).
        return render_template('login.html', error=f"Error de conexión: {e}")

@app.route('/logout')
def logout():
    # Ruta para cerrar sesión:
    # session.clear() borra todos los datos almacenados en la sesión (usuario/password).
    session.clear()
    # Redirigimos al login para que el usuario pueda volver a autenticarse si quiere.
    return redirect(url_for('login'))