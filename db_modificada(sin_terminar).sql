DROP DATABASE db1_tp1;
CREATE DATABASE db1_tp1;

USE db1_tp1;

CREATE TABLE cliente (
dni varchar(10) primary key not null,
nombre varchar(100) not null,
apellido varchar(100) not null,
fecha_nacimiento date
)

CREATE TABLE venta (
id int primary key identity (1,1) not null,
fecha date not null,
cliente_dni varchar(10) not null,
FOREIGN KEY (cliente_dni) REFERENCES cliente(dni)
)

CREATE TABLE lugar (
id int primary key identity (1,1) not null,
nombre varchar(100)  not null,
)

CREATE TABLE banda (
id int primary key identity (1,1) not null,
nombre varchar(100) not null
)

CREATE TABLE recital (
id int primary key identity (1,1) not null,
fecha_hora datetime  not null,
lugar_id int  not null,
banda_id int not null,
FOREIGN KEY (lugar_id) REFERENCES lugar(id),
FOREIGN KEY (banda_id) REFERENCES banda(id),
CONSTRAINT recital_unique UNIQUE (fecha_hora, lugar_id)
)

CREATE TABLE seccion(
id int primary key identity (1,1) not null,
nombre varchar(100)  not null,
precio money  not null,
lugar_id int  not null,
capacidad_maxima int not null,
FOREIGN KEY (lugar_id) REFERENCES lugar(id)
)

CREATE TABLE asiento (
id int primary key identity (1,1) not null,
seccion_id int  not null,
fila varchar(10)  not null,
numero varchar(10) not null,
FOREIGN KEY (seccion_id) REFERENCES seccion(id),
CONSTRAINT asiento_unique UNIQUE (seccion_id, fila, numero)
)

CREATE TABLE servicio (
id int primary key identity (1,1) not null,
nombre varchar(100) not null
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
PRIMARY KEY(venta_id, recital_id, asiento_id),
FOREIGN KEY (venta_id) REFERENCES venta(id),
FOREIGN KEY (recital_id) REFERENCES recital(id),
FOREIGN KEY (asiento_id) REFERENCES asiento(id)
);


INSERT INTO lugar (nombre) VALUES ('Defensores del Bajo');
insert into banda (nombre) VALUES ('ACDC');
insert into banda (nombre) VALUES ('pink floyd');
insert into banda (nombre) VALUES ('guns n roses');
insert into banda (nombre) VALUES ('El cuarteto de 3');

INSERT INTO recital (fecha_hora, banda_id, lugar_id) VALUES 
('2024-06-15 20:00:00', 2, 1);

INSERT INTO recital (fecha_hora, banda_id, lugar_id) VALUES 
('2024-08-15 20:00:00', 1, 1);

INSERT INTO recital (fecha_hora, banda_id, lugar_id) VALUES 
('2024-09-15 20:00:00', 3, 1);

INSERT INTO recital (fecha_hora, banda_id, lugar_id) VALUES 
('2024-10-15 20:00:00', 4, 1);

INSERT INTO seccion (nombre, precio, lugar_id, capacidad_maxima) VALUES
('Campo delantero', 500, 1, 2000),
('Campo trasero', 300, 1, 3000),
('Platea baja 1', 1100, 1, 0),
('Platea baja 2', 1200, 1, 0),
('Platea alta 1', 710, 1, 0),
('Platea alta 2', 720, 1, 0);

