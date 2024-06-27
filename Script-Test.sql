-- Test script 5

select dbo.GetBandaId('ACDC') as ID;
select dbo.GetBandaId(nombre) as ID from banda;


-- Test script 6 -----------------------------------------------------------------------

select dbo.GetTotalRecaudado(1, '2024-01-01', '2024-06-30') as Total;
select dbo.GetTotalRecaudado(1, '2024-07-01', '2024-12-31') as Total;

-- Test script 7 -----------------------------------------------------------------------

DECLARE @tabla_asiento dbo.TipoTablaAsiento;

INSERT INTO @tabla_asiento (asiento_id)
VALUES (10), (14), (13);

DECLARE @DNI VARCHAR(10) = '56789012O';
DECLARE @Fecha DATE = GETDATE();
DECLARE @recital_id INT = 1;

EXEC usp_compra @DNI, @Fecha, @recital_id, @tabla_asiento;

-- Caso con un asiento_id que no existe ------------------------------------------------------------------------

DECLARE @tabla_asiento dbo.TipoTablaAsiento;

INSERT INTO @tabla_asiento (asiento_id)
VALUES (1), (2), (300);

DECLARE @Fecha DATE = GETDATE();

EXEC usp_compra '12345678K', @Fecha, 1, @tabla_asiento;

-- Caso con un dni que no existe --------------------------------------------------------------------------------

DECLARE @tabla_asiento dbo.TipoTablaAsiento;

INSERT INTO @tabla_asiento (asiento_id)
VALUES (1), (2);

DECLARE @Fecha DATE = GETDATE();

EXEC usp_compra '56789012J', @Fecha, 1, @tabla_asiento;

--------------------------------------------------