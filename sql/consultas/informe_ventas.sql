-- Informe general de ventas: Total de ventas por categoría en un rango de fechas
SELECT 
    cat.Nombre_categoria,
    COUNT(DISTINCT v.Id_venta) AS Cantidad_Ventas,
    SUM(dt.Cantidad) AS Total_Unidades_Vendidas,
    SUM(dt.Cantidad * dt.Precio_unitario) AS Monto_Total_Recaudado
FROM Ventas v
JOIN Detalle_venta dt ON v.Id_venta = dt.Id_venta
JOIN Producto p ON dt.Id_producto = p.Id_producto
JOIN Categoria cat ON p.Id_categoria = cat.Id_categoria
WHERE v.Fecha_compra BETWEEN '2026-01-01 00:00:00' AND '2026-12-31 23:59:59'
GROUP BY cat.Id_categoria, cat.Nombre_categoria
HAVING SUM(dt.Cantidad * dt.Precio_unitario) > 0;
GO
