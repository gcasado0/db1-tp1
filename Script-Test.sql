-- Test script 5 

select dbo.GetBandaId('ACDC') as ID;
select dbo.GetBandaId(nombre) as ID from banda; 


-- Test script 6

select dbo.GetTotalRecaudado(1, '2024-01-01', '2024-06-30') as Total;
select dbo.GetTotalRecaudado(1, '2024-07-01', '2024-12-31') as Total;


-- Test script 7

EXEC usp_venta '56789012O','2024-06-25',1,3;

DECLARE @ErrorMessage NVARCHAR(4000);
EXEC @ErrorMessage = usp_venta '56789012O','2024-06-25',1,300;
SELECT @ErrorMessage
