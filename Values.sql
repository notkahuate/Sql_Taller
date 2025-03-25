INSERT INTO Clientes (nombre, email)
VALUES
('Juan Pérez', 'juan.perez@email.com'),
('Ana Gómez', 'ana.gomez@email.com'),
('Carlos López', 'carlos.lopez@email.com');

INSERT INTO Telefonos (cliente_id, telefono)
VALUES
(1, '555-1234'),
(2, '555-5678'),
(3, '555-9876');


INSERT INTO Pais (nombre)
VALUES
('México'),
('España');

INSERT INTO Estado (nombre, pais_id)
VALUES
('Jalisco', 1),
('Madrid', 2);

INSERT INTO Ciudad (nombre, estado_id)
VALUES
('Guadalajara', 1),
('Madrid', 2);

INSERT INTO Ubicaciones (entidad_id, entidad_tipo, ciudad_id, direccion, codigo_postal)
VALUES
(1, 'Cliente', 1, 'Calle Ficticia 123', '45000'),
(2, 'Proveedor', 2, 'Calle Real 456', '28001');

INSERT INTO HistorialPedidos (fechaCambio, tipoCambio)
VALUES
('2025-03-20', 1),
('2025-03-22', 2);

INSERT INTO Empleados (nombre)
VALUES
('Pedro Martínez'),
('Laura Sánchez');


INSERT INTO Puestos (descripcion)
VALUES
('Gerente de ventas'),
('Asistente administrativo');

INSERT INTO DatosEmpleados (idEmpleado, idPuesto, salario, fecha_contratacion)
VALUES
(1, 1, 2500.00, '2023-05-15'),
(2, 2, 1800.00, '2024-01-10');

INSERT INTO Proveedores (nombre)
VALUES
('Proveedor A'),
('Proveedor B');


INSERT INTO ContactoProveedores (proveedor_id, contacto, telefono, direccion)
VALUES
(1, 'Juan Ramos', '555-1122', 'Av. Reforma 200'),
(2, 'Lucía Fernández', '555-3344', 'Calle Mayor 300');

INSERT INTO TiposProductos (tipo_nombre, descripcion, parent_id)
VALUES
('Electrónica', 'Productos electrónicos de consumo', NULL),
('Accesorios', 'Accesorios para dispositivos electrónicos', 1);

INSERT INTO Productos (nombre, precio, proveedor_id, tipo_id)
VALUES
('Smartphone', 500.00, 1, 1),
('Cargador inalámbrico', 25.00, 1, 2);

INSERT INTO Pedidos (cliente_id, fecha, total)
VALUES
(1, '2025-03-22', 525.00),
(2, '2025-03-23', 50.00);

INSERT INTO DetallesPedido (pedido_id, producto_id, cantidad, precio)
VALUES
(1, 1, 1, 500.00),
(1, 2, 1, 25.00),
(2, 2, 2, 25.00);

