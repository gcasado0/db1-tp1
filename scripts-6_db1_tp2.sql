-- 6) Escriba una función que reciba un identificador de una banda y dos fechas y
-- devuelva el total recaudado en los recitales entre esas dos fechas.

DROP FUNCTION GetTotalRecaudado;
CREATE FUNCTION GetTotalRecaudado(@banda_id INT, @desde date, @hasta date)
RETURNS money
AS
BEGIN
	DECLARE @total INTEGER

	SELECT @total = sum(s.precio)
	FROM entrada e
	join recital r on r.id = e.recital_id
	join asiento a on a.id = e.asiento_id
	join seccion s on s.id = a.seccion_id	
	where r.banda_id = @banda_id
	and cast(r.fecha_hora as date) >= @desde
	and cast(r.fecha_hora as date) <= @hasta

	IF (@total IS NULL)
		SET @total = 0

	RETURN @total
END