CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL,
rut_cliente VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE productos (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
precio NUMERIC(10,2) NOT NULL,
stock INTEGER NOT NULL
);

CREATE TABLE categoria_producto (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
id_producto INTEGER NOT NULL,
FOREIGN KEY (id_producto) REFERENCES productos(id)
);


CREATE TABLE ordenes (
id SERIAL PRIMARY KEY,
id_cliente INTEGER NOT NULL,
fecha_orden TIMESTAMP NOT NULL,
total NUMERIC(10,2) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE detalle_orden (
id SERIAL PRIMARY KEY,
id_orden INTEGER NOT NULL,
id_producto INTEGER NOT NULL,
cantidad INTEGER NOT NULL,
precio NUMERIC(10,2) NOT NULL,
FOREIGN KEY (id_orden) REFERENCES ordenes(id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM categoria_producto;
SELECT * FROM ordenes;
SELECT * FROM detalle_orden;