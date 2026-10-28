USE BD_VENTAS;
GO
-- Ingreso de los Datos del CLiente 
EXEC sp_RegistrarVentaCompleta
    @DNICliente = '31223344',       
    @IdProducto = 1,                         
    @IdDeposito = 1,                         
    @CantidadComprada = 1,                   
    @PrecioUnitario = 5000.00,               
    @IdMedioPago = 1,                        
    @MontoIngresado = 5000.00;               
GO