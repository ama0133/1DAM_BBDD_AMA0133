DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE IF NOT EXISTS biblioteca;

USE biblioteca;

CREATE TABLE autor(
	cod_autor INT(5),
	nombre VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (cod_autor)
);

CREATE TABLE libro(
	isbn VARCHAR(10),
	titulo VARCHAR(100) NOT NULL,
    anio DATE NOT NULL,
    cod_autor INT(5),
    
    PRIMARY KEY (isbn),
    FOREIGN KEY (cod_autor) REFERENCES autor (cod_autor) 
);

CREATE TABLE socio(
	cod_socio INT(5),
	nombre VARCHAR(15),
    apellido VARCHAR(20),
    telefono INT(9), 
    
    PRIMARY KEY (cod_socio)
);

CREATE TABLE prestamo(
	codigo INT(7) AUTO_INCREMENT,
	fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    cod_libro VARCHAR(10),
    
    PRIMARY KEY (codigo),
     FOREIGN KEY (cod_libro) REFERENCES libro(isbn)
);

-- Insertar en la tabla socio una nueva columna direccion que sea de tipo cadena de caracteres de tamaño 50.
ALTER TABLE  socio ADD direccion VARCHAR(50);

-- Modificar el tipo de datos de la columna titulo para la tabla libro de 100 a 150.
ALTER TABLE  libro MODIFY titulo VARCHAR(150);

-- Modificar la columna telefono de la tabla socios para que sea de tipo 'Cadena de caracteres de tamaño 9' y no pueda contener valores nulos.
ALTER TABLE socio MODIFY telefono VARCHAR(9) NOT NULL;

-- Añadir a la tabla autor una nueva columna f_nac que sea de tipo Date y que contendrá la fecha de nacimiento del autor.
ALTER TABLE  AUTOR ADD F_NAC DATE;

DROP TABLE SOCIO;

