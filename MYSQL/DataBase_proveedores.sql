-- Eliminamos la tabla si ya existe.
DROP DATABASE IF EXISTS proveedores;

-- Creamos la base de datos de proveedores.
CREATE DATABASE IF NOT EXISTS proveedores;

-- Usamos la base de datos que hemos creado anteriormente.
USE proveedores;

-- Creamos la tabla proveedor
CREATE TABLE IF NOT EXISTS proveedor(
	cod_proveedor INT PRIMARY KEY AUTO_INCREMENT,
	direccion VARCHAR(50),
	ciudad VARCHAR(20),
	provincia VARCHAR(20)
);

-- Creamos la tabla categoria.
CREATE TABLE IF NOT EXISTS categoria(
	cod_categoria INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL
);

-- Creamos la tabla pieza.
CREATE TABLE IF NOT EXISTS pieza(
	cod_pieza INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	color VARCHAR(50),
	precio DECIMAL(3,2), -- Decimal sirve para poder poner decimales (si ponemos 3,2 son 3 numero delante de la coma y 2 detras).
    cod_categoria INT,
    
    FOREIGN KEY (cod_categoria) REFERENCES categoria (cod_categoria)
);

-- Creamos la tabla proveedor_suministra_pieza
CREATE TABLE IF NOT EXISTS proveedor_suministra_pieza(
	id_proveedor INT,
	id_pieza INT,
	cantidad INT NOT NULL,
	fecha DATE NOT NULL,
    
    PRIMARY KEY (id_proveedor, id_pieza, fecha),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor (cod_proveedor),
    FOREIGN KEY (id_pieza) REFERENCES pieza (cod_pieza)
);


