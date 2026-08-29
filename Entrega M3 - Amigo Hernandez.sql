--Crear base de datos--
CREATE DATABASE Ventas_Tech_DB;

USE Ventas_Tech_DB;

--Eliminar tablas existentes
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;

--Crear Tabla de Categorias
CREATE TABLE Categorias(
Id_categoria INT NOT NULL PRIMARY KEY,
Nombre_categoria varchar(50) NOT NULL,
Descripcion varchar(200),
);

--Crear Tabla de Clientes
CREATE TABLE Clientes(
Id_cliente	INT	NOT NULL PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Ciudad VARCHAR(50),
Fecha_registro DATE NOT NULL,
);

--Crear Tabla de Productos
CREATE TABLE Productos(
Id_producto	INT	NOT NULL PRIMARY KEY,
Nombre_producto VARCHAR(100) NOT NULL,
Id_categoria INT NOT NULL FOREIGN KEY REFERENCES Categorias(Id_categoria),
Precio DECIMAL(10,2) NOT NULL,
Stock INT DEFAULT 0,
Activo TINYINT DEFAULT 1
);

--Crear Tabla de Ventas (Hechos)
CREATE TABLE Ventas(
Id_venta INT NOT NULL PRIMARY KEY,
Id_cliente INT NOT NULL FOREIGN KEY REFERENCES Clientes(Id_cliente),
Id_producto INT NOT NULL FOREIGN KEY REFERENCES Productos(Id_producto),
Cantidad INT NOT NULL,
Precio_unitario DECIMAL(10,2) NOT NULL,
Fecha_venta	DATE NOT NULL
);

--Carga 4 registros en Tabla de Categorias
INSERT INTO Categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO Categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO Categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO Categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

--Carga 5 registros en Tabla de Clientes
INSERT INTO clientes VALUES (1, 'María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05');
INSERT INTO clientes VALUES (2, 'Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10');
INSERT INTO clientes VALUES (3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01');
INSERT INTO clientes VALUES (4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15');
INSERT INTO clientes VALUES (5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

--Carga 6 registros en Tabla de Productos
INSERT INTO productos VALUES (1, 'Laptop Pro 15',       1, 1200.00, 15, 1);
INSERT INTO productos VALUES (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1);
INSERT INTO productos VALUES (3, 'Monitor 4K 27"',      1,  450.00, 12, 1);
INSERT INTO productos VALUES (4, 'Auriculares BT Pro',  3,  120.00, 35, 1);
INSERT INTO productos VALUES (5, 'SSD Externo 1TB',     4,  130.00, 18, 1);
INSERT INTO productos VALUES (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

--Carga 10 registros en Tabla de Ventas
INSERT INTO ventas VALUES (1,  1, 1, 2, 1200.00, '2024-03-05');
INSERT INTO ventas VALUES (2,  2, 2, 5,   28.00, '2024-03-06');
INSERT INTO ventas VALUES (3,  3, 3, 1,  450.00, '2024-03-07');
INSERT INTO ventas VALUES (4,  1, 4, 2,  120.00, '2024-03-08');
INSERT INTO ventas VALUES (5,  4, 5, 3,  130.00, '2024-03-10');
INSERT INTO ventas VALUES (6,  2, 6, 4,   95.00, '2024-03-11');
INSERT INTO ventas VALUES (7,  5, 1, 1, 1200.00, '2024-03-12');
INSERT INTO ventas VALUES (8,  3, 2, 8,   28.00, '2024-03-13');
INSERT INTO ventas VALUES (9,  4, 4, 1,  120.00, '2024-03-14');
INSERT INTO ventas VALUES (10, 5, 3, 2,  450.00, '2024-03-15');

-- Confirmación de que las tablas se cargaron correctamente
SELECT * FROM Categorias;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;
