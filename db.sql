
CREATE DATABASE vtaszfs;
USE vtaszfs;


CREATE TABLE Clientes (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
email VARCHAR(85) UNIQUE
);

CREATE TABLE Telefonos(
id INT PRIMARY KEY auto_increment,
cliente_id INT,
telefono varchar(20)
);

CREATE TABLE Pais (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) UNIQUE
);

CREATE TABLE Estado (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
pais_id INT,
FOREIGN KEY (pais_id) REFERENCES Pais(id) 
);


CREATE TABLE Ciudad (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45),
estado_id INT,
FOREIGN KEY (estado_id) REFERENCES Estado(id) 
);

CREATE TABLE Ubicaciones (
id INT PRIMARY KEY AUTO_INCREMENT,
entidad_id INT,
entidad_tipo VARCHAR(50), 
ciudad_id INT,
direccion VARCHAR(200),
codigo_postal VARCHAR(10),
FOREIGN KEY (ciudad_id) REFERENCES Ciudad(id)
);

CREATE TABLE HistorialPedidos(
id INT PRIMARY KEY auto_increment,
fechaCambio Date,
tipoCambio int
);


CREATE TABLE Empleados (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(45)
);

CREATE TABLE Puestos(
idPuesto INT NOT NULL AUTO_INCREMENT,
descripcion varchar (200),
PRIMARY KEY (idPuesto)
);

CREATE TABLE DatosEmpleados(
idEmpleado INT NOT NULL,
idPuesto INT NOT NULL,
salario DECIMAL(10, 2),
fecha_contratacion DATE,
PRIMARY KEY (idEmpleado, idPuesto),
FOREIGN KEY (idPuesto) REFERENCES Puestos(idPuesto)
);


CREATE TABLE Proveedores (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(80)
);

CREATE TABLE EmpleadoProveedor (
empleado_id INT NOT NULL,
proveedor_id INT NOT NULL,
fecha_relacion DATE NOT NULL,
PRIMARY KEY (empleado_id, proveedor_id),
FOREIGN KEY (empleado_id) REFERENCES Empleados(id),
FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id) 
);

CREATE TABLE ContactoProveedores(
id INT auto_increment NOT NULL,
proveedor_id INT,
contacto VARCHAR(75),
telefono VARCHAR(20),
direccion VARCHAR(200),
PRIMARY KEY(id),
FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id)
);

CREATE TABLE TiposProductos (
id INT PRIMARY KEY AUTO_INCREMENT,
tipo_nombre VARCHAR(80),
descripcion TEXT,
parent_id INT,   
FOREIGN KEY (parent_id) REFERENCES TiposProductos(id)
);


CREATE TABLE Productos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(80),
precio DECIMAL(10, 2),
proveedor_id INT,
tipo_id INT,
FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id),
FOREIGN KEY (tipo_id) REFERENCES TiposProductos(id) 
);


CREATE TABLE Pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
fecha DATE,
total DECIMAL(10, 2),
FOREIGN KEY (cliente_id) REFERENCES Clientes(id)

);


CREATE TABLE DetallesPedido (
id INT PRIMARY KEY AUTO_INCREMENT,
pedido_id INT,
producto_id INT,
cantidad INT,
precio DECIMAL(10, 2),
FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
FOREIGN KEY (producto_id) REFERENCES Productos(id)
);