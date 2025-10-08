-- Tabla de clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    ciudad VARCHAR(50)
);

-- Tabla de productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

-- Tabla de ventas
CREATE TABLE ventas (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    producto_id INT REFERENCES productos(id),
    cantidad INT,
    fecha TIMESTAMP DEFAULT NOW()
);

-- Clientes
INSERT INTO clientes (nombre, email, ciudad) VALUES
('Ana Pérez','ana.perez1@email.com','Madrid'),
('Luis Gómez','luis.gomez2@email.com','Barcelona'),
('Marta Ruiz','marta.ruiz3@email.com','Valencia'),
('Carlos López','carlos.lopez4@email.com','Sevilla'),
('Lucía Fernández','lucia.fernandez5@email.com','Bilbao'),
('Javier Martínez','javier.martinez6@email.com','Granada'),
('Sofía Sánchez','sofia.sanchez7@email.com','Zaragoza'),
('Alberto Torres','alberto.torres8@email.com','Málaga'),
('Elena Ramírez','elena.ramirez9@email.com','Valladolid'),
('Pablo Díaz','pablo.diaz10@email.com','Alicante'),
('María Gómez','maria.gomez11@email.com','Córdoba'),
('David Moreno','david.moreno12@email.com','Murcia'),
('Isabel Herrera','isabel.herrera13@email.com','Salamanca'),
('Jorge Castillo','jorge.castillo14@email.com','Santander'),
('Natalia Jiménez','natalia.jimenez15@email.com','Oviedo'),
('Fernando Cruz','fernando.cruz16@email.com','Pamplona'),
('Carla Vega','carla.vega17@email.com','Almería'),
('Manuel Rubio','manuel.rubio18@email.com','Burgos'),
('Verónica Molina','veronica.molina19@email.com','León'),
('Ricardo Navarro','ricardo.navarro20@email.com','Tarragona'),
('Cristina Ortiz','cristina.ortiz21@email.com','Huelva'),
('Sergio Guerrero','sergio.guerrero22@email.com','Lugo'),
('Patricia Ramos','patricia.ramos23@email.com','Girona'),
('Andrés Soto','andres.soto24@email.com','Castellón'),
('Mónica Peña','monica.pena25@email.com','Toledo'),
('Raúl Romero','raul.romero26@email.com','Jaén'),
('Sandra Molina','sandra.molina27@email.com','Badajoz'),
('Iván Muñoz','ivan.munoz28@email.com','Ourense'),
('Lorena Herrera','lorena.herrera29@email.com','Segovia'),
('José Antonio Flores','jose.flores30@email.com','Ciudad Real'),
('Paula Jiménez','paula.jimenez31@email.com','Ceuta'),
('Miguel Ángel Torres','miguel.torres32@email.com','Melilla'),
('Beatriz Ramos','beatriz.ramos33@email.com','Huesca'),
('Joaquín Delgado','joaquin.delgado34@email.com','Teruel'),
('Carolina Martín','carolina.martin35@email.com','Soria'),
('Alfonso Castillo','alfonso.castillo36@email.com','Ávila'),
('Gabriela Ruiz','gabriela.ruiz37@email.com','Logroño'),
('Esteban Navarro','esteban.navarro38@email.com','Cáceres'),
('Elisa Paredes','elisa.paredes39@email.com','Palma'),
('Héctor Vargas','hector.vargas40@email.com','Tenerife'),
('Natalia León','natalia.leon41@email.com','Gran Canaria'),
('Iván Martín','ivan.martin42@email.com','Fuerteventura'),
('Marta Delgado','marta.delgado43@email.com','Lanzarote'),
('Sergio Jiménez','sergio.jimenez44@email.com','La Coruña'),
('Lorena Sánchez','lorena.sanchez45@email.com','Vigo'),
('Daniel Herrera','daniel.herrera46@email.com','Pamplona'),
('Claudia Ramos','claudia.ramos47@email.com','Salamanca'),
('Alberto Moreno','alberto.moreno48@email.com','León'),
('Elena Ruiz','elena.ruiz49@email.com','Oviedo'),
('David Gómez','david.gomez50@email.com','Barcelona');

-- Productos
INSERT INTO productos (nombre, precio) VALUES
('Laptop',1200.50),
('Smartphone',650.00),
('Teclado',45.99),
('Monitor',200.00),
('Ratón',25.50),
('Auriculares',80.00),
('Impresora',150.00),
('Tablet',350.00),
('Cámara',500.00),
('Router',70.00),
('Disco Duro',120.00),
('SSD',150.00),
('Memoria RAM',90.00),
('Placa Base',250.00),
('Fuente de Poder',100.00),
('Tarjeta Gráfica',400.00),
('Microprocesador',300.00),
('Módem',60.00),
('Altavoces',55.00),
('Webcam',70.00);

-- 200 ventas aleatorias automáticamente
INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha)
SELECT
    (1 + random()*49)::int,        -- cliente_id 1-50
    (1 + random()*19)::int,        -- producto_id 1-20
    (1 + random()*5)::int,         -- cantidad 1-5
    NOW() - (random()*30 || ' days')::interval  -- fecha aleatoria últimos 30 días
FROM generate_series(1,200);
