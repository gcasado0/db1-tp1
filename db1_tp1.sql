CREATE DATABASE db1_tp1;

USE db1_tp1

CREATE TABLE cliente (
dni varchar(10) primary key not null,
nombre varchar(100),
apellido varchar(100),
fecha_nacimiento date
)


CREATE TABLE venta (
id int primary key identity (1,1) not null,
fecha date,
cliente_dni varchar(10),
FOREIGN KEY (cliente_dni) REFERENCES cliente(dni)
)

CREATE TABLE lugar (
id int primary key identity (1,1) not null,
nombre varchar(100),
)

CREATE TABLE recital (
id int primary key identity (1,1) not null,
fecha_hora datetime,
artista varchar(100),
lugar_id int,
FOREIGN KEY (lugar_id) REFERENCES lugar(id)
)

CREATE TABLE seccion(
id int primary key identity (1,1) not null,
nombre varchar(100),
precio money,
lugar_id int,
capacidad_maxima int,
FOREIGN KEY (lugar_id) REFERENCES lugar(id)
)

CREATE TABLE asiento (
id int primary key identity (1,1) not null,
fila varchar(100),
numero money,
disponible bit,
seccion_id int,
FOREIGN KEY (seccion_id) REFERENCES seccion(id)
)

CREATE TABLE servicio (
id int primary key identity (1,1) not null,
nombre varchar(100)
)

CREATE TABLE seccion_servicio (
seccion_id int not null,
servicio_id int not null,
PRIMARY KEY(seccion_id, servicio_id),
FOREIGN KEY (seccion_id) REFERENCES seccion(id),
FOREIGN KEY (servicio_id) REFERENCES servicio(id)
)

CREATE TABLE entrada (
venta_id int not null,
recital_id int not null,
asiento_id int not null,
PRIMARY KEY(venta_id, recital_id,asiento_id),
FOREIGN KEY (venta_id) REFERENCES venta(id),
FOREIGN KEY (recital_id) REFERENCES recital(id),
FOREIGN KEY (asiento_id) REFERENCES asiento(id)
)
