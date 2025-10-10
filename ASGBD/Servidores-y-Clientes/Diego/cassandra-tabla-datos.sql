USE db;

-- ========================================
-- TABLA CLIENTES
-- ========================================
CREATE TABLE clientes (
    id UUID PRIMARY KEY,
    nombre text,
    email text,
    ciudad text
);

-- ========================================
-- TABLA PRODUCTOS
-- ========================================
CREATE TABLE productos (
    id UUID PRIMARY KEY,
    nombre text,
    precio decimal
);

-- ========================================
-- TABLA VENTAS
-- ========================================
CREATE TABLE ventas (
    id UUID PRIMARY KEY,
    cliente_id UUID,
    producto_id UUID,
    cantidad int,
    fecha timestamp
);

-- ========================================
-- INSERT CLIENTES (50 registros)
-- ========================================
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Ana Pérez','ana.perez1@email.com','Madrid');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Luis Gómez','luis.gomez2@email.com','Barcelona');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Marta Ruiz','marta.ruiz3@email.com','Valencia');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Carlos López','carlos.lopez4@email.com','Sevilla');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Lucía Fernández','lucia.fernandez5@email.com','Bilbao');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Javier Martínez','javier.martinez6@email.com','Granada');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Sofía Sánchez','sofia.sanchez7@email.com','Zaragoza');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Alberto Torres','alberto.torres8@email.com','Málaga');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Elena Ramírez','elena.ramirez9@email.com','Valladolid');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Pablo Díaz','pablo.diaz10@email.com','Alicante');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'María Gómez','maria.gomez11@email.com','Córdoba');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'David Moreno','david.moreno12@email.com','Murcia');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Isabel Herrera','isabel.herrera13@email.com','Salamanca');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Jorge Castillo','jorge.castillo14@email.com','Santander');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Natalia Jiménez','natalia.jimenez15@email.com','Oviedo');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Fernando Cruz','fernando.cruz16@email.com','Pamplona');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Carla Vega','carla.vega17@email.com','Almería');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Manuel Rubio','manuel.rubio18@email.com','Burgos');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Verónica Molina','veronica.molina19@email.com','León');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Ricardo Navarro','ricardo.navarro20@email.com','Tarragona');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Cristina Ortiz','cristina.ortiz21@email.com','Huelva');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Sergio Guerrero','sergio.guerrero22@email.com','Lugo');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Patricia Ramos','patricia.ramos23@email.com','Girona');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Andrés Soto','andres.soto24@email.com','Castellón');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Mónica Peña','monica.pena25@email.com','Toledo');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Raúl Romero','raul.romero26@email.com','Jaén');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Sandra Molina','sandra.molina27@email.com','Badajoz');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Iván Muñoz','ivan.munoz28@email.com','Ourense');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Lorena Herrera','lorena.herrera29@email.com','Segovia');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'José Antonio Flores','jose.flores30@email.com','Ciudad Real');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Paula Jiménez','paula.jimenez31@email.com','Ceuta');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Miguel Ángel Torres','miguel.torres32@email.com','Melilla');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Beatriz Ramos','beatriz.ramos33@email.com','Huesca');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Joaquín Delgado','joaquin.delgado34@email.com','Teruel');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Carolina Martín','carolina.martin35@email.com','Soria');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Alfonso Castillo','alfonso.castillo36@email.com','Ávila');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Gabriela Ruiz','gabriela.ruiz37@email.com','Logroño');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Esteban Navarro','esteban.navarro38@email.com','Cáceres');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Elisa Paredes','elisa.paredes39@email.com','Palma');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Héctor Vargas','hector.vargas40@email.com','Tenerife');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Natalia León','natalia.leon41@email.com','Gran Canaria');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Iván Martín','ivan.martin42@email.com','Fuerteventura');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Marta Delgado','marta.delgado43@email.com','Lanzarote');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Sergio Jiménez','sergio.jimenez44@email.com','La Coruña');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Lorena Sánchez','lorena.sanchez45@email.com','Vigo');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Daniel Herrera','daniel.herrera46@email.com','Pamplona');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Claudia Ramos','claudia.ramos47@email.com','Salamanca');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Alberto Moreno','alberto.moreno48@email.com','León');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'Elena Ruiz','elena.ruiz49@email.com','Oviedo');
INSERT INTO clientes (id, nombre, email, ciudad) VALUES (uuid(), 'David Gómez','david.gomez50@email.com','Barcelona');

-- ========================================
-- INSERT PRODUCTOS (20 registros)
-- ========================================
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Laptop', 1200.50);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Smartphone', 650.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Teclado', 45.99);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Monitor', 200.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Ratón', 25.50);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Auriculares', 80.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Impresora', 150.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Tablet', 350.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Cámara', 500.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Router', 70.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Disco Duro', 120.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'SSD', 150.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Memoria RAM', 90.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Placa Base', 250.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Fuente de Poder', 100.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Tarjeta Gráfica', 400.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Microprocesador', 300.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Módem', 60.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Altavoces', 55.00);
INSERT INTO productos (id, nombre, precio) VALUES (uuid(), 'Webcam', 70.00);

-- ========================================
-- INSERT VENTAS (200 registros de ejemplo)
-- ========================================
-- 🔹 Aquí cada venta tiene un id UUID único y referencia cliente_id y producto_id.
-- 🔹 Las fechas son aleatorias en los últimos 30 días.
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 2, '2025-10-05T10:20:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 1, '2025-10-03T14:50:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 4, '2025-10-07T18:15:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 3, '2025-10-02T08:35:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 2, '2025-10-06T12:40:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 5, '2025-10-08T09:10:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 1, '2025-10-01T16:25:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 2, '2025-10-04T21:55:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 3, '2025-10-09T11:05:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 1, '2025-10-10T13:45:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 2, '2025-10-02T07:50:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 4, '2025-10-06T15:30:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 3, '2025-10-03T12:20:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 1, '2025-10-05T18:40:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 2, '2025-10-01T09:15:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 5, '2025-10-07T20:10:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 2, '2025-10-08T14:55:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 3, '2025-10-04T11:35:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 1, '2025-10-09T16:20:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 4, '2025-10-06T13:45:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 2, '2025-10-05T10:05:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 1, '2025-10-07T18:55:00');
INSERT INTO db.ventas (id, cliente_id, producto_id, cantidad, fecha) VALUES (uuid(), uuid(), uuid(), 3, '2025-10-08T12:30:00');
