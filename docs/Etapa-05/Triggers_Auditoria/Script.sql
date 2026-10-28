USE BD_VENTAS;
GO

-------------------------------------------------------------------
-- TRIGGER DE AUDITORÍA: Control de cambios de precios en Productos
-------------------------------------------------------------------

-- 1. Creamos primero una tabla auxiliar de auditoría (si no la tenías creada)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Auditoria_Precios')
BEGIN
    CREATE TABLE Auditoria_Precios (
        Id_auditoria INT IDENTITY(1,1) PRIMARY KEY,
        Id_producto INT,
        Precio_anterior DECIMAL(12,2),
        Precio_nuevo DECIMAL(12,2),
        Fecha_cambio DATETIME DEFAULT GETDATE(),
        Usuario VARCHAR(100) DEFAULT SYSTEM_USER
    );
END
GO

-- 2. Creamos el Trigger que se dispara ante un UPDATE en la tabla Producto
CREATE OR ALTER TRIGGER trg_AuditarCambioPrecio
ON Producto
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificamos si realmente se modificó la columna de precio (o si la tabla tiene el campo de precio)
    -- Insertamos en la tabla de auditoría los valores viejos (Deleted) y nuevos (Inserted)
    IF UPDATE(Precio)
    BEGIN
        INSERT INTO Auditoria_Precios (Id_producto, Precio_anterior, Precio_nuevo, Fecha_cambio, Usuario)
        SELECT 
            i.Id_producto,
            d.Precio AS Precio_anterior,
            i.Precio AS Precio_nuevo,
            GETDATE(),
            SYSTEM_USER
        FROM inserted i
        INNER JOIN deleted d ON i.Id_producto = d.Id_producto
        WHERE i.Precio <> d.Precio; -- Solo si el precio cambió
    END
END;
GO