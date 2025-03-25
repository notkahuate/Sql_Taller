SELECT nombre, precio 
FROM Productos
WHERE precio > 50;

SELECT c.nombre, c.email
FROM Clientes c
JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
JOIN Ciudad ci ON u.ciudad_id = ci.id
WHERE ci.nombre = 'Guadalajara';

SELECT e.nombre, de.fecha_contratacion
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
WHERE de.fecha_contratacion >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
 
SELECT prov.nombre, COUNT(p.id) AS cantidad_productos
FROM Proveedores prov
JOIN Productos p ON prov.id = p.proveedor_id
GROUP BY prov.nombre
HAVING COUNT(p.id) > 5;

SELECT c.nombre, c.email
FROM Clientes c
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
WHERE u.id IS NULL;



SELECT c.nombre AS cliente, SUM(p.total) AS total_ventas
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre;

SELECT AVG(de.salario) AS salario_promedio
FROM DatosEmpleados de;

SELECT tipo_nombre, descripcion
FROM TiposProductos;


SELECT nombre, precio
FROM Productos
ORDER BY precio DESC
LIMIT 3;

SELECT c.nombre AS cliente, COUNT(p.id) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre
ORDER BY total_pedidos DESC
LIMIT 1;

