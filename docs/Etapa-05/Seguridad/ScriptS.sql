USE BD_VENTAS;
GO

-- 1. Creamos un Rol específico para los Vendedores de la librería
CREATE ROLE Rol_Vendedor;
GO

-- 2. Le otorgamos permisos para ver e insertar datos en las ventas (GRANT)
GRANT SELECT, INSERT ON Ventas TO Rol_Vendedor;
GRANT SELECT, INSERT ON Detalle_venta TO Rol_Vendedor;
GO

-- 3. Le prohibimos expresamente que puedan borrar ventas (DENY)
DENY DELETE ON Ventas TO Rol_Vendedor;
GO
