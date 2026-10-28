USE BD_VENTAS;
GO

-----------------------------------------------------------------
-- 1. FUNCIÓN: Calcular el subtotal de una venta específica
-----------------------------------------------------------------
CREATE OR ALTER FUNCTION dbo.fn_CalcularTotalVenta (@IdVenta INT)
RETURNS DECIMAL(12,2)
AS
BEGIN
    DECLARE @Total DECIMAL(12,2);
    
    SELECT @Total = SUM(Cantidad * Precio_unitario)
    FROM Detalle_venta
    WHERE Id_venta = @IdVenta;
    
    RETURN ISNULL(@Total, 0.00);
END;
GO

-- Prueba de ejecución de la función:
-- SELECT dbo.fn_CalcularTotalVenta(1) AS TotalVenta;
-- GO

-----------------------------------------------------------------
-- 2. STORED PROCEDURE: Consultar stock disponible de un producto por depósito
-----------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_ConsultarStockProducto
    @IdProducto INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT p.Id_producto, p.Titulo_nombre, pd.Id_deposito, pd.Stock_disponible, pd.Stock_minimo
    FROM Producto p
    INNER JOIN Producto_Deposito pd ON p.Id_producto = pd.Id_producto
    WHERE p.Id_producto = @IdProducto;
END;
GO

-- Prueba de ejecución del Stored Procedure:
-- EXEC sp_ConsultarStockProducto @IdProducto = 1;
-- GO