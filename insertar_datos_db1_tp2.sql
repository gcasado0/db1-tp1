USE db1_tp2;

-- Cargo los datos de prueba
 
INSERT INTO lugar (nombre) VALUES 
('Defensores del Bajo'),
('River Plate'),
('Boca'),
('Luna Park'),
('La Plata');

INSERT INTO banda (nombre) VALUES 
('Soda Estereo'),
('ACDC'),
('Pink FLoyd'),
('Guns n roses'),
('The Beatles'),
('Queen'),
('Metallica'),
('El cuarteto de 3');

INSERT INTO recital (fecha_hora, banda_id, lugar_id) VALUES 
('2024-07-15 20:00:00', 1, 1),
('2024-07-20 20:00:00', 2, 2),
('2024-08-05 20:00:00', 3, 3),
('2024-09-15 20:00:00', 4, 5),
('2024-09-25 20:00:00', 8, 2),
('2024-09-11 20:00:00', 5, 1),
('2024-10-10 20:00:00', 6, 3),
('2024-10-20 20:00:00', 7, 4);

INSERT INTO seccion (nombre, precio, lugar_id, capacidad_maxima) VALUES
('Campo delantero', 500, 1, 2000),
('Campo trasero', 300, 1, 3000),
('Platea baja 1', 1100, 1, 0),
('Platea baja 2', 1200, 1, 0),
('Platea alta 1', 710, 1, 0),
('Platea alta 2', 720, 1, 0);

INSERT INTO seccion (nombre, precio, lugar_id, capacidad_maxima) VALUES
('Campo delantero', 1500, 2, 2000),
('Campo trasero', 1300, 2, 3000),
('Platea baja 1', 2100, 2, 0),
('Platea baja 2', 2200, 2, 0),
('Platea alta 1', 1710, 2, 0),
('Platea alta 2', 1720, 2, 0);

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
('12345678A', 'Juan', 'Pérez', '1980-01-01'),
('23456789B', 'María', 'García', '1990-02-02'),
('34567890C', 'Luis', 'Martínez', '1975-03-03'),
('45678901D', 'Ana', 'López', '1985-04-04'),
('56789012E', 'Carlos', 'Fernández', '1978-05-05'),
('67890123F', 'Laura', 'Sánchez', '1988-06-06'),
('78901234G', 'José', 'Ramírez', '1995-07-07'),
('89012345H', 'Elena', 'Torres', '1992-08-08'),
('90123456I', 'Pablo', 'Vargas', '1983-09-09'),
('01234567J', 'Marta', 'Reyes', '1991-10-10'),
('12345678K', 'Sofía', 'Castro', '1987-11-11'),
('23456789L', 'Miguel', 'Ortega', '1979-12-12'),
('34567890M', 'Clara', 'Navarro', '1982-01-13'),
('45678901N', 'Roberto', 'Molina', '1976-02-14'),
('56789012O', 'Lucía', 'Romero', '1989-03-15'),
('67890123P', 'David', 'Gil', '1984-04-16'),
('78901234Q', 'Andrea', 'Rivas', '1993-05-17'),
('89012345R', 'Pedro', 'Pérez', '1990-06-18'),
('90123456S', 'Natalia', 'Flores', '1994-07-19'),
('01234567T', 'Jorge', 'Hernández', '1981-08-20');


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
('2024-05-13', '34567890M'),
('2024-05-14', '45678901N'),
('2024-05-15', '56789012O'),
('2024-05-16', '67890123P'),
('2024-05-17', '78901234Q'),
('2024-05-18', '89012345R'),
('2024-05-19', '90123456S'),
('2024-05-20', '01234567T');

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

INSERT INTO entrada (venta_id, recital_id, asiento_id) VALUES
(10, 6, 71),
(11, 6, 42),
(12, 6, 33),
(13, 6, 24);


INSERT INTO servicio (nombre) VALUES
('Acceso exclusivo'),
('Catering');

INSERT INTO seccion_servicio (seccion_id, servicio_id) VALUES
(3, 1),
(3, 2),
(4, 1),
(4, 2);
