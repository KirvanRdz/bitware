-- Crear tablas
CREATE TABLE CAJEROS (
    Codigo SERIAL PRIMARY KEY,
    NomApels VARCHAR(255)
);

CREATE TABLE PRODUCTOS (
    Codigo SERIAL PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio INT
);

CREATE TABLE MAQUINAS_REGISTRADORAS (
    Codigo SERIAL PRIMARY KEY,
    Piso INT
);

CREATE TABLE VENTA (
    Cajero INT,
    Maquina INT,
    Producto INT,
    FOREIGN KEY (Cajero) REFERENCES CAJEROS(Codigo),
    FOREIGN KEY (Maquina) REFERENCES MAQUINAS_REGISTRADORAS(Codigo),
    FOREIGN KEY (Producto) REFERENCES PRODUCTOS(Codigo)
);

-- Poblar tablas
INSERT INTO CAJEROS (NomApels) VALUES ('Juan Pérez'), ('Maria Garcia'), ('Carlos Ramirez');
INSERT INTO PRODUCTOS (Nombre, Precio) VALUES ('Producto A', 100), ('Producto B', 200), ('Producto C', 300);
INSERT INTO MAQUINAS_REGISTRADORAS (Piso) VALUES (1), (2), (3);

-- Ejemplo de inserciones en la tabla de ventas
INSERT INTO VENTA (Cajero, Maquina, Producto, Cantidad) VALUES
(1, 1, 1, 10),
(2, 2, 2, 5),
(3, 3, 3, 2),
(1, 2, 1, 8),
(2, 1, 2, 4);
