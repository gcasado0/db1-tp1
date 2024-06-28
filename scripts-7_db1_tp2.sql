/*7) Escriba un Store Procedure (SP) que reciba todos los datos necesarios para una
compra y realice todos los INSERTS y UPDATES necesarios en las tablas
correspondientes. Para la modificación de cada tabla deberá llamar a otros SP
que reciban los datos necesarios. */

drop procedure usp_compra;

CREATE TYPE dbo.TipoTablaAsiento AS TABLE (
    asiento_id INT
);

CREATE PROCEDURE usp_compra
	@DNI varchar(10),
	@fecha date,
	@recital_id INT,
	@tabla_asiento dbo.TipoTablaAsiento READONLY
AS

BEGIN TRY
		BEGIN TRANSACTION;
	
		DECLARE @VentaID INT;
	
		EXEC usp_venta @DNI, @Fecha, @VentaID OUTPUT;
	
		DECLARE asiento_cursor CURSOR FOR SELECT asiento_id FROM @tabla_asiento;
	    
	    DECLARE @asiento_id INT;
	    
	    -- Abrir el cursor
	    OPEN asiento_cursor;
	    
	    -- Obtener la primera fila
	    FETCH NEXT FROM asiento_cursor INTO @asiento_id;
	    
	    -- Iterar sobre las filas de la tabla @tabla_asiento
	    WHILE @@FETCH_STATUS = 0
	    BEGIN
	        -- Ejecutar el procedimiento almacenado usp_entrada para cada asiento_id
	        EXEC usp_entrada @VentaID, @recital_id, @asiento_id;
	        
	        -- Obtener la siguiente fila
	        FETCH NEXT FROM asiento_cursor INTO @asiento_id;
	    END;
	    
	    -- Cerrar y liberar la memoria del cursor
	    CLOSE asiento_cursor;
	    DEALLOCATE asiento_cursor;
		
			 	
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