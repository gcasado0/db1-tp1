-- a. Obtener el total de entradas vendidas para el recital del grupo 
--"El Cuarteto de 3" en el estadio "Defensores del Bajo".

SELECT COUNT(*) total_entradas
FROM db1_tp2.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3';

-- b. Determinar el máximo precio de entrada vendida para el recital del grupo
--"El Cuarteto de 3" en el estadio "Defensores del Bajo".

SELECT max(s.precio) precio_maximo
FROM db1_tp2.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3';

-- c. Contar el número total de asientos disponibles en la sección "Platea baja 1" para el
-- recital del grupo "El Cuarteto de 3" en el estadio "Defensores del Bajo".

SELECT COUNT(a.id) cantidad_asientos_disponibles
from db1_tp2.dbo.asiento a
JOIN seccion s ON a.seccion_id = s.id
JOIN lugar l ON s.lugar_id = l.id
WHERE s.nombre = 'Platea baja 1'
and l.nombre = 'Defensores del Bajo'
and a.id not in (SELECT asiento_id
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3');

-- d. Calcular el total de ingresos generados por la venta de entradas para el recital del
-- grupo "El Cuarteto de 3" en el estadio "Defensores del Bajo".

SELECT sum(s.precio) total_ingresos
FROM db1_tp2.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3';

-- e. Dado un DNI de un cliente obtener el nombre, la sección, el precio y el número de
-- asiento (si corresponde) de todas las entradas compradas por ese cliente.

-- Ejemplo 1
select c.apellido, c.nombre, s.nombre, s.precio, a.fila, a.numero 
from db1_tp2.dbo.cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3'
and c.dni = '12345678K';

-- Ejemplo 2
select c.nombre, c.apellido,  s.nombre, s.precio, a.fila, a.numero 
from db1_tp2.dbo.cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3'
and c.dni = '34567890M';


-- f. Calcular el total de entradas vendidas por cada sección para el recital del grupo "El
-- Cuarteto de 3" en el estadio "Defensores del Bajo"

SELECT s.nombre seccion, count(s.id) total_entradas
FROM db1_tp2.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3'
group by s.nombre;

-- g. Mostrar el nombre del cliente y el precio total de todas las entradas vendidas a ese
-- cliente para el recital del grupo "El Cuarteto de 3" en el estadio "Defensores del
-- Bajo", ordenado por el precio total

select  c.apellido,c.nombre, sum(s.precio) total
from db1_tp2.dbo.cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3'
group by c.apellido, c.nombre
order by total;

-- h. Mostrar lo mismo que el punto anterior pero ordenado por nombre de cliente

select  c.apellido,c.nombre, sum(s.precio) total
from db1_tp2.dbo.cliente c
join venta v on c.dni = v.cliente_dni
join entrada e on  e.venta_id = v.id
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id
join seccion s on s.id = a.seccion_id
JOIN banda b ON b.id = r.banda_id
where l.nombre = 'Defensores del Bajo'
and b.nombre = 'El cuarteto de 3'
group by c.apellido, c.nombre
order by c.apellido, c.nombre;
