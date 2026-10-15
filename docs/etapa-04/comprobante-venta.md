# Consulta y Emisión de Comprobante / Factura

## 1\. Descripción del Requerimiento

Implementar el encabezado y el detalle de una venta específica para estructurar un comprobante de pago completo, calculando subtotales por renglón, descuentos aplicados y precio total.

## 2\. Tablas Involucradas

- Comprobante  
- Ventas  
- Cliente  
- Detalle\_venta  
- Producto

## 3\. Código SQL Implementado

```
SELECT 
    c.Id_comprobante AS Nro_Comprobante,
    v.Fecha_compra,
    cli.Nombre + ' ' + cli.Apellido AS Nombre_Cliente,
    p.Titulo_nombre AS Producto,
    dv.Cantidad,
    dv.Precio_unitario,
    (dv.Cantidad * dv.Precio_unitario) AS Subtotal_Linea,
    c.Descuento,
    c.Precio_total
FROM Comprobante c, Ventas v, Cliente cli, Detalle_venta dv, Producto p
WHERE c.Id_venta = v.Id_venta
  AND v.DNI = cli.DNI
  AND v.Id_venta = dv.Id_venta
  AND dv.Id_producto = p.Id_producto
  AND c.Id_comprobante = 1;
GO
```

## 4\. Análisis y Resultados Esperados

Permite visualizar de manera unificada la información comercial y operativa de un ticket o factura en particular, facilitando la auditoría de transacciones.
