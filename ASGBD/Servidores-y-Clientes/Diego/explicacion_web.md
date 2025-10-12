# Explicación adicional — puntos importantes que conviene entender y recordar

## Cómo funciona la autenticación con usuarios de MongoDB

Los usuarios que creas con `db.createUser()` en MongoDB se usan por el propio servidor MongoDB para autenticar conexiones.

Tu aplicación no compara contraseñas en texto plano; en su lugar intenta conectarse con la URI que contiene las credenciales. Si la autenticación falla, PyMongo lanza `OperationFailure`.

## Por qué usamos `authSource` en la URI

`authSource` indica la base de datos donde se creó el usuario (p. ej. `admin` o `db`). Si no se indica y el usuario está en otra base, la autenticación puede fallar.

## Uso de `session`

Guardas `usuario` y `password` en `session` para no tener que pasarlos en la URL entre páginas (esto evita exponer la contraseña en el historial del navegador).

`session` en Flask está firmada con `secret_key`. Con `os.urandom(24)` generas una clave nueva cada ejecución: sesiones se invalidan al reiniciar la app (útil en dev).

## Creación repetida de `MongoClient`

Tu código crea un `MongoClient` cada vez que se hace login o se consulta una colección. `MongoClient` es thread-safe y normalmente se recomienda crear uno global y reutilizarlo.

Has preferido crear el cliente con la URI con credenciales para autenticar con cada usuario; eso es razonable si quieres que cada usuario se autentique con sus credenciales individuales. Solo ten en cuenta el coste de crear clientes frecuentes (en un entorno con muchos usuarios quizá convenga otro diseño).

## Seguridad

En desarrollo está bien guardar la contraseña en `session`, pero en producción evita almacenar contraseñas en texto claro aunque sea en `session`. Alternativas: tokens con tiempo de vida, autenticación delegada, o almacenar sólo un token temporal.

Asegúrate de no exponer la app en redes públicas sin TLS; las credenciales viajan en texto si no usas TLS (configurar MongoDB y Flask con TLS si la comunicación cruza redes).

## Validación de entrada y robustez

Actualmente no validas el nombre de la colección (`nombre`) antes de acceder a `db[nombre]`. Es recomendable validar que `nombre` contiene solo caracteres permitidos (p. ej. `^[A-Za-z0-9_]+$`) y además comprobar que existe en `colecciones = db.list_collection_names()` antes de usarla.

Limitar el número de documentos devueltos (paginación/limit) evita exfiltración accidental de grandes volúmenes.

## Mensajes de error

En tu código devuelves mensajes de error directamente en la interfaz (útil para depurar). En producción evita mostrar trazas o errores crudos por motivos de seguridad.

---

## Notas importantes sobre `collections.html`

- `{{ usuario }}` es texto escapado por Jinja para evitar inyección HTML (salvo que uses `|safe` explícitamente).
- `url_for` construye rutas relativas correctas; evita hardcodear URLs.
- No pasamos contraseña por URL aquí (estás usando `session` en `app.py`), eso es más seguro que enviarla como query string.

---

## Notas sobre `documents.html`

`tojson` es preferible a `{{ doc }}` porque:

- Normaliza tipos (p. ej. `ObjectId` → string si lo serializas correctamente).
- Evita problemas de representación y mejora legibilidad.

Si la colección tiene muchos documentos, considera paginar o limitar (para evitar saturar la página).

---

## Notas de seguridad y UX

- `method="post"` evita que las credenciales aparezcan en la URL pero **no cifra** los datos: si el sitio se sirve por HTTP (no HTTPS), las credenciales viajan en texto claro por la red. Para entornos no locales, siempre usar HTTPS.
- Considera añadir protección CSRF para formularios en apps reales (Flask-WTF proporciona CSRF tokens).
- `required` es solo validación en cliente; siempre valida también en servidor.

---

## Últimas observaciones importantes (resumen, seguridad y buenas prácticas)

- **No modifiqué nada funcional:** todos los templates se mantienen exactamente como los enviaste; solo añadí comentarios.
- **Session vs. URL:** actualmente guardas credenciales en `session` (server-side cookie firmada). Es mejor que pasarlas por URL. En producción, evita guardar contraseñas en texto: usa tokens con caducidad o mecanismos OAuth/LDAP según el caso.
- **Validación del nombre de colección (`nombre`):** en `app.py` sería prudente validar que `nombre` solo contenga caracteres permitidos y exista en `db.list_collection_names()` antes de usar `db[nombre]`.
- **Paginación y límites:** para `documents.html` si las colecciones son grandes, añade paginación o un `limit` al `find()` en el servidor.
- **CSRF y HTTPS:** en producción añade CSRF y sirve todo sobre HTTPS.
- **Escapado:** Jinja escapa por defecto las variables (`{{ ... }}`), por eso mostrar `usuario` o `coleccion` es seguro respecto XSS — salvo si se usa `|safe`.
