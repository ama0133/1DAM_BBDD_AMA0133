drop database if exists ong;
create database if not exists ong;
use ong;

create table if not exists asociacion (
	cif char(9),
    denominacion varchar(20) not null,
    direccion varchar(50),
    provincia varchar(15),
    tipo ENUM('Ecologista', 'Integración', 'Desarrollo'),
    utilidadpublica ENUM('SI','NO') default('SI'),
    
    primary key (cif)
);

create table if not exists socio (
	dni char(9),
    nombre varchar(30),
    direccion varchar(50),
    provincia varchar(30),
    f_alta date not null,
    cuota_mensual decimal(7,5) not null check (cuota_mensual >= 0),
    aportacion_anual decimal(7,5) check (aportacion_anual >= 0),
    cif_asociacion char(9),
    
    primary key (dni),
    foreign key (cif_asociacion) references asociacion (cif) on delete set null on update cascade
);

create table if not exists trabajador(
	dni char(9),
    nombre varchar(30) not null,
    ingreso date,
    tipo enum('Asalariado', 'Voluntario'),
    irpf int(3) check(irpf between 0 and 100),
    pagos decimal(9,2) check(pagos >= 0),
    profesion varchar(30),
    horas int(3) check(horas between 0 and 300),
    edad int(3) check(edad between 18 and 100),
    
    primary key (dni)
);

create table  if not exists proyecto(
	id int auto_increment,
    pais varchar(20),
    zona varchar(30),
    objetivo varchar(100),
    
    
    primary key (id)
);

create table if not exists trabaja(
	dni_trabajador char(9),
    id_proyecto int,
    
    primary key (dni_trabajador,id_proyecto),
    foreign key (dni_trabajador) references trabajador (dni), 
    foreign key(id_proyecto) references proyecto(id)
);
-- ----------------------------------------------------------------------------------------------------- --

-- 1. Añadir a proyecto la columna nro_beneficiarios → entero, no nulo, con valor mayor o igual a 0.
alter table proyecto add nro_beneficiarios int not null check(nro_beneficiarios >= 0);

-- 2. Modificar la columna direccion de socio a tamaño 60.
alter table socio modify direccion varchar(60);

-- 3. Modificar fingreso de trabajador para que no acepte nulos.
alter table trabajador modify ingreso date not null;

-- 4. Añadir a proyecto una columna CIF como clave externa a asociacion. Clave externa a asociacion. 
-- No puede ser nulo. Debe actualizarse en cascada, y no permitir borrar asociaciones con proyectos vinculados.
alter table proyecto add cif_asociacion char(9) not null;
alter table proyecto add foreign key (cif_asociacion) references asociacion(cif) on delete restrict on update cascade; 
