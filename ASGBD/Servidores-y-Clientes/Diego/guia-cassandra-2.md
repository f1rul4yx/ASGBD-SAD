# Instalación y puesta en marcha de Apache Cassandra en Debian 12 (compatible)

## Problema principal

Al instalar Cassandra 4.x en Debian 12 y usar Java 17:

sudo -u cassandra /usr/sbin/cassandra -f

Se produce el error:

Unrecognized VM option 'UseConcMarkSweepGC'
Error: Could not create the Java Virtual Machine.

### Causa

Cassandra 4.x no es compatible con Java 17 usando opciones de Garbage Collector (UseConcMarkSweepGC) que vienen por defecto en su configuración. La JVM no arranca y el servicio no funciona.

---

## Solución completa

### 1. Instalar Java 11

sudo apt update
sudo apt install openjdk-11-jdk

Verificar:

java -version

Debe mostrar openjdk version "11.x".

---

### 2. Configurar JAVA_HOME

Editar /etc/environment:

sudo nano /etc/environment

Agregar:

JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

Recargar:

source /etc/environment
echo $JAVA_HOME

---

### 3. Ajustar permisos de carpetas de Cassandra

sudo chown -R cassandra:cassandra /var/lib/cassandra
sudo chown -R cassandra:cassandra /var/log/cassandra
sudo chown -R cassandra:cassandra /etc/cassandra

---

### 4. Configurar JMX para nodetool

Editar:

sudo nano /etc/cassandra/cassandra-env.sh

Asegurarse de que estén estas líneas:

JMX_PORT="7199"
LOCAL_JMX=yes

---

### 5. Arrancar Cassandra manualmente (para pruebas)

sudo -u cassandra /usr/sbin/cassandra -f

- -f = primer plano, muestra logs en la terminal.  
- Verifica que no haya errores.

---

### 6. Crear un servicio systemd moderno

Archivo /etc/systemd/system/cassandra.service:

[Unit]
Description=Apache Cassandra
After=network.target

[Service]
Type=forking
User=cassandra
Group=cassandra
ExecStart=/usr/sbin/cassandra -R
ExecStop=/bin/kill -15 $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target

Habilitar y arrancar:

sudo systemctl daemon-reload
sudo systemctl enable cassandra
sudo systemctl start cassandra
sudo systemctl status cassandra

Ahora debe aparecer:

Active: active (running)

---

### 7. Verificar nodo

nodetool status

Salida esperada:

Datacenter: datacenter1
=======================
Status=Up/Down
|/ State=Normal/Leaving/Joining/Moving
--  Address    Load        Tokens  Owns (effective)  Host ID                               Rack
UN  127.0.0.1  249.74 KiB  16      100.0%            ab72ec62-84ff-4a52-a7aa-39b2f2c9a898  rack1

---

### 8. Ajustes opcionales para producción

Reducir swappiness y ajustar memoria:

sudo sysctl -w vm.max_map_count=1048575
sudo sysctl -w vm.swappiness=1

Para hacerlo permanente, añadir en /etc/sysctl.conf:

vm.max_map_count=1048575
vm.swappiness=1

---

## Conclusión

- El problema principal era la incompatibilidad de Java 17 con Cassandra 4.x.  
- Usar Java 11 resuelve el arranque.  
- Crear un servicio systemd moderno y configurar permisos permite que Cassandra funcione correctamente y nodetool se conecte al nodo.