INSERT INTO asiento (fila, numero, seccion_id) VALUES
-- Campo delantero
('-', '-', 1),
('-', '-', 2),
-- Platea baja 1
('A', '1', 3),
('A', '2', 3),
('A', '3', 3),
('A', '4', 3),
('A', '5', 3),
('A', '6', 3),
('B', '1', 3),
('B', '2', 3),
('B', '3', 3),
('B', '4', 3),
('B', '5', 3),
('B', '6', 3),
('C', '1', 3),
('C', '2', 3),
('C', '3', 3),
('C', '4', 3),
('C', '5', 3),
('C', '6', 3),
-- Platea baja 2
('A', '1', 4),
('A', '2', 4),
('A', '3', 4),
('A', '4', 4),
('A', '5', 4),
('A', '6', 4),
('B', '1', 4),
('B', '2', 4),
('B', '3', 4),
('B', '4', 4),
('B', '5', 4),
('B', '6', 4),
('C', '1', 4),
('C', '2', 4),
('C', '3', 4),
('C', '4', 4),
('C', '5', 4),
('C', '6', 4),
-- Platea alta 1
('A', '1', 5),
('A', '2', 5),
('A', '3', 5),
('A', '4', 5),
('A', '5', 5),
('A', '6', 5),
('B', '1', 5),
('B', '2', 5),
('B', '3', 5),
('B', '4', 5),
('B', '5', 5),
('B', '6', 5),
('C', '1', 5),
('C', '2', 5),
('C', '3', 5),
('C', '4', 5),
('C', '5', 5),
('C', '6', 5),
-- Platea alta 2
('A', '1', 6),
('A', '2', 6),
('A', '3', 6),
('A', '4', 6),
('A', '5', 6),
('A', '6', 6),
('B', '1', 6),
('B', '2', 6),
('B', '3', 6),
('B', '4', 6),
('B', '5', 6),
('B', '6', 6),
('C', '1', 6),
('C', '2', 6),
('C', '3', 6),
('C', '4', 6),
('C', '5', 6),
('C', '6', 6);

INSERT INTO cliente (dni, nombre, apellido, fecha_nacimiento) VALUES
('12345678A', 'Juan', 'P�rez', '1980-01-01'),
('23456789B', 'Mar�a', 'Garc�a', '1990-02-02'),
('34567890C', 'Luis', 'Mart�nez', '1975-03-03'),
('45678901D', 'Ana', 'L�pez', '1985-04-04'),
('56789012E', 'Carlos', 'Fern�ndez', '1978-05-05'),
('67890123F', 'Laura', 'S�nchez', '1988-06-06'),
('78901234G', 'Jos�', 'Ram�rez', '1995-07-07'),
('89012345H', 'Elena', 'Torres', '1992-08-08'),
('90123456I', 'Pablo', 'Vargas', '1983-09-09'),
('01234567J', 'Marta', 'Reyes', '1991-10-10'),
('12345678K', 'Sof�a', 'Castro', '1987-11-11'),
('23456789L', 'Miguel', 'Ortega', '1979-12-12'),
('34567890M', 'Clara', 'Navarro', '1982-01-13'),
('45678901N', 'Roberto', 'Molina', '1976-02-14'),
('56789012O', 'Luc�a', 'Romero', '1989-03-15'),
('67890123P', 'David', 'Gil', '1984-04-16'),
('78901234Q', 'Andrea', 'Rivas', '1993-05-17'),
('89012345R', 'Pedro', 'P�rez', '1990-06-18'),
('90123456S', 'Natalia', 'Flores', '1994-07-19'),
('01234567T', 'Jorge', 'Hern�ndez', '1981-08-20');


INSERT INTO venta (fecha, cliente_dni) VALUES
('2024-05-01', '12345678A'),
('2024-05-02', '23456789B'),
('2024-05-03', '34567890C'),
('2024-05-04', '45678901D'),
('2024-05-05', '56789012E'),
('2024-05-06', '67890123F'),
('2024-05-07', '78901234G'),
('2024-05-08', '89012345H'),
('2024-05-09', '90123456I'),
('2024-05-10', '01234567J'),
('2024-05-11', '12345678K'),
('2024-05-12', '23456789L'),
('2024-05-13', '34567890M');


