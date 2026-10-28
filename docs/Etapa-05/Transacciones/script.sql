USE BD_VENTAS;
GO

-----------------------------------------------------------------
-- TRANSACCIÓN: Registrar una venta completa de forma segura
-----------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_RegistrarVentaCompleta
    @DNICliente VARCHAR(10),
    @IdProducto INT,
    @IdDeposito INT,
    @CantidadComprada INT,
    @PrecioUnitario DECIMAL(12,2),
    @IdMedioPago INT,
    @MontoIngresado DECIMAL(12,2)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Iniciar la transacción
    BEGIN TRANSACTION;

    BEGIN TRY
        -- 1. Validar stock disponible
        DECLARE @StockActual INT;
        SELECT @StockActual = Stock_disponible 
        FROM Producto_Deposito 
        WHERE Id_producto = @IdProducto AND Id_deposito = @IdDeposito;

        IF @StockActual < @CantidadComprada
        BEGIN
            RAISERROR('Stock insuficiente en el depósito seleccionado para completar la venta.', 16, 1);
        END

        -- 2. Insertar la cabecera de la venta
        INSERT INTO Ventas (Fecha_compra, DNI)
        VALUES (GETDATE(), @DNICliente);

        DECLARE @NuevoIdVenta INT = SCOPE_IDENTITY();

        -- 3. Insertar el detalle de la venta
        INSERT INTO Detalle_venta (Id_producto, Id_venta, Cantidad, Precio_unitario)
        VALUES (@IdProducto, @NuevoIdVenta, @CantidadComprada, @PrecioUnitario);

        -- 4. Actualizar (descontar) el stock en el depósito
        UPDATE Producto_Deposito
        SET Stock_disponible = Stock_disponible - @CantidadComprada
        WHERE Id_producto = @IdProducto AND Id_deposito = @IdDeposito;

        -- 5. Generar el comprobante correspondiente
        DECLARE @SubtotalCalc DECIMAL(12,2) = @CantidadComprada * @PrecioUnitario;
        INSERT INTO Comprobante (Id_venta, Descuento, Subtotal, Precio_total)
        VALUES (@NuevoIdVenta, 0.00, @SubtotalCalc, @SubtotalCalc);

        -- 6. Registrar el pago de la venta
        INSERT INTO Pago_Ventas (Id_medio_pago, Id_venta, Monto_ingresado)
        VALUES (@IdMedioPago, @NuevoIdVenta, @MontoIngresado);

        -- Si todo salió bien, confirmamos la transacción
        COMMIT TRANSACTION;
        PRINT 'Venta registrada con éxito.';
    END TRY
    BEGIN CATCH
        -- Si ocurre cualquier error, revertimos todos los cambios
        ROLLBACK TRANSACTION;
        
        DECLARE @MensajeError VARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@MensajeError, 16, 1);
    END CATCH
END;
GO