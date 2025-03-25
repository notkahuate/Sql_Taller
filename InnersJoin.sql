
SELECT p.id AS pedido_id, c.nombre AS cliente, p.fecha, p.total
FROM Pedidos p
INNER JOIN Clientes c ON p.cliente_id = c.id;

SELECT pr.nombre AS producto, prov.nombre AS proveedor
FROM Productos pr
INNER JOIN Proveedores prov ON pr.proveedor_id = prov.id;

SELECT p.id AS pedido_id, c.nombre AS cliente, u.direccion, u.codigo_postal
FROM Pedidos p
LEFT JOIN Clientes c ON p.cliente_id = c.id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente';

SELECT e.id AS EmpleadoID, e.nombre AS EmpleadoNombre, COUNT(p.id) AS TotalPedidos
FROM Empleados e
LEFT JOIN Pedidos p ON e.id = p.id 
GROUP BY e.id;

SELECT tp.tipo_nombre, pr.nombre AS producto
FROM Productos pr
INNER JOIN TiposProductos tp ON pr.tipo_id = tp.id;

SELECT c.nombre AS cliente, COUNT(p.id) AS numero_pedidos
FROM Clientes c
LEFT JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre;


SELECT e.nombre AS EmpleadoNombre, p.id AS PedidoID
FROM Pedidos p
INNER JOIN Empleados e ON p.id = e.id; 

SELECT pr.nombre AS producto
FROM DetallesPedido dp
RIGHT JOIN Productos pr ON dp.producto_id = pr.id
WHERE dp.producto_id IS NULL;

SELECT c.nombre AS cliente, COUNT(p.id) AS total_pedidos, u.direccion, u.codigo_postal
FROM Clientes c
LEFT JOIN Pedidos p ON c.id = p.cliente_id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
GROUP BY c.nombre, u.direccion, u.codigo_postal;

SELECT pr.nombre AS producto, prov.nombre AS proveedor, tp.tipo_nombre AS tipo_producto
FROM Productos pr
INNER JOIN Proveedores prov ON pr.proveedor_id = prov.id
INNER JOIN TiposProductos tp ON pr.tipo_id = tp.id;
