SELECT nombre, precio, tipo_id
FROM Productos p
WHERE precio = (SELECT MAX(precio) FROM Productos WHERE tipo_id = p.tipo_id);

SELECT c.nombre
FROM Clientes c
WHERE c.id = (SELECT p.cliente_id FROM Pedidos p GROUP BY p.cliente_id ORDER BY SUM(p.total) DESC LIMIT 1);

SELECT e.nombre
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
WHERE de.salario > (SELECT AVG(salario) FROM DatosEmpleados);
SELECT pr.nombre
FROM Productos pr
WHERE pr.id IN (SELECT producto_id FROM DetallesPedido GROUP BY producto_id HAVING SUM(cantidad) > 5);

SELECT * FROM Pedidos
WHERE total > (SELECT AVG(total) FROM Pedidos);

SELECT prov.nombre
FROM Proveedores prov
JOIN Productos pr ON prov.id = pr.proveedor_id
GROUP BY prov.nombre
ORDER BY COUNT(pr.id) DESC
LIMIT 3;
SELECT nombre
FROM Productos p
WHERE precio > (SELECT AVG(precio) FROM Productos WHERE tipo_id = p.tipo_id);

SELECT c.nombre
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre
HAVING COUNT(p.id) > (SELECT AVG(pedidos_por_cliente) FROM (SELECT COUNT(*) AS pedidos_por_cliente FROM Pedidos GROUP BY cliente_id) AS sub);

SELECT nombre
FROM Productos
WHERE precio > (SELECT AVG(precio) FROM Productos);

SELECT e.nombre
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
WHERE de.salario < (SELECT AVG(salario) FROM DatosEmpleados);