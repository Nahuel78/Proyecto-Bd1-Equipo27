-- Consulta para ver un comprobante

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