USE BD_VENTAS;
GO

GRANT SELECT, INSERT ON Ventas TO Rol_Vendedor;
GRANT SELECT, INSERT ON Detalle_venta TO Rol_Vendedor;
DENY DELETE ON Ventas TO Rol_Vendedor;
GO

EXEC sp_helprotect @username = 'Rol_Vendedor';
GO
