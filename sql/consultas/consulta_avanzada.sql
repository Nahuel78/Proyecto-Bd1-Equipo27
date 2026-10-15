-- Consulta Avanzada: Categorías con stock total disponible superior al promedio general
SELECT 
    cat.Nombre_categoria,
    COUNT(p.Id_producto) AS Cantidad_Productos,
    SUM(pd.Stock_disponible) AS Stock_Total_Categoria
FROM Categoria cat
JOIN Producto p ON cat.Id_categoria = p.Id_categoria
JOIN Producto_Deposito pd ON p.Id_producto = pd.Id_producto
GROUP BY cat.Id_categoria, cat.Nombre_categoria
HAVING SUM(pd.Stock_disponible) > (
    SELECT AVG(Stock_disponible) FROM Producto_Deposito
);
GO