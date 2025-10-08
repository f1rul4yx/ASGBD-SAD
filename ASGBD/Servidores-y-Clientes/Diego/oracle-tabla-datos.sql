-- ========================================
-- TABLAS
-- ========================================

-- Tabla de clientes
CREATE TABLE clientes (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100),
    email VARCHAR2(100),
    ciudad VARCHAR2(50)
);

-- Tabla de productos
CREATE TABLE productos (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100),
    precio NUMBER(10,2)
);

-- Tabla de ventas
CREATE TABLE ventas (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id NUMBER,
    producto_id NUMBER,
    cantidad NUMBER,
    fecha TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- ========================================
-- CLIENTES (50 registros)
-- ========================================

INSERT INTO clientes (nombre, email, ciudad) VALUES ('Ana Pérez','ana.perez1@email.com','Madrid');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Luis Gómez','luis.gomez2@email.com','Barcelona');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Marta Ruiz','marta.ruiz3@email.com','Valencia');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Carlos López','carlos.lopez4@email.com','Sevilla');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Lucía Fernández','lucia.fernandez5@email.com','Bilbao');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Javier Martínez','javier.martinez6@email.com','Granada');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Sofía Sánchez','sofia.sanchez7@email.com','Zaragoza');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Alberto Torres','alberto.torres8@email.com','Málaga');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Elena Ramírez','elena.ramirez9@email.com','Valladolid');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Pablo Díaz','pablo.diaz10@email.com','Alicante');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('María Gómez','maria.gomez11@email.com','Córdoba');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('David Moreno','david.moreno12@email.com','Murcia');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Isabel Herrera','isabel.herrera13@email.com','Salamanca');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Jorge Castillo','jorge.castillo14@email.com','Santander');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Natalia Jiménez','natalia.jimenez15@email.com','Oviedo');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Fernando Cruz','fernando.cruz16@email.com','Pamplona');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Carla Vega','carla.vega17@email.com','Almería');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Manuel Rubio','manuel.rubio18@email.com','Burgos');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Verónica Molina','veronica.molina19@email.com','León');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Ricardo Navarro','ricardo.navarro20@email.com','Tarragona');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Cristina Ortiz','cristina.ortiz21@email.com','Huelva');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Sergio Guerrero','sergio.guerrero22@email.com','Lugo');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Patricia Ramos','patricia.ramos23@email.com','Girona');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Andrés Soto','andres.soto24@email.com','Castellón');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Mónica Peña','monica.pena25@email.com','Toledo');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Raúl Romero','raul.romero26@email.com','Jaén');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Sandra Molina','sandra.molina27@email.com','Badajoz');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Iván Muñoz','ivan.munoz28@email.com','Ourense');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Lorena Herrera','lorena.herrera29@email.com','Segovia');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('José Antonio Flores','jose.flores30@email.com','Ciudad Real');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Paula Jiménez','paula.jimenez31@email.com','Ceuta');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Miguel Ángel Torres','miguel.torres32@email.com','Melilla');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Beatriz Ramos','beatriz.ramos33@email.com','Huesca');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Joaquín Delgado','joaquin.delgado34@email.com','Teruel');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Carolina Martín','carolina.martin35@email.com','Soria');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Alfonso Castillo','alfonso.castillo36@email.com','Ávila');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Gabriela Ruiz','gabriela.ruiz37@email.com','Logroño');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Esteban Navarro','esteban.navarro38@email.com','Cáceres');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Elisa Paredes','elisa.paredes39@email.com','Palma');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Héctor Vargas','hector.vargas40@email.com','Tenerife');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Natalia León','natalia.leon41@email.com','Gran Canaria');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Iván Martín','ivan.martin42@email.com','Fuerteventura');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Marta Delgado','marta.delgado43@email.com','Lanzarote');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Sergio Jiménez','sergio.jimenez44@email.com','La Coruña');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Lorena Sánchez','lorena.sanchez45@email.com','Vigo');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Daniel Herrera','daniel.herrera46@email.com','Pamplona');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Claudia Ramos','claudia.ramos47@email.com','Salamanca');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Alberto Moreno','alberto.moreno48@email.com','León');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('Elena Ruiz','elena.ruiz49@email.com','Oviedo');
INSERT INTO clientes (nombre, email, ciudad) VALUES ('David Gómez','david.gomez50@email.com','Barcelona');

-- ========================================
-- PRODUCTOS (20 registros)
-- ========================================

INSERT INTO productos (nombre, precio) VALUES ('Laptop',1200.50);
INSERT INTO productos (nombre, precio) VALUES ('Smartphone',650.00);
INSERT INTO productos (nombre, precio) VALUES ('Teclado',45.99);
INSERT INTO productos (nombre, precio) VALUES ('Monitor',200.00);
INSERT INTO productos (nombre, precio) VALUES ('Ratón',25.50);
INSERT INTO productos (nombre, precio) VALUES ('Auriculares',80.00);
INSERT INTO productos (nombre, precio) VALUES ('Impresora',150.00);
INSERT INTO productos (nombre, precio) VALUES ('Tablet',350.00);
INSERT INTO productos (nombre, precio) VALUES ('Cámara',500.00);
INSERT INTO productos (nombre, precio) VALUES ('Router',70.00);
INSERT INTO productos (nombre, precio) VALUES ('Disco Duro',120.00);
INSERT INTO productos (nombre, precio) VALUES ('SSD',150.00);
INSERT INTO productos (nombre, precio) VALUES ('Memoria RAM',90.00);
INSERT INTO productos (nombre, precio) VALUES ('Placa Base',250.00);
INSERT INTO productos (nombre, precio) VALUES ('Fuente de Poder',100.00);
INSERT INTO productos (nombre, precio) VALUES ('Tarjeta Gráfica',400.00);
INSERT INTO productos (nombre, precio) VALUES ('Microprocesador',300.00);
INSERT INTO productos (nombre, precio) VALUES ('Módem',60.00);
INSERT INTO productos (nombre, precio) VALUES ('Altavoces',55.00);
INSERT INTO productos (nombre, precio) VALUES ('Webcam',70.00);

-- ========================================
-- GENERAR 200 VENTAS ALEATORIAS
-- ========================================

BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha)
        VALUES (
            TRUNC(DBMS_RANDOM.VALUE(1, 51)),  -- cliente_id 1-50
            TRUNC(DBMS_RANDOM.VALUE(1, 21)),  -- producto_id 1-20
            TRUNC(DBMS_RANDOM.VALUE(1, 6)),   -- cantidad 1-5
            SYSTIMESTAMP - NUMTODSINTERVAL(TRUNC(DBMS_RANDOM.VALUE(0,30)), 'DAY')
        );
    END LOOP;
    COMMIT;
END;
/
