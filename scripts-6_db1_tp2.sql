-- 6) Escriba una función que reciba un identificador de una banda y dos fechas y
-- devuelva el total recaudado en los recitales entre esas dos fechas.

-- DROP FUNCTION GetTotalRecaudado;
CREATE FUNCTION GetTotalRecaudado(@ID INT, @desde date, @hasta date)
RETURNS money
AS
BEGIN
	DECLARE @total INTEGER
	
	SELECT @total = sum(s.precio)
	FROM entrada e
	join recital r on r.id = e.recital_id
	join lugar l on l.id = r.lugar_id
	join asiento a on a.id = e.asiento_id
	join seccion s on s.id = a.seccion_id
	join banda b on b.id = r.banda_id 
	where l.nombre = 'Defensores del Bajo'
	and b.nombre = 'El cuarteto de 3'
	and cast(r.fecha_hora as date) >= @desde
	and cast(r.fecha_hora as date) <= @hasta
	
	IF (@total IS NULL) 
		SET @total = 0

	RETURN @total
END
