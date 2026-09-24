# Reglas de Negocio: Yenny - El Ateneo

## Reglas de Negocio Explícitas
* **RN.01:** El sistema debe actualizar de forma automática (restando una unidad) el stock disponible de libros o artículos en el inventario de la sucursal cada vez que se concrete y confirme una venta. Si el stock llega a cero o al punto de pedido mínimo, el sistema deberá generar una alerta de reposición.
* **RN.02:** Para realizar cualquier operación de compra o acumular beneficios del club de lectura, el comprador debe estar registrado previamente en la base de datos del sistema con sus datos obligatorios (DNI, nombre, correo electrónico y teléfono).
* **RN.03:** El comprobante o detalle de la venta debe almacenar de forma fija e inalterable el precio unitario exacto que tenía el libro o producto al momento en que se efectuó la transacción. Cualquier modificación o aumento de precios general que la librería realice posteriormente en el catálogo general no deberá alterar ni afectar retroactivamente los registros de las compras ya cerradas.
* **RN.04:** El sistema debe permitir procesar los pagos de los clientes mediante diferentes medios habilitados (efectivo, tarjeta de crédito/débito, o billeteras virtuales). En el caso de tarjetas o promociones bancarias vigentes, el sistema validará automáticamente si aplica algún recargo o descuento antes de cerrar la transacción.
* **RN.05:** Todo libro o artículo adquirido podrá ser cambiado dentro de un plazo máximo de 30 días corridos, siempre y cuando el cliente presente el ticket original de compra (asociado al historial) y el producto se encuentre en perfectas condiciones sin marcas de uso.
* **RN.06:** Los clientes que posean la membresía "socio preferencial" registrada en el sistema obtendrán de manera automática un 10% de descuento en el subtotal de libros de literatura general, excluyendo textos escolares oficiales o artículos en liquidación.

## Reglas de Negocio Implicitas
* **RN.07:** Ninguna venta podrá ser procesada si el artículo seleccionado cuenta con un stock físico igual a cero, a menos que se trate de un pedido especial o reserva previamente autorizada por el supervisor.
* **RN.08:** El sistema validará de forma automática la unicidad del DNI y del correo electrónico al momento de dar de alta a un nuevo cliente para evitar registros duplicados.
* **RN.09:** El sistema calculará de manera automática el subtotal por línea multiplicando la cantidad de unidades vendidas por el precio unitario histórico registrado, y sumará los subtotales para obtener el total general de la factura o ticket.
* **RN.10:** Si el pago se efectúa en efectivo, el sistema calculará automáticamente el vuelto que el cajero debe entregar al cliente en función del monto ingresado.
