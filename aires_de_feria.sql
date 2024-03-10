DROP DATABASE IF EXISTS aires_de_feria;
CREATE DATABASE aires_de_feria;
USE aires_de_feria;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    dni CHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(20),
    apellidos VARCHAR(50),
    telefono VARCHAR(12),
    correo VARCHAR(40)
);
DESCRIBE cliente;


CREATE TABLE talla (
    id_talla INT PRIMARY KEY,
    tipo VARCHAR(10),
    busto INT,
    cintura INT,
    cadera INT,
    largo INT,
    CONSTRAINT chk_tipo CHECK(tipo='mujer' OR tipo='niña')
);

DESCRIBE talla;

CREATE TABLE tienda (
    id_tienda INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    horario VARCHAR(50),
    telefono VARCHAR(12)
);

DESCRIBE tienda;

CREATE TABLE MODELO (
    id_modelo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    catalogo INT,
    anio_coleccion INT
);

DESCRIBE modelo;

CREATE TABLE traje (
    id_traje INT PRIMARY KEY AUTO_INCREMENT,
    id_modelo INT,
    id_talla INT,
    id_tienda INT,
    color VARCHAR(20),
    precio DECIMAL(5, 2),
    CONSTRAINT fk_id_modelo FOREIGN KEY (id_modelo) REFERENCES modelo (id_modelo),
    CONSTRAINT fk_id_talla FOREIGN KEY (id_talla) REFERENCES talla (id_talla),
    CONSTRAINT fk_id_tienda FOREIGN KEY (id_tienda) REFERENCES tienda (id_tienda),
    CONSTRAINT chk_precio CHECK(precio > 0)
);

DESCRIBE traje;

CREATE TABLE compra (
    id_traje INT,
    id_cliente INT,
    fecha DATE,
    cantidad INT,
    importe DECIMAL(10, 2),
    CONSTRAINT pk_compra PRIMARY KEY (id_traje, id_cliente, fecha),
    CONSTRAINT fk_id_traje FOREIGN KEY (id_traje) REFERENCES traje(id_traje),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT chk_importe CHECK(importe > 0)
);

DESCRIBE compra;

INSERT INTO cliente (dni, nombre, apellidos, telefono, correo) VALUES
('123456789', 'Maria', 'Garcia Rodriguez', '655456789', 'maria@hotmail.com'),
('987654321', 'Juan', 'Perez Andrade', '630654321', 'juan@gmail.com'),
('111222333', 'Laura', 'Lopez Garcia', '654222333', 'laura@gmail.com'),
('444555666', 'Carlos', 'Martinez Martinez', '644555666', 'carlos@hotmail.com'),
('777888999', 'Ana', 'Rodriguez Gandul', '677888999', 'ana@hotmail.com'),
('999888777', 'Pedro', 'Sanchez Galocha', '999888777', 'pedro@gmail.com'),
('666555444', 'Sofia', 'Fernandez Ribera', '666555444', 'sofia@gmail.com'),
('222333444', 'Luis', 'Gomez Cuesta', '222333444', 'luis@gmail.com'),
('555444333', 'Elena', 'Hernandez Flores', '555444333', 'elena@hotmail.com'),
('333444555', 'Pablo', 'Diaz Perez', '333444555', 'pablo@gmail.com');

INSERT INTO talla (id_talla, tipo, busto, cintura, cadera, largo) VALUES
(34, 'mujer', 81, 60, 88, 146),
(1,'niña', 50, 47, 52, 63),
(36, 'mujer', 85, 65, 92, 146),
(2,'niña', 54, 49, 57, 69),
(38, 'mujer', 88, 70, 97, 146),
(3,'niña', 58, 53, 62, 77),
(40, 'mujer', 93, 74, 101, 146),
(9,'niña', 78, 68, 86, 127),
(42, 'mujer', 97, 78, 105, 146),
(14,'niña', 82, 68, 86, 135);

INSERT INTO tienda (nombre, direccion, horario, telefono) VALUES
('SEVILLA ESTE', 'Cueva del Agua 17', 'Lunes a Viernes 10:00-20:30', '954670001'),
('FACTORY DOS HERMANAS', 'Carretera Sevilla-Malaga km 553', 'Lunes a Sabado 10:00-20:30pm', '954728685'),
('SEVILLA CENTRO (MARIA AUXILIADORA)', 'Calle Maria Auxiliadora 15', 'Martes a Sabado 11:00-14:00', '954410000'),
('SEVILLA CENTRO (LINEROS)', 'Calle Lineros 7', 'Lunes a Viernes 10:30-13:00', '647374271'),
('TRIANA', ' Calle Pages del Corro 96', 'Miércoles a Sábado 10:00-18:00', '954105319');

INSERT INTO modelo (nombre, catalogo, anio_coleccion) VALUES
('ALBA', '3', 2024),
('AIRES', '1', 2024),
('AIRES ESPECIAL', '4', 2022),
('ALMA', '5', 2021),
('ALBOREA', '1', 2023),
('ANTONELA', '2', 2023),
('FIESTA', '2', 2024),
('DUQUELAS', '3', 2024),
('MAESTRANZA', '6', 2022),
('HECHIZO', '6', 2022);

INSERT INTO traje (id_modelo, id_talla, id_tienda, color, precio) VALUES
(1, 38, 1, 'Azul', 150.00),
(2, 1, 2, 'Rojo', 235.00),
(3, 36, 3, 'Negro', 80.00),
(4, 2, 4, 'Gris', 145.00),
(5, 38, 5, 'Blanco', 260.00),
(6, 9, 1, 'Verde', 525.00),
(7, 14, 2, 'Marrón', 470.00),
(8, 40, 3, 'Azul Marino', 455.00),
(9, 42, 4, 'Rosa', 240.00),
(10, 40, 5, 'Morado', 330.00);

INSERT INTO compra (id_traje, id_cliente, fecha, cantidad, importe) VALUES
(1, 1, '2022-01-15', 1, 150.00),
(2, 2, '2022-02-20', 2, 470.00),
(3, 3, '2022-03-25', 1, 80.00),
(4, 4, '2022-04-30', 3, 435.00),
(5, 5, '2022-05-05', 1, 260.00),
(6, 6, '2022-06-10', 2, 1050.00),
(7, 7, '2022-07-15', 1, 470.00),
(8, 8, '2022-08-20', 2, 910.00),
(9, 9, '2022-09-25', 2, 480.00),
(10, 10, '2022-10-30', 1, 330.00);