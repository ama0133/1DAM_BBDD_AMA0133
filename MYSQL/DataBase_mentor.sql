DROP DATABASE IF EXISTS mentor;

CREATE DATABASE IF NOT EXISTS mentor;

USE mentor;


CREATE TABLE IF NOT EXISTS administrador_aula (
	dni_administrador VARCHAR(9),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100)  NOT NULL,
    
    PRIMARY KEY (dni_administrador)
);

CREATE TABLE IF NOT EXISTS aula (
	cod_aula INT  AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    dir VARCHAR(50)  NOT NULL,
    
    PRIMARY KEY (cod_aula)
);

CREATE TABLE IF NOT EXISTS alumno (
	email VARCHAR(100) ,
    dni VARCHAR(9)  NOT NULL,
    nombre VARCHAR(100)  NOT NULL,
    direccion VARCHAR(100)  NOT NULL,
    tfno VARCHAR(9)  NOT NULL,
    espanol BOOLEAN  NOT NULL,
    cod_aula INT,
    
    PRIMARY KEY (email),
    FOREIGN KEY (cod_aula) REFERENCES aula (cod_aula)
);

CREATE TABLE IF NOT EXISTS curso (
	nombre_curso VARCHAR(100),
    libro VARCHAR(50) NULL ,
    url VARCHAR(100)  NOT NULL,
    
    PRIMARY KEY(nombre_curso)
);

CREATE TABLE IF NOT EXISTS tutor (
    dni_tutor VARCHAR(9),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(50)  NOT NULL,
    
    PRIMARY KEY (dni_tutor)
);

CREATE TABLE IF NOT EXISTS administrador_administra_aula (
	dni_administrador VARCHAR(9) NOT NULL,
    cod_aula INT NOT NULL,
    
    PRIMARY KEY (dni_administrador , cod_aula),
    FOREIGN KEY (dni_administrador) REFERENCES administrador_aula (dni_administrador),
    FOREIGN KEY (cod_aula) REFERENCES aula (cod_aula)
);

CREATE TABLE IF NOT EXISTS alumno_matricular_curso (
	email_alumno VARCHAR(100),
    nombre_curso VARCHAR(100),
    f_inicio date NOT NULL,
    f_fin date NULL,
    
    PRIMARY KEY (email_alumno , nombre_curso),
    FOREIGN KEY (email_alumno) REFERENCES alumno (email),
    FOREIGN KEY (nombre_curso) REFERENCES curso (nombre_curso)
);

CREATE TABLE IF NOT EXISTS curso_tutoriza_tutor (
	dni_tutor VARCHAR(9) ,
    nombre_curso VARCHAR(100) ,
    
    
    PRIMARY KEY (dni_tutor , nombre_curso),
    FOREIGN KEY (dni_tutor) REFERENCES tutor (dni_tutor),
    FOREIGN KEY (nombre_curso) REFERENCES curso (nombre_curso)
);

CREATE TABLE IF NOT EXISTS tutor_coordina_tutor (
	dni_tutor VARCHAR(9) ,
    dni_tutor2 VARCHAR(9) ,
    
    
    PRIMARY KEY (dni_tutor, dni_tutor2),
    FOREIGN KEY (dni_tutor) REFERENCES tutor (dni_tutor),
    FOREIGN KEY (dni_tutor2) REFERENCES  tutor (dni_tutor)
);

