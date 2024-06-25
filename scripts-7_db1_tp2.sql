/*7) Escriba un Store Procedure (SP) que reciba todos los datos necesarios para una
compra y realice todos los INSERTS y UPDATES necesarios en las tablas
correspondientes. Para la modificación de cada tabla deberá llamar a otros SP
que reciban los datos necesarios. */

drop procedure usp_venta;
CREATE PROCEDURE usp_venta
	@DNI varchar(10),
	@fecha date,
	@recital_id INT,
	@asiento_id INT
AS

BEGIN TRY
		BEGIN TRANSACTION;
	
		DECLARE @NuevoID TABLE (ID INT);
	
		INSERT INTO venta (fecha, cliente_dni)
		OUTPUT INSERTED.ID INTO @NuevoID(ID)
		VALUES (@fecha, @DNI);
		
	 	DECLARE @IDGenerado INT;
    	SELECT @IDGenerado = ID FROM @NuevoID;
	
		INSERT INTO entrada (venta_id, recital_id, asiento_id) 
		VALUES (@IDGenerado, @recital_id, @asiento_id);
	
		COMMIT TRANSACTION;
END TRY
BEGIN CATCH		
    -- Si ocurre un error, deshacer la transacción
    ROLLBACK TRANSACTION;

    -- Capturar y mostrar el error
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
    DECLARE @ErrorLine INT;
    DECLARE @ErrorProcedure NVARCHAR(200);

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE(),
        @ErrorLine = ERROR_LINE(),
        @ErrorProcedure = ERROR_PROCEDURE();

    -- Mostrar los detalles del error
    PRINT 'Error Message: ' + @ErrorMessage;
    PRINT 'Error Severity: ' + CAST(@ErrorSeverity AS NVARCHAR);
    PRINT 'Error State: ' + CAST(@ErrorState AS NVARCHAR);
    PRINT 'Error Line: ' + CAST(@ErrorLine AS NVARCHAR);
    PRINT 'Error Procedure: ' + ISNULL(@ErrorProcedure, '-');
   
   RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
   
END CATCH;
	
-- agregar constraint unique en entrada (recital_id, asiento_id)
-- agregar n registros en la tabla asiento para las secciones sin numeracion (de acuerdo a la capacidad del campo)



