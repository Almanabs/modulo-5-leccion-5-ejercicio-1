CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL,
rut_cliente VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE bancos (
id SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(100) NOT NULL,
telefono VARCHAR(20) NOT NULL,
email VARCHAR(50) NOT NULL,
rut_banco VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE cuentas (
id SERIAL PRIMARY KEY,
numero_cuenta VARCHAR(20) NOT NULL UNIQUE,
saldo NUMERIC(10,2) NOT NULL,
tipo_cuenta VARCHAR(20) NOT NULL,
id_cliente INTEGER NOT NULL,
id_banco INTEGER NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_banco) REFERENCES bancos(id)
);

CREATE TABLE transacciones (
id SERIAL PRIMARY KEY,
fecha TIMESTAMP NOT NULL,
monto NUMERIC(10,2) NOT NULL,
tipo_transaccion VARCHAR(20) NOT NULL,
numero_cuenta VARCHAR(20) NOT NULL,
FOREIGN KEY (numero_cuenta) REFERENCES cuentas(numero_cuenta)
);

SELECT * FROM clientes;
SELECT * FROM cuentas;
SELECT * FROM transacciones;
SELECT * FROM bancos ;