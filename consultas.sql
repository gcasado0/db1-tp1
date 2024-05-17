-- a. Obtener el total de entradas vendidas para el recital del grupo "El Cuarteto de 3" en el estadio "Defensores del Bajo".
SELECT COUNT(*) total_entradas 
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
where l.nombre = 'Defensores del Bajo'
and r.artista = 'El cuarteto de 3';

-- b. Determinar el máximo precio de entrada vendida para el recital del grupo "El Cuarteto de 3" en el estadio "Defensores del Bajo".
SELECT max(precio) precio_maximo
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
join asiento a on a.id = e.asiento_id 
join seccion s on s.id = a.seccion_id 
where l.nombre = 'Defensores del Bajo'
and r.artista = 'El cuarteto de 3';

-- c. Contar el número total de asientos disponibles en la sección "Platea baja 1" para el
-- recital del grupo "El Cuarteto de 3" en el estadio "Defensores del Bajo".

SELECT COUNT(a.id) cantidad_asientos_disponibles 
from asiento a
JOIN seccion s ON a.seccion_id = s.id
JOIN lugar l ON s.lugar_id = l.id
WHERE s.nombre = 'Platea baja 1'
and l.nombre = 'Defensores del Bajo'
and a.id not in (SELECT asiento_id
FROM db1_tp1.dbo.entrada e
join recital r on r.id = e.recital_id
join lugar l on l.id = r.lugar_id
where l.nombre = 'Defensores del Bajo'
and r.artista = 'El cuarteto de 3');



