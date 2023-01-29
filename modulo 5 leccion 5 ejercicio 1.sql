CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
	rut_cliente VARCHAR(20)NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE encomiendas (
id SERIAL PRIMARY KEY,
descripcion VARCHAR(200) NOT NULL,
peso FLOAT NOT NULL,
volumen FLOAT NOT NULL,
cliente_id INTEGER NOT NULL REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE destinatarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE envios (
    id SERIAL PRIMARY KEY,
    id_encomienda INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_destinatario INTEGER NOT NULL,
    direccion_origen VARCHAR(255) NOT NULL,
    direccion_destino VARCHAR(255) NOT NULL,
    fecha_envio DATE NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_encomienda) REFERENCES encomiendas(id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_destinatario) REFERENCES destinatarios(id)
);

CREATE TABLE sucursales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);

CREATE TABLE rutas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    origen VARCHAR(50) NOT NULL,
    destino VARCHAR(50) NOT NULL,
    duracion INT NOT NULL
);

CREATE TABLE envios_sucursales(
id serial PRIMARY KEY,
id_envio int NOT NULL,
id_sucursal int NOT NULL,
fecha_llegada TIMESTAMP NOT NULL,
FOREIGN KEY (id_envio) REFERENCES envios(id),
FOREIGN KEY (id_sucursal) REFERENCES sucursales(id)
);

SELECT * FROM clientes;
SELECT * FROM encomiendas;
SELECT * FROM destinatarios;
SELECT * FROM envios ;
SELECT * FROM sucursales;
SELECT * FROM rutas;
SELECT * FROM envios_sucursales;