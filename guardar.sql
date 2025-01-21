-- show databases;
use almacen;

-- Drop existing tables if they exist
 DROP TABLE IF EXISTS articulo;
DROP TABLE IF EXISTS ubicacion;

-- Create the 'articulo' table
CREATE TABLE IF NOT EXISTS articulo (
    idArticulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('comic', 'figura', 'electronica', 'otro'),
    estado ENUM('vendido', 'conservado', 'disponible') DEFAULT 'disponible',
    importe DECIMAL(10,2),
    importeDevolucion DECIMAL(10,2) DEFAULT 0,
    descripcion TEXT,
	fechaCompra DATE,
    fechaDevolucion DATE
);

-- Create the 'ubicacion' table
CREATE TABLE IF NOT EXISTS ubicacion (
    idUbicacion INT PRIMARY KEY AUTO_INCREMENT,
    idArticulo INT,
    fila INT,
    columna INT,
    estante VARCHAR(50),
    caja VARCHAR(50),
    numeroArticulosStock INT DEFAULT 0,
    FOREIGN KEY (idArticulo) REFERENCES articulo(idArticulo) 
);

INSERT INTO articulo (nombre, categoria, estado,importe, descripcion,fechaCompra, fechaDevolucion)
VALUES ('luz Led plafón #1', 'electronica', 'conservado', 11.27, 'Recambio luz led para bombillas','2025-01-15', '2025-01-16');
INSERT INTO articulo (nombre, categoria, estado,importe, descripcion,fechaCompra, fechaDevolucion)
VALUES ('Cascos R36 #1', 'electronica', 'disponible', 129.99, 'Cascos inalambricos resistentes al agua','2025-01-15', '');


-- INSERT INTO ubicacion (idArticulo, fila, columna, estante, caja, numeroArticulosStock)
-- VALUES (1, 1, 1, 'A', '', 1);
INSERT INTO ubicacion (idArticulo, fila, columna, estante, caja, numeroArticulosStock)
VALUES (3, 1, 1, 'A', '', 1);
  

select * from articulo;
select * from ubicacion;

UPDATE articulo
SET importe = 11.69
WHERE idArticulo = 1;