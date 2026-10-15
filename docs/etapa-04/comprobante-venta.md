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

SELECT 

    c.Id\_comprobante AS Nro\_Comprobante,

    v.Fecha\_compra,

    cli.Nombre \+ ' ' \+ cli.Apellido AS Nombre\_Cliente,

    p.Titulo\_nombre AS Producto,

    dv.Cantidad,

    dv.Precio\_unitario,

    (dv.Cantidad \* dv.Precio\_unitario) AS Subtotal\_Linea,

    c.Descuento,

    c.Precio\_total

FROM Comprobante c, Ventas v, Cliente cli, Detalle\_venta dv, Producto p

WHERE c.Id\_venta \= v.Id\_venta

  AND v.DNI \= cli.DNI

  AND v.Id\_venta \= dv.Id\_venta

  AND dv.Id\_producto \= p.Id\_producto

  AND c.Id\_comprobante \= 1;

GO

## 4\. Análisis y Resultados Esperados

Permite visualizar de manera unificada la información comercial y operativa de un ticket o factura en particular, facilitando la auditoría de transacciones.