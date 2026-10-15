# Consulta de Negocio Avanzada (Control de Stock y Reposición)

## 1\. Descripción del Requerimiento

Combinar múltiples tablas del sistema para identificar de forma automatizada aquellos productos cuyo stock disponible se encuentra por debajo o igual al stock mínimo requerido, ayudando en la gestión logística de depósitos.

## 2\. Tablas Involucradas

- Producto  
- Categoria  
- Genero  
- Producto\_Deposito  
- Deposito

## 3\. Código SQL Implementado

SELECT 

    p.Titulo\_nombre AS Producto,

    cat.Nombre\_categoria,

    g.Nombre\_genero,

    p.Precio,

    pd.Stock\_disponible,

    pd.Stock\_minimo,

    d.Estado\_reposicion

FROM Producto p, Categoria cat, Genero g, Producto\_Deposito pd, Deposito d

WHERE p.Id\_categoria \= cat.Id\_categoria

  AND p.Id\_genero \= g.Id\_genero

  AND p.Id\_producto \= pd.Id\_producto

  AND pd.Id\_deposito \= d.Id\_deposito

  AND pd.Stock\_disponible \<= pd.Stock\_minimo;

GO

## 4\. Análisis y Resultados Esperados

Cruza 5 tablas relacionales para unificar dimensiones de catálogo, inventario y logística, aplicando un filtro condicional estricto que aislará únicamente los ítems que requieran reposición inmediata.