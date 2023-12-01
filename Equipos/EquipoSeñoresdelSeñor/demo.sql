--DEMO
--insert cliente;
INSERT INTO public.cliente 
VALUES ('ARFF940101HDF', 'fernando.arreola@fi.unam.edu', '1994-01-01',
	'Fernando Arreola Franco', 'Fernando', 'Arreola', 'Franco',
	'Av. Universidad', '3000', 'Coyoacán', '04510', 'Ciudad de México');
--select * from cliente; --es para corroborar que nuestro cliente esté insertado correctamente
select rfc,razon_social from cliente where rfc='ARFF940101HDF'; --es para corroborar que nuestro cliente esté insertado correctamente

--Insertar orden
INSERT INTO orden VALUES('ORD-020',now(), 6 , 'ARFF940101HDF', 97, 'ACTIVA' );
SELECT * FROM ORDEN; --es para corroborar que nuestro cliente esté insertado correctamente

--Agregar pedido con la función
select agregarproducto(0801, 1, 'ORD-020');
select * from orden;
select agregarproducto(0705, 1, 'ORD-020'); --prueba de un producto no disponible

--ver producto más vendido
select * from  vista_producto_mas_vendido;

--ver las órdenes por x empleado;
select ordenes_por_empleado(11);
select ordenes_por_empleado(15); --probar que 15 no es un empleado

--ver los productos que no están disponibles
--select * from producto; --primero ver todos los productos
select cod_barra,nombre_producto,disponibilidad from producto; --primero ver todos los productos
select productos_no_disponibles();
--el código anterior es lo mismo que
select cod_barra,nombre_producto from producto where disponibilidad=false; --primero ver todos los productos

--el siguiente código es para mostrar lo que va almacenando de manera automática el trigger al ejecutar una inserción de una orden
select * from agrega_historial;

--para eliminar la orden--
--delete from agrega where folio_orden = 'ORD-020';
--delete from orden where rfc_cliente = 'ARFF940101HDF';
--delete from cliente where rfc = 'ARFF940101HDF';
--select rfc,razon_social from cliente where rfc='ARFF940101HDF'; --es para corroborar que nuestro cliente esté insertado correctamente
select id,fecha_hora,tipo_operacion from agrega_historial;

--para ver las ordenes de un empleado en un rango de fechas
select ordenes_fechas('2023-11-25', '2023-11-29'); --regresa el total de ventas y el total pagado
select ordenes_por_dia2('2023-11-24');

--para ver los índices de las tablas 'producto' y de 'agrega'
\d producto;
\d agrega;

--para generar la factura de un cliente
select terminar_y_facturar('ARFF940101HDF', 'ORD-020');
