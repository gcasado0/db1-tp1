/*7) Escriba un Store Procedure (SP) que reciba todos los datos necesarios para una
compra y realice todos los INSERTS y UPDATES necesarios en las tablas
correspondientes. Para la modificación de cada tabla deberá llamar a otros SP
que reciban los datos necesarios. */

drop procedure usp_compra;
CREATE PROCEDURE usp_compra
	@DNI varchar(10),
	@fecha date,
	@recital_id INT,
	@asiento_id INT
AS

BEGIN TRY
		BEGIN TRANSACTION;
	
		DECLARE @VentaID INT;
	
		EXEC usp_venta @DNI, @Fecha, @VentaID OUTPUT;
	
		EXEC usp_entrada @VentaID, @recital_id, @asiento_id;
			 	
		COMMIT TRANSACTION;
END TRY
BEGIN CATCH		
    -- Si ocurre un error, deshacer la transacción
    ROLLBACK TRANSACTION;

    -- Capturar y mostrar el error
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE()        
    
   RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
   
END CATCH;
	
-- agregar constraint unique en entrada (recital_id, asiento_id)
-- agregar n registros en la tabla asiento para las secciones sin numeracion (de acuerdo a la capacidad del campo)


