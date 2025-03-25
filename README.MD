# README - Consultas SQL

Este archivo contiene una serie de consultas SQL diseñadas para extraer información clave de una base de datos con entidades como Clientes, Pedidos, Productos, Empleados, Proveedores, entre otras.

---

## **2. JOINS**

### 1. Obtener la lista de todos los pedidos con los nombres de clientes usando INNER JOIN
```sql
SELECT p.id, c.nombre, p.fecha, p.total
FROM Pedidos p
INNER JOIN Clientes c ON p.cliente_id = c.id;
```
🔹 **Descripción:** Lista todos los pedidos con el nombre del cliente que lo realizó.

### 2. Listar los productos y proveedores que los suministran con INNER JOIN
```sql
SELECT pr.nombre AS producto, prov.nombre AS proveedor
FROM Productos pr
INNER JOIN Proveedores prov ON pr.proveedor_id = prov.id;
```
🔹 **Descripción:** Muestra cada producto con su respectivo proveedor.

### 3. Mostrar los pedidos y las ubicaciones de los clientes con LEFT JOIN
```sql
SELECT p.id, c.nombre, u.direccion
FROM Pedidos p
INNER JOIN Clientes c ON p.cliente_id = c.id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente';
```
🔹 **Descripción:** Muestra todos los pedidos junto a la dirección del cliente si la tiene registrada.

### 4. Consultar todos los empleados incluyendo los que no tienen pedidos (Simulación sin empleado_id en pedidos)
```sql
SELECT e.id AS EmpleadoID, e.nombre AS EmpleadoNombre, COUNT(p.id) AS TotalPedidos
FROM Empleados e
LEFT JOIN Pedidos p ON e.id = p.id 
GROUP BY e.id;
```
🔹 **Descripción:** Lista todos los empleados y sus puestos, incluso si no están relacionados con pedidos.

### 5. Obtener el tipo de producto y los productos asociados con INNER JOIN
```sql
SELECT tp.tipo_nombre, pr.nombre AS producto
FROM Productos pr
INNER JOIN TiposProductos tp ON pr.tipo_id = tp.id;
```
🔹 **Descripción:** Muestra los productos junto con su tipo.

### 6. Listar todos los clientes y el número de pedidos realizados con COUNT y GROUP BY
```sql
SELECT c.nombre, COUNT(p.id) AS total_pedidos
FROM Clientes c
LEFT JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre;
```
🔹 **Descripción:** Cuenta la cantidad de pedidos realizados por cada cliente.

### 7. Combinar Pedidos y Empleados para mostrar qué empleados gestionaron pedidos específicos (simulado sin empleado_id)
```sql
SELECT e.nombre AS EmpleadoNombre, p.id AS PedidoID
FROM Pedidos p
INNER JOIN Empleados e ON p.id = e.id; 
```
🔹 **Descripción:** En este diseño, los empleados no están ligados a pedidos, así que se muestra una nota.

### 8. Mostrar productos que no han sido pedidos (RIGHT JOIN)
```sql
SELECT pr.nombre
FROM Productos pr
LEFT JOIN DetallesPedido dp ON pr.id = dp.producto_id
WHERE dp.producto_id IS NULL;
```
🔹 **Descripción:** Lista los productos que no aparecen en ningún pedido.

### 9. Mostrar el total de pedidos y ubicación de clientes usando múltiples JOIN
```sql
SELECT c.nombre, ci.nombre AS ciudad, COUNT(p.id) AS total_pedidos
FROM Clientes c
LEFT JOIN Pedidos p ON c.id = p.cliente_id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
LEFT JOIN Ciudad ci ON u.ciudad_id = ci.id
GROUP BY c.nombre, ci.nombre;
```
🔹 **Descripción:** Muestra el total de pedidos por cliente y su ubicación.

### 10. Unir Proveedores, Productos y TiposProductos para un listado completo de inventario
```sql
SELECT pr.nombre AS producto, prov.nombre AS proveedor, tp.tipo_nombre AS tipo
FROM Productos pr
INNER JOIN Proveedores prov ON pr.proveedor_id = prov.id
INNER JOIN TiposProductos tp ON pr.tipo_id = tp.id;
```
🔹 **Descripción:** Muestra un inventario detallado con proveedor y tipo de producto.

---

## **3. CONSULTAS SIMPLES**

### 1. Seleccionar todos los productos con precio mayor a $50
```sql
SELECT * FROM Productos WHERE precio > 50;
```

### 2. Consultar clientes registrados en una ciudad específica
```sql
SELECT c.nombre
FROM Clientes c
JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
JOIN Ciudad ci ON u.ciudad_id = ci.id
WHERE ci.nombre = 'Guadalajara';
```

### 3. Mostrar empleados contratados en los últimos 2 años
```sql
SELECT e.nombre
FROM Empleados e
JOIN DatosEmpleados de ON e.id = de.idEmpleado
WHERE de.fecha_contratacion >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
```

### 4. Seleccionar proveedores que suministran más de 5 productos
```sql
SELECT prov.nombre, COUNT(pr.id) AS total_productos
FROM Proveedores prov
JOIN Productos pr ON pr.proveedor_id = prov.id
GROUP BY prov.nombre
HAVING total_productos > 5;
```

### 5. Listar clientes que no tienen dirección registrada en Ubicaciones
```sql
SELECT c.nombre
FROM Clientes c
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
WHERE u.id IS NULL;
```

### 6. Calcular el total de ventas por cada cliente
```sql
SELECT c.nombre, SUM(p.total) AS total_ventas
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre;
```

### 7. Mostrar el salario promedio de los empleados
```sql
SELECT AVG(salario) AS salario_promedio
FROM DatosEmpleados;
```

### 8. Consultar el tipo de productos disponibles en TiposProductos
```sql
SELECT tipo_nombre FROM TiposProductos;
```

### 9. Seleccionar los 3 productos más caros
```sql
SELECT nombre, precio
FROM Productos
ORDER BY precio DESC
LIMIT 3;
```

### 10. Consultar el cliente con el mayor número de pedidos
```sql
SELECT c.nombre, COUNT(p.id) AS total_pedidos
FROM Clientes c
JOIN Pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre
ORDER BY total_pedidos DESC
LIMIT 1;
```

---

## **4. CONSULTAS MULTITABLA**

### 1. Listar todos los pedidos y el cliente asociado
```sql
SELECT p.id AS pedido_id, c.nombre AS cliente, p.fecha, p.total
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.id;
```

### 2. Mostrar la ubicación de cada cliente en sus pedidos
```sql
SELECT p.id AS pedido_id, c.nombre AS cliente, u.direccion, ci.nombre AS ciudad
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
LEFT JOIN Ciudad ci ON u.ciudad_id = ci.id;
```

### 3. Listar productos junto con el proveedor y tipo de producto
```sql
SELECT pr.nombre AS producto, pr.precio, prov.nombre AS proveedor, tp.tipo_nombre AS tipo_producto
FROM Productos pr
JOIN Proveedores prov ON pr.proveedor_id = prov.id
JOIN TiposProductos tp ON pr.tipo_id = tp.id;
```

### 4. Consultar todos los empleados con sus puestos
```sql
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
```

### 5. Consultar los 5 productos más vendidos
```sql
SELECT pr.nombre AS producto, SUM(dp.cantidad) AS total_vendido
FROM DetallesPedido dp
JOIN Productos pr ON dp.producto_id = pr.id
GROUP BY pr.nombre
ORDER BY total_vendido DESC
LIMIT 5;
```

### 6. Obtener la cantidad total de pedidos por cliente y ciudad
```sql
SELECT c.nombre AS cliente, ci.nombre AS ciudad, COUNT(p.id) AS total_pedidos
FROM Pedidos p
JOIN Clientes c ON p.cliente_id = c.id
LEFT JOIN Ubicaciones u ON u.entidad_id = c.id AND u.entidad_tipo = 'Cliente'
LEFT JOIN Ciudad ci ON u.ciudad_id = ci.id
GROUP BY c.nombre, ci.nombre;
```

### 7. Listar clientes y proveedores en la misma ciudad
```sql
SELECT c.nombre AS cliente, prov.nombre AS proveedor, ci.nombre AS ciudad
FROM Clientes c
JOIN Ubicaciones uc ON uc.entidad_id = c.id AND uc.entidad_tipo = 'Cliente'
JOIN Ciudad ci ON uc.ciudad_id = ci.id
JOIN Ubicaciones up ON up.ciudad_id = ci.id AND up.entidad_tipo = 'Proveedor'
JOIN Proveedores prov ON up.entidad_id = prov.id;
```

### 8. Mostrar el total de ventas agrupado por tipo de producto
```sql
SELECT tp.tipo_nombre, SUM(dp.cantidad * dp.precio) AS total_ventas
FROM DetallesPedido dp
JOIN Productos pr ON dp.producto_id = pr.id
JOIN TiposProductos tp ON pr.tipo_id = tp.id
GROUP BY tp.tipo_nombre;
```

### 9. Listar empleados con sus puestos
```sql
SELECT e.nombre AS EmpleadoNombre, p.id AS PedidoID, pr.nombre AS ProductoNombre, prov.nombre AS ProveedorNombre
FROM Empleados e
INNER JOIN DatosEmpleados de ON e.id = de.idEmpleado
INNER JOIN EmpleadoProveedor ep ON e.id = ep.empleado_id
INNER JOIN Proveedores prov ON ep.proveedor_id = prov.id
INNER JOIN Productos pr ON prov.id = pr.proveedor_id
INNER JOIN DetallesPedido dp ON pr.id = dp.producto_id
INNER JOIN Pedidos p ON dp.pedido_id = p.id
WHERE prov.nombre = 'Proveedor A';
```

### 10. Obtener el ingreso total de cada proveedor a partir de los productos vendidos
```sql
SELECT prov.nombre AS proveedor, SUM(dp.cantidad * dp.precio) AS total_ingreso
FROM DetallesPedido dp
JOIN Productos pr ON dp.producto_id = pr.id
JOIN Proveedores prov ON pr.proveedor_id = prov.id
GROUP BY prov.nombre;
```

---



