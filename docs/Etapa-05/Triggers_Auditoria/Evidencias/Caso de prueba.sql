USE BD_VENTAS;
GO

UPDATE Producto 
SET Precio = Precio + 100 
WHERE Id_producto = 1;
GO

SELECT * FROM Auditoria_Precios;
GO