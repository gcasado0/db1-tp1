drop procedure usp_venta;
CREATE PROCEDURE usp_venta
	@DNI varchar(10),
	@fecha date,
	@IDGenerado INT OUTPUT
AS

BEGIN TRY

		DECLARE @TablaID TABLE (ID INT);

		INSERT INTO venta (fecha, cliente_dni)
		OUTPUT INSERTED.ID INTO @TablaID(ID)
		VALUES (@fecha, @DNI);

    	SELECT @IDGenerado = ID FROM @TablaID;
    	
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