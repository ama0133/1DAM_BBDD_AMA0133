DROP DATABASE IF EXISTS productos;

CREATE DATABASE IF NOT EXISTS productos;

USE productos;

CREATE TABLE IF NOT EXISTS proveedor(
	nif_proveedor VARCHAR(9),
    nombre VARCHAR(100) NOT NULL,
    ap1 VARCHAR(100),
    ap2 VARCHAR(100),
    direccion VARCHAR(150),
    fecha_nacimiento date NOT NULL,
    
    PRIMARY KEY (nif_proveedor)
);

CREATE TABLE IF NOT EXISTS producto(
	id_producto INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio_unit DECIMAL(3,2),
    nif_proveedor VARCHAR(9),
    
    PRIMARY KEY (id_producto),
    FOREIGN KEY (nif_proveedor) REFERENCES proveedor(nif_proveedor)
);


CREATE TABLE IF NOT EXISTS cliente(
	dni VARCHAR(9),
    nombre VARCHAR(100) NOT NULL,
    ap1 VARCHAR(100),
    ap2 VARCHAR(100),
    direccion VARCHAR(150),
    fecha_nacimiento date NOT NULL,
    
    PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS cliente_compra_producto(
	id_producto INT,
    dni_cliente VARCHAR(9),
    
    PRIMARY KEY (id_producto, dni_cliente),
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (dni_cliente) REFERENCES cliente(dni)
);