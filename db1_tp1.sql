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
numero varchar(100),
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
);

INSERT INTO lugar (nombre) VALUES ('Defensores del Bajo');

INSERT INTO recital (fecha_hora, artista, lugar_id)
VALUES ('2024-06-15 20:00:00', 'El Cuarteto de 3', 1);

INSERT INTO seccion (nombre, precio, lugar_id, capacidad_maxima) VALUES
('Campo delantero', 500, 1, 2000),
('Campo trasero', 300, 1, 3000),
('Platea baja 1', 1000, 1, 500),
('Platea baja 2', 1000, 1, 500),
('Platea alta 1', 700, 1, 1000),
('Platea alta 2', 700, 1, 1000);

INSERT INTO asiento (fila, numero, disponible, seccion_id) VALUES
-- campo
('0', '0', 1, 1),
('0', '0', 1, 2),
-- platea baja 1
('A', '1', 1, 3),
('A', '2', 1, 3),
('A', '3', 1, 3),
('B', '1', 1, 3),
('B', '2', 1, 3),
('B', '3', 1, 3),
-- platea baja 2
('A', '1', 1, 4),
('A', '2', 1, 4),
('A', '3', 1, 4),
('B', '1', 1, 4),
('B', '2', 1, 4),
('B', '3', 1, 4),
-- platea alta 1
('A', '1', 1, 5),
('A', '2', 1, 5),
('A', '3', 1, 5),
('B', '1', 1, 5),
('B', '2', 1, 5),
('B', '3', 1, 5),
-- platea alta 2
('A', '1', 1, 6),
('A', '2', 1, 6),
('A', '3', 1, 6),
('B', '1', 1, 6),
('B', '2', 1, 6),
('B', '3', 1, 6);

INSERT INTO cliente (dni, nombre, apellido, fecha_nacimiento) VALUES
('12345678A', 'Juan', 'Pérez', '1980-01-01'),
('23456789B', 'María', 'García', '1990-02-02'),
('34567890C', 'Luis', 'Martínez', '1975-03-03');


INSERT INTO venta (fecha, cliente_dni) VALUES
('2024-05-01', '12345678A'),
('2024-05-02', '23456789B'),
('2024-05-03', '34567890C');


INSERT INTO entrada (venta_id, recital_id, asiento_id) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 3),
(3, 1, 4);

INSERT INTO servicio (nombre) VALUES
('Acceso exclusivo'),
('Catering');

INSERT INTO seccion_servicio (seccion_id, servicio_id) VALUES
(3, 1),
(3, 2),
(4, 1),
(4, 2);