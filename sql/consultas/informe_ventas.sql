---Informe general de ventas de un cliente

SELECT 
    cli.DNI,
    cli.Nombre + ' ' + cli.Apellido AS Cliente,
    (SELECT COUNT(v.Id_venta) 
     FROM Ventas v 
     WHERE v.DNI = cli.DNI) AS Total_Ventas,
     
    (SELECT SUM(c.Precio_total) 
     FROM Ventas v, Comprobante c 
     WHERE v.Id_venta = c.Id_venta 
       AND v.DNI = cli.DNI) AS Dinero_Total_Gastado
FROM Cliente cli;
GO