-- 5) Escriba una función que recibiendo el nombre de una banda devuelva un identificador de esta. 

CREATE FUNCTION GetBandaId(@nombre VARCHAR(100))
RETURNS INTEGER
AS
BEGIN
	DECLARE @ID INTEGER

	SELECT @ID = b.id
	FROM banda b
	where b.nombre= @nombre

	RETURN @ID
END
