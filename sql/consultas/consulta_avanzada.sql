-- Consulta avanzada: Stock de productos y sus categorías

SELECT 
    p.Titulo_nombre AS Producto,
    cat.Nombre_categoria,
    g.Nombre_genero,
    p.Precio,
    pd.Stock_disponible,
    pd.Stock_minimo,
    d.Estado_reposicion
FROM Producto p, Categoria cat, Genero g, Producto_Deposito pd, Deposito d
WHERE p.Id_categoria = cat.Id_categoria
  AND p.Id_genero = g.Id_genero
  AND p.Id_producto = pd.Id_producto
  AND pd.Id_deposito = d.Id_deposito
  AND pd.Stock_disponible <= pd.Stock_minimo;
GO