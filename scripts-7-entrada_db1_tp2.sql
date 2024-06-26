drop procedure usp_entrada;
CREATE PROCEDURE usp_entrada
	@venta_id INT,	
	@recital_id INT,
	@asiento_id INT
AS

BEGIN TRY		
	
	 	INSERT INTO entrada (venta_id, recital_id, asiento_id) 
		VALUES (@venta_id, @recital_id, @asiento_id);
			
END TRY
BEGIN CATCH		
    
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
	