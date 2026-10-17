# Consulta Avanzada: Categorías con Stock Superior al Promedio

## 1. Objetivo

Obtener las categorías de productos cuyo stock total disponible sea superior al promedio general de stock registrado en la tabla Producto_Deposito.

La consulta permite identificar las categorías que tienen una mayor disponibilidad de productos en comparación con el promedio general.
## 2. Tablas Involucradas

- Categoria: contiene la información de las categorías de productos.
- Producto: contiene los productos registrados y su categoría correspondiente.
- Producto_Deposito: almacena el stock disponible de cada producto en los depósitos.

## 3. Código SQL Implementado

```sql
SELECT 
    cat.Nombre_categoria,
    COUNT(p.Id_producto) AS Cantidad_Productos,
    SUM(pd.Stock_disponible) AS Stock_Total_Categoria
FROM Categoria cat
JOIN Producto p ON cat.Id_categoria = p.Id_categoria
JOIN Producto_Deposito pd ON p.Id_producto = pd.Id_producto
GROUP BY cat.Id_categoria, cat.Nombre_categoria
HAVING SUM(pd.Stock_disponible) > (
    SELECT AVG(Stock_disponible)
    FROM Producto_Deposito
);
GO
```
## 4. Explicación de la consulta

SELECT: muestra el nombre de la categoría, la cantidad de productos y el stock total disponible de cada categoría.

JOIN: relaciona las tablas Categoria, Producto y Producto_Deposito para obtener la información necesaria.

COUNT(): cuenta los registros de productos asociados a cada categoría.

SUM(): calcula el stock total disponible por categoría.

GROUP BY: agrupa los resultados por categoría.

HAVING: filtra las categorías cuyo stock total es superior al promedio general calculado por la subconsulta.

AVG(): calcula el promedio de los valores de Stock_disponible registrados en Producto_Deposito.

## 5. Resultados Esperados

La consulta muestra las categorías cuyo stock total supera el promedio general, indicando la cantidad de productos y el stock disponible por categoría. Esto facilita el análisis y el control del inventario.