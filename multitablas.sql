
SELECT p.id AS pedido_id, c.nombre AS cliente, p.fecha, p.total
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.id;


SELECT p.id AS pedido_id, c.nombre AS cliente, u.direccion, ci.nombre AS ciudad
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
LEFT JOIN Ciudad ci ON u.ciudad_id = ci.id;

SELECT pr.nombre AS producto, pr.precio, prov.nombre AS proveedor, tp.tipo_nombre AS tipo_producto
FROM Productos pr
JOIN Proveedores prov ON pr.proveedor_id = prov.id
JOIN TiposProductos tp ON pr.tipo_id = tp.id;


SELECT e.nombre AS EmpleadoNombre, p.id AS PedidoID, c.nombre AS ClienteNombre, ci.nombre AS CiudadNombre
FROM Empleados e
INNER JOIN DatosEmpleados de ON e.id = de.idEmpleado
INNER JOIN EmpleadoProveedor ep ON e.id = ep.empleado_id
INNER JOIN Proveedores prov ON ep.proveedor_id = prov.id
INNER JOIN Productos pr ON prov.id = pr.proveedor_id
INNER JOIN DetallesPedido dp ON pr.id = dp.producto_id
INNER JOIN Pedidos p ON dp.pedido_id = p.id
INNER JOIN Clientes c ON p.cliente_id = c.id
INNER JOIN Ubicaciones u ON c.id = u.entidad_id AND u.entidad_tipo = 'Cliente'
INNER JOIN Ciudad ci ON u.ciudad_id = ci.id
WHERE ci.nombre = 'Guadalajara';


SELECT pr.nombre AS producto, SUM(dp.cantidad) AS total_vendido
FROM DetallesPedido dp
JOIN Productos pr ON dp.producto_id = pr.id
GROUP BY pr.nombre
ORDER BY total_vendido DESC
LIMIT 5;


SELECT c.nombre AS cliente, ci.nombre AS ciudad, COUNT(p.id) AS total_pedidos
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
LEFT JOIN Ciudad ci ON u.ciudad_id = ci.id
GROUP BY c.nombre, ci.nombre;

SELECT c.nombre AS cliente, prov.nombre AS proveedor, ci.nombre AS ciudad
FROM Clientes c
JOIN Ubicaciones uc ON uc.entidad_id = c.id AND uc.entidad_tipo = 'Cliente'
JOIN Ciudad ci ON uc.ciudad_id = ci.id
JOIN Ubicaciones up ON up.ciudad_id = ci.id AND up.entidad_tipo = 'Proveedor'
JOIN Proveedores prov ON up.entidad_id = prov.id;

SELECT tp.tipo_nombre, SUM(dp.cantidad * dp.precio) AS total_ventas
FROM DetallesPedido dp
JOIN Productos pr ON dp.producto_id = pr.id
JOIN TiposProductos tp ON pr.tipo_id = tp.id
GROUP BY tp.tipo_nombre;

SELECT e.nombre AS EmpleadoNombre, p.id AS PedidoID, pr.nombre AS ProductoNombre, prov.nombre AS ProveedorNombre
FROM Empleados e
INNER JOIN DatosEmpleados de ON e.id = de.idEmpleado
INNER JOIN EmpleadoProveedor ep ON e.id = ep.empleado_id
INNER JOIN Proveedores prov ON ep.proveedor_id = prov.id
INNER JOIN Productos pr ON prov.id = pr.proveedor_id
INNER JOIN DetallesPedido dp ON pr.id = dp.producto_id
INNER JOIN Pedidos p ON dp.pedido_id = p.id
WHERE prov.nombre = 'Proveedor A';

SELECT prov.nombre AS proveedor, SUM(dp.cantidad * dp.precio) AS total_ingreso
FROM DetallesPedido dp
JOIN Productos pr ON dp.producto_id = pr.id
JOIN Proveedores prov ON pr.proveedor_id = prov.id
GROUP BY prov.nombre;
