USE BD_VENTAS;
GO
--Creamos un índice para acelerar las búsquedas por DNI del cliente
CREATE NONCLUSTERED INDEX IX_Ventas_DNI 
ON Ventas (DNI);
GO


--Consultamos los índices de la tabla para demostrar que se creó
EXEC sp_helpindex 'Ventas';
GO

--Ejecutamos una búsqueda rapidísima usando el índice (Cambiá el DNI por uno real)
SELECT * FROM Ventas WHERE DNI = '40112233';
GO