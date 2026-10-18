# Consulta: Informe General de Ventas

## 1. Descripción del Requerimiento

Obtener un resumen de las ventas realizadas durante 2026, agrupadas por categoría de producto. Mostrar la cantidad de ventas asociadas, el total de unidades vendidas y el monto total recaudado para cada una.

## 2. Tablas Involucradas
- Ventas
- Detalle_venta
- Producto
- Categoria

## 3. Código SQL Implementado
```
SELECT 
    cat.Nombre_categoria,
    COUNT(DISTINCT v.Id_venta) AS Cantidad_Ventas,
    SUM(dt.Cantidad) AS Total_Unidades_Vendidas,
    SUM(dt.Cantidad * dt.Precio_unitario) AS Monto_Total_Recaudado
FROM Ventas v
JOIN Detalle_venta dt ON v.Id_venta = dt.Id_venta
JOIN Producto p ON dt.Id_producto = p.Id_producto
JOIN Categoria cat ON p.Id_categoria = cat.Id_categoria
WHERE v.Fecha_compra BETWEEN '20260101 00:00:00' AND '20261231 23:59:59'
GROUP BY cat.Id_categoria, cat.Nombre_categoria
HAVING SUM(dt.Cantidad * dt.Precio_unitario) > 0;
GO
```

## 4. Explicación y Resultados Esperados
Se muestra una fila por cada categoría que haya generado ganancias mayores a cero durante 2026. Cada fila muestra la cantidad de ventas, las unidades vendidas y el monto total recaudado por cada categoría. Facilita el análisis de las ventas realizadas y la popularidad de cada categoría.
