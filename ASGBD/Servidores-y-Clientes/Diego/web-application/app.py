from flask import Flask, render_template, request, session, redirect, url_for
from pymongo import MongoClient
import os
import json

app = Flask(__name__)
app.secret_key = os.urandom(24)

MONGODB_HOST = '192.168.122.187'
MONGODB_PORT = '27017'
MONGODB_DATABASE = 'db'

@app.route('/')
def index():

    usuario = session.get('usuario')
    password = session.get('password')
    
    if not usuario or not password:
        return render_template('index.html')
    
    uri = f"mongodb://{usuario}:{password}@{MONGODB_HOST}:{MONGODB_PORT}/?authSource={MONGODB_DATABASE}"
    client = MongoClient(uri, serverSelectionTimeoutMS=2000)
    db = client[MONGODB_DATABASE]
    colecciones = db.list_collection_names()

    return render_template(
        'index.html',
        usuario=usuario,
        colecciones=colecciones
    )

@app.route('/login', methods=['GET', 'POST'])
def login():

    if request.method == 'POST':
        usuario = request.form['username']
        password = request.form['password']

        uri = f"mongodb://{usuario}:{password}@{MONGODB_HOST}:{MONGODB_PORT}/?authSource={MONGODB_DATABASE}"
        
        try:
            client = MongoClient(uri, serverSelectionTimeoutMS=2000)
            db = client[MONGODB_DATABASE]
            db.list_collection_names()
            
            session['usuario'] = usuario
            session['password'] = password

            return redirect(url_for('index'))
        
        except Exception as e:
            return render_template('index.html', error=f"Error de conexión: {e}")
    
    return render_template('index.html')

@app.route('/colecciones/<nombre>', methods=['GET', 'POST'])
def ver_coleccion(nombre):

    usuario = session.get('usuario')
    password = session.get('password')

    if not usuario or not password:
        return redirect(url_for('login'))
    
    uri = f"mongodb://{usuario}:{password}@{MONGODB_HOST}:{MONGODB_PORT}/?authSource={MONGODB_DATABASE}"
    client = MongoClient(uri, serverSelectionTimeoutMS=2000)
    db = client[MONGODB_DATABASE]
    colecciones = db.list_collection_names()

    documentos = None

    if request.method == 'POST':
        query_id = request.form.get('id', '')
        query = json.loads(query_id)
        documentos = list(db[nombre].find(query))
    else:
        documentos = list(db[nombre].find())

    return render_template(
        'index.html',
        usuario=usuario,
        colecciones=colecciones,
        documentos=documentos,
        nombre=nombre
    )

@app.route('/logout')
def logout():

    session.clear()
    return redirect(url_for('index'))
