CREATE DATABASE ITM;
GO

USE ITM;
GO

CREATE TABLE Agencia (
    id_agencia INT PRIMARY KEY IDENTITY(1,1), -- Identificador único autoincremental
    nombre NVARCHAR(100) NOT NULL,           -- Nombre de la agencia
    direccion NVARCHAR(200)                  -- Dirección de la agencia
);
GO

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY(1,1), -- Identificador único autoincremental
    nombre NVARCHAR(100) NOT NULL,            -- Nombre del cliente
    telefono NVARCHAR(15),                    -- Teléfono del cliente
    email NVARCHAR(100)                       -- Correo electrónico del cliente
);
GO

CREATE TABLE Tipo_Computador (
    id_tipo INT PRIMARY KEY IDENTITY(1,1),    -- Identificador único autoincremental
    descripcion NVARCHAR(100) NOT NULL       -- Descripción del tipo de computador
);
GO

CREATE TABLE Computador (
    id_computador INT PRIMARY KEY IDENTITY(1,1), -- Identificador único autoincremental
    id_tipo INT NOT NULL,                        -- Tipo de computador (FK)
    num_procesadores INT,                        -- Número de procesadores
    marca_procesador NVARCHAR(100),              -- Marca del procesador
    tamano_disco NVARCHAR(50),                   -- Tamaño del disco duro
    tamano_memoria NVARCHAR(50),                 -- Tamaño de la memoria
    componentes NVARCHAR(MAX),                   -- Componentes adicionales (texto libre)
    FOREIGN KEY (id_tipo) REFERENCES Tipo_Computador(id_tipo) -- Relación con Tipo_Computador
);
GO

CREATE TABLE Venta (
    id_venta INT PRIMARY KEY IDENTITY(1,1),      -- Identificador único autoincremental
    id_agencia INT NOT NULL,                     -- Agencia que realiza la venta (FK)
    id_cliente INT NOT NULL,                     -- Cliente que compra (FK)
    id_computador INT NOT NULL,                  -- Computador vendido (FK)
    fecha_venta DATE,                            -- Fecha de la venta
    precio DECIMAL(10,2),                        -- Precio de la venta
    FOREIGN KEY (id_agencia) REFERENCES Agencia(id_agencia), -- Relación con Agencia
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente), -- Relación con Cliente
    FOREIGN KEY (id_computador) REFERENCES Computador(id_computador) -- Relación con Computador
);
GO


INSERT INTO Agencia (nombre, direccion)
VALUES ('ITM Medellín', 'Cl. 54a #30-01, Medellín');
GO


INSERT INTO Cliente (nombre, telefono, email)
VALUES ('Juan Roman', '123456789', 'JuanRoman1119063@correo.itm.edu.co');
GO

INSERT INTO Tipo_Computador (descripcion)
VALUES ('Portátil'), ('Escritorio'), ('Gamer');
GO


INSERT INTO Computador (id_tipo, num_procesadores, marca_procesador, tamano_disco, tamano_memoria, componentes)
VALUES (1, 4, 'Intel', '512GB SSD', '16GB', 'Mouse, Teclado, Monitor'),
       (2, 8, 'AMD', '1TB HDD', '32GB', 'Tarjeta de video, Teclado mecánico');
GO


INSERT INTO Venta (id_agencia, id_cliente, id_computador, fecha_venta, precio)
VALUES (1, 1, 1, '2025-03-13', 1500000.00),
       (1, 1, 2, '2025-03-12', 2500000.00);
GO


SELECT * FROM Computador;