INSERT INTO entrada (venta_id, recital_id, asiento_id) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 5),
(3, 1, 14),
(4, 1, 25),
(5, 1, 26),
(6, 1, 37),
(7, 1, 48),
(8, 1, 59),
(9, 1, 60),
(10, 1, 71),
(11, 1, 42),
(12, 1, 33),
(13, 1, 24);

INSERT INTO servicio (nombre) VALUES
('Acceso exclusivo'),
('Catering');

INSERT INTO seccion_servicio (seccion_id, servicio_id) VALUES
(3, 1),
(3, 2),
(4, 1),
(4, 2);

-- a. Obtener el total de entradas vendidas para el recital del grupo "El Cuarteto de 3" en el estadio "Defensores del
-- Bajo".
SELECT COUNT(*) total_entradas
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join banda b on b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.id = 7;

-- b. Determinar el m�ximo precio de entrada vendida para el recital del grupo "El Cuarteto de 3" en el estadio
-- "Defensores del Bajo".
SELECT max(s.precio) precio_maximo
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join banda b on b.id = r.banda_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
where l.nombre = 'Defensores del Bajo'
and r.banda_id = 7;

-- c. Contar el n�mero total de asientos disponibles en la secci�n "Platea baja 1" para el recital del grupo "El
-- Cuarteto de 3" en el estadio "Defensores del Bajo".

SELECT COUNT(a.id) cantidad_asientos_disponibles
from asiento a
JOIN seccion s ON a.seccion_id = s.id
JOIN lugar l ON s.lugar_id = l.id
WHERE s.nombre = 'Platea baja 1'
and l.nombre = 'Defensores del Bajo'
and a.id not in (SELECT asiento_id
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join banda b on b.id = r.banda_id
join lugar l on l.id = r.lugar_id
where l.nombre = 'Defensores del Bajo'
and r.banda_id = 7);

-- d. Calcular el total de ingresos generados por la venta de entradas para el recital del grupo "El Cuarteto de 3" en
-- el estadio "Defensores del Bajo".

SELECT sum(s.precio) total_ingresos
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join banda b on b.id = r.banda_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
where l.nombre = 'Defensores del Bajo'
and r.banda_id = 7;

-- e. Dado un DNI de un cliente obtener el nombre, la secci�n, el precio y el n�mero de asiento (si corresponde) de
-- todas las entradas compradas por ese cliente.

-- Ejemplo 1
select c.apellido, c.nombre, s.nombre, s.precio, a.fila, a.numero
from cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join banda b on b.id = r.banda_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
where l.nombre = 'Defensores del Bajo'
and b.id = 7
and c.dni = '12345678A';

-- Ejemplo 2
select c.nombre, c.apellido,  s.nombre, s.precio, a.fila, a.numero
from cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join banda b on b.id = r.banda_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
where l.nombre = 'Defensores del Bajo'
and b.id = 7
and c.dni = '23456789B';


-- f. Calcular el total de entradas vendidas por cada secci�n para el recital del grupo "El Cuarteto de 3" en el estadio
-- "Defensores del Bajo"

SELECT s.nombre seccion, count(s.id) total_entradas
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join banda b on b.id = r.banda_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
where l.nombre = 'Defensores del Bajo'
and b.id = 7
group by s.nombre;

-- g. Mostrar el nombre del cliente y el precio total de todas las entradas vendidas a ese cliente para el recital del
-- grupo "El Cuarteto de 3" en el estadio "Defensores del Bajo", ordenado por el precio total

select  c.apellido,c.nombre, sum(s.precio) total
from cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join banda b on b.id = r.banda_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
where l.nombre = 'Defensores del Bajo'
and b.id = 7
group by c.apellido, c.nombre
order by total;

-- h. Mostrar lo mismo que el punto anterior pero ordenado por nombre de cliente

select  c.apellido,c.nombre, sum(s.precio) total
from cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join banda b on b.id = r.banda_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
where l.nombre = 'Defensores del Bajo'
and b.id = 7
group by c.apellido, c.nombre
order by c.apellido, c.nombre;

select id, nombre from banda