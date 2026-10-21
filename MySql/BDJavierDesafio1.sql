

CREATE DATABASE IF NOT EXISTS TiendaVideojuegos;
USE TiendaVideojuegos;


-- 2. TABLA VIDEOJUEGOS


CREATE TABLE Videojuegos (
    idVideojuegos INT AUTO_INCREMENT PRIMARY KEY,
    Plataforma TEXT,
    Genero TEXT,
    Formato TEXT
);


-- 3. TABLA PRODUCTOS


CREATE TABLE Productos (
    idProductos INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(75),
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Videojuegos_idVideojuegos INT,

    FOREIGN KEY (Videojuegos_idVideojuegos)
        REFERENCES Videojuegos(idVideojuegos)
);


-- 4. TABLA CLIENTES


CREATE TABLE Clientes (
    idClientes INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45) NOT NULL,
    Apellidos VARCHAR(45) NOT NULL,
    DNI VARCHAR(20) UNIQUE,
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);


-- 5. TABLA DEVOLUCIONES


CREATE TABLE Devoluciones (
    idDevoluciones INT AUTO_INCREMENT PRIMARY KEY
);


-- 6. TABLA VENTAS


CREATE TABLE Ventas (
    idVentas INT AUTO_INCREMENT PRIMARY KEY,
    Clientes_idClientes INT NOT NULL,
    Devoluciones_idDevoluciones INT NULL,

    FOREIGN KEY (Clientes_idClientes)
        REFERENCES Clientes(idClientes),

    FOREIGN KEY (Devoluciones_idDevoluciones)
        REFERENCES Devoluciones(idDevoluciones)
);


-- 7. TABLA RESERVAS


CREATE TABLE Reservas (
    idReservas INT AUTO_INCREMENT PRIMARY KEY,
    Clientes_idClientes INT NOT NULL,
    Productos_idProductos INT NOT NULL,
    Devoluciones_idDevoluciones INT NULL,

    FOREIGN KEY (Clientes_idClientes)
        REFERENCES Clientes(idClientes),

    FOREIGN KEY (Productos_idProductos)
        REFERENCES Productos(idProductos),

    FOREIGN KEY (Devoluciones_idDevoluciones)
        REFERENCES Devoluciones(idDevoluciones)
);


-- 8. TABLA DETALLEVENTAS


CREATE TABLE DetalleVentas (
    idDetalleVentas INT AUTO_INCREMENT PRIMARY KEY,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL
);


-- 9. TABLA VENTAS_HAS_PRODUCTOS


CREATE TABLE Ventas_has_Productos (
    Ventas_idVentas INT NOT NULL,
    Ventas_DetalleVentas_idDetalleVentas INT NOT NULL,
    Productos_idProductos INT NOT NULL,

    PRIMARY KEY (
        Ventas_idVentas,
        Productos_idProductos
    ),

    FOREIGN KEY (Ventas_idVentas)
        REFERENCES Ventas(idVentas),

    FOREIGN KEY (Ventas_DetalleVentas_idDetalleVentas)
        REFERENCES DetalleVentas(idDetalleVentas),

    FOREIGN KEY (Productos_idProductos)
        REFERENCES Productos(idProductos)
);
