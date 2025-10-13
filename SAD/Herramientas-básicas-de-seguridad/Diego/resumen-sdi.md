Se debe usar en una boca de un switch configurado en port mirroring para que le llegue todo el tráfico de la red.

La diferencia con un cortafuegos es que el sistema de detección de intrusos siguen la secuencia de mensajes y entienden el contexto de los mensajes, el cortafuego no tiene contexto de los mensajes.

Se tiene que configurar muy bien para que entienda el funcionamiento normal de la red y si hay una anomalía que avise.

Hay que explicarle cual es la estructura de la red.

Para que funcione bien en redes grandes se le indica a varios hosts para que envíen también detecciones, ya que configurar un port mirroring en grandes redes es muy difícil.

Lo que hay que definir son las reglas, seleccionando direcciones y puertos a monitorear, además de configurar las alertas para que envíen avisos (no hay que configurar demasiadas alertas).

Las reglas que se van configurando para los diferentes ataques que buscaré en su mayoría en internet se deben probar para ver que estén bien.

Se debe de ir actualizando porque van apareciendo nuevas vurnelabilidades y se van añadiendo y quitando servicios.

SNORT funciona a nivel 3, 4 y 7 (Red, Transporte, Aplicación)

Sintaxis regla -> Acción Protocolo IPOrigen PuertoOrigen IPDestino PuertoDestino (Opciones de la Regla)

snort.conf guarda:
  - Ubicación de archivos de log
  - Configuración de la red
  - Configuración de salida de información (mensajes, alertas por correo, alertas en archivo, etc)
  - Integración con sistemas integrados de gestión de eventos de seguridad (SIEM)
