# Guía completa de Cassandra funcional

## 1️⃣ Instalación de Java y Cassandra

# Actualiza paquetes
sudo apt update

# Instala Java 17
sudo apt install openjdk-17-jdk -y
java -version

# Agrega repositorio oficial de Cassandra (ajusta 40x según versión)
echo "deb https://downloads.apache.org/cassandra/debian 40x main" | sudo tee /etc/apt/sources.list.d/cassandra.list
curl https://downloads.apache.org/cassandra/KEYS | sudo apt-key add -
sudo apt update

# Instala Cassandra
sudo apt install cassandra -y

---

## 2️⃣ Verificar binario y usuario

# Encuentra la ruta del binario
which cassandra
# Ejemplo: /usr/sbin/cassandra

# Verifica usuario
id cassandra

---

## 3️⃣ Configuración de cassandra.yaml

Archivo: /etc/cassandra/cassandra.yaml

# IP para comunicación entre nodos (no puede ser 0.0.0.0)
listen_address: <IP_DEL_SERVIDOR>  # ej. 192.168.1.100 o localhost

# IP donde CQL escucha (clientes y cqlsh)
rpc_address: 0.0.0.0
start_native_transport: true
native_transport_port: 9042

# Opcional: IP que se muestra a clientes remotos
broadcast_rpc_address: <IP_DEL_SERVIDOR>

⚠️ listen_address no puede ser 0.0.0.0  
⚠️ rpc_address sí puede ser 0.0.0.0 para escuchar todas las interfaces

---

## 4️⃣ Permisos

sudo chown -R cassandra:cassandra /var/lib/cassandra /var/log/cassandra /etc/cassandra

---

## 5️⃣ Arranque en primer plano (pruebas)

sudo -u cassandra /usr/sbin/cassandra -f

# Verifica puertos
ss -tuln | grep 9042
# Deberías ver: tcp LISTEN 0 100 0.0.0.0:9042

# Conéctate con cqlsh
cqlsh <IP_DEL_SERVIDOR> 9042

---

## 6️⃣ Crear servicio systemd funcional

Archivo: /etc/systemd/system/cassandra.service

[Unit]
Description=Apache Cassandra
After=network.target

[Service]
Type=forking
User=cassandra
Group=cassandra
ExecStart=/usr/sbin/cassandra -R
ExecStop=/bin/kill -TERM $MAINPID
Restart=on-failure
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target

# Recarga systemd y arranca el servicio
sudo systemctl daemon-reload
sudo systemctl enable cassandra
sudo systemctl start cassandra
sudo systemctl status cassandra

# Verifica puerto
ss -tuln | grep 9042

---

## 7️⃣ Conexión remota con cqlsh

# Desde otra máquina en la red
cqlsh <IP_DEL_SERVIDOR> 9042

---

## 8️⃣ Problemas comunes y soluciones

- Cassandra no arranca → revisa que listen_address no sea 0.0.0.0  
- Puerto 9042 no aparece → revisa start_native_transport: true y que se ejecute como usuario cassandra  
- Proceso terminado (“killed”) → no arrancar como root  
- Errores de ruta en systemd → usar la ruta correcta del binario (/usr/sbin/cassandra)  
- Deprecation warnings → generalmente no bloquean el arranque  

---

## 9️⃣ Tips finales

- Logs: /var/log/cassandra/  
- Directorio de datos: /var/lib/cassandra/  
- Nunca ejecutar Cassandra como root  
- broadcast_rpc_address es útil si los clientes remotos están en otra red
