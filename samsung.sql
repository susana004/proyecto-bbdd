DROP DATABASE IF EXISTS samsung;
CREATE DATABASE samsung;
USE samsung;

CREATE TABLE usuario(
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  correo VARCHAR (50) NOT NULL,
  telefono VARCHAR(12) NOT NULL,
  direccion VARCHAR(50),
  ciudad VARCHAR(20),
  pais VARCHAR(100),
  fecha_registro DATE
);

CREATE TABLE pedido(
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE,
  estado CHAR(2),
  id_usuario INT,
  CONSTRAINT fk_pedido_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  CHECK (estado IN ('p', 'ev', 'et'))
);

CREATE TABLE proveedor(
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  correo VARCHAR (50) NOT NULL,
  telefono VARCHAR(12) NOT NULL,
  direccion VARCHAR(50),
  sitio_web VARCHAR(30) UNIQUE -- no ponemos default ya que cada proveedor tendrá una dirección web
);

CREATE TABLE producto(
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(30) NOT NULL,
  descripcion VARCHAR(250),
  precio DECIMAL(10, 2) NOT NULL,
  stock INT,
  categoria CHAR(1),
  id_proveedor INT,
  CONSTRAINT fk_producto_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
  CHECK (categoria IN ('t', 'e', 'i', 'a'))
);

CREATE TABLE pedido_producto(
  id_pedido INT,
  id_producto INT,
  CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
  CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
  PRIMARY KEY (id_pedido, id_producto)
);
  
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('juan4673', 'juan@gmail.com', '+34662840274', 'Calle Amanecer, 22', 'Ronda', 'España', '2024-01-10');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('noah_01', 'noah@gmail.com', '+1568840153', 'Calle Sevilla, 12', 'Nueva York', 'Estados Unidos', '2023-03-21');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('susana04', 'susana@gmail.com', '+50739573954', 'Calle Cuadro, 1', 'Colón', 'Panamá', '2024-12-14');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('maria', 'maria@gmail.com', '+34836483600', 'Calle Nueva, 6', 'Mairena del Alcor', 'España', '2022-06-11');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('oliver', 'oliver@gmail.com', '+1658395628', 'Calle Francia, 8', 'Detroit', 'Estados Unidos', '2020-12-22');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('javier', 'javier@gmail.com', '+34473748395', 'Calle Alemania, 27', 'El Viso del Alcor', 'España', '2021-07-30');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('charlotte', 'charlotte@gmail.com', '+1123543876', 'Calle San Francisco, 52', 'Kansas City', 'Estados Unidos', '2019-02-18');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('paloma_23', 'paloma@gmail.com', '+34662123544', 'Calle Pilar, 9', 'Alcalá de Guadaira', 'España', '2017-03-12');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('antonio55', 'antonio@gmail.com', '+507663530334', 'Calle Sol, 5', 'Santiago', 'Panamá', '2018-12-10');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('patrocinio', 'patrocinio@gmail.com', '+34600404003', 'Calle Luz, 93', 'Málaga', 'España', '2000-08-20');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('miguelmanuel', 'miguelmanuel@gmail.com', '+34655646373', 'Calle Madrid, 9', 'El Puerto de Santa María', 'España', '2024-05-29');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('juanluis3', 'juanluis@gmail.com', '+507947630483', 'Calle Vieja, 63', 'Las Tablas', 'Panamá', '2006-10-11');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('jose5', 'jose@gmail.com', '+34836000303', 'Calle Jerez, 94', 'Cádiz', 'España', '2004-04-16');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('veronica12', 'veronica@gmail.com', '+34836483833', 'Calle Armiñán, 25', 'Ronda', 'España', '2018-06-23');
INSERT INTO usuario (nombre, correo, telefono, direccion, ciudad, pais, fecha_registro) VALUES ('liam', 'liam@gmail.com', '+1662333374', 'Calle Torrejones, 30', 'Los Ángeles', 'Estados Unidos', '2022-02-11');

SELECT * FROM usuario;

INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2024-03-10', 'p', 1);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2023-01-09', 'e', 2);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2019-07-15', 'et', 3);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2024-04-27', 'et', 4);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2023-02-16', 'ev', 5);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2020-10-09', 'et', 6);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2021-02-12', 'p', 7);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2022-06-22', 'ev', 8);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2018-09-26', 'et', 9);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2009-07-01', 'p', 10);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2022-11-29', 'ev', 11);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2021-02-23', 'et', 12);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2022-12-21', 'ev', 13);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2023-06-26', 'ev', 14);
INSERT INTO pedido (fecha, estado, id_usuario) VALUES ('2022-09-15', 'p', 15);

SELECT * FROM pedido;

INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('uno', 'uno@gmail.com', '+34123456789', 'Calle Fuente, 1', 'www.uno.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('dos', 'dos@gmail.com', '+1123456483', 'Calle Nueva, 23', 'www.dos.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('tres', 'tres@gmail.com', '+55123466789', 'Calle Real, 43', 'www.tres.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('cuatro', 'cuatro@gmail.com', '+1123056709', 'Calle Francia, 2', 'www.cuatro.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('cinco', 'cinco@gmail.com', '+31126456788', 'Calle Mayor, 12', 'www.cinco.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('seis', 'seis@gmail.com', '+52125347890', 'Calle Menor, 3', 'www.seis.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('siete', 'siete@gmail.com', '+55123457891', 'Calle Federico García Lorca, 123', 'www.siete.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('ocho', 'ocho@gmail.com', '+34123167898', 'Calle Miguel de Cervantes, 43', 'www.ocho.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('nueve', 'nueve@gmail.com', '+32234234234', 'Calle Rosalía, 61', 'www.nueve.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('diez', 'diez@gmail.com', '+27123123234', 'Calle Principal, 125', 'www.diez.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('once', 'once@gmail.com', '+34234456789', 'Calle Castro, 120', 'www.once.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('doce', 'doce@gmail.com', '+55900456789', 'Calle Zaragoza, 129', 'www.doce.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('trece', 'trece@gmail.com', '+34923456789', 'Calle Sevilla, 165', 'www.trece.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('catorce', 'catorce@gmail.com', '+27129393789', 'Calle Badajoz, 9', 'www.catorce.com');
INSERT INTO proveedor (nombre, correo, telefono, direccion, sitio_web) VALUES ('quince', 'quince@gmail.com', '+34188333789', 'Calle Almería, 16', 'www.quince.com');

SELECT * FROM proveedor;

INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('TV CU6905 Crystal UHD 43" 4K Smart TV 2024', 
  'PurColor: Siéntete dentro de la película gracias a la gran cantidad de colores.
  Procesador Crystal UHD: Imágenes reales con colores más puros y naturales gracias a la tecnología Dynamic Crystal Color.
  Smart TV powered by Tizen: Disfruta de tus contenidos, juega en la nube con Gaming Hub o controla tus dispositivos conectados con SmartThings.
  Contrast Enhancer con HDR10+: Un nuevo nivel de profundidad y color gracias al análisis de cada imagen para crear tonalidades más naturales y realistas*.
  SmartThings: Controla todos tus dispositivos conectados desde tu TV. Los detecta y empareja de forma sencilla.', 
  339.00, 100, 't', 1);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Campana decorativa inclinada NK36T9804VD/UR', 
  'Entrega gratuita
  Pago en cuotas
  Sistema Power Ventilation
  Conectividad automática placa - campana
  Sensor automático
  Filtro lavable de aluminio
  Control táctil', 
  769.15, 50, 'e', 2);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('USB Flash Drive Tipo-C™', 
  'performance
  design
  Familia : Type-C™', 
  44.00, 200, 'i', 3);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Galaxy Buds2 Pro', 
  'Sonido Hi-Fi de 24 bits para una experiencia de audio de calidad
  ANC con 3 micrófonos de alta relación señal / ruido (SNR) para eliminar más ruido exterior
  Diseño ergonómico para un ajuste cómodo
  El Audio 360 te rodea como si estuvieses en el centro de la acción', 
  179.90, 75, 'a', 1);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Tarjeta de memoria microSD 512Gb PRO Plus - MB-MD512SB', 
  'Creada para una vida llena de aventuras. Con una altísima velocidad de escritura y un rendimiento más que fiable, podrás capturar vídeos fluidos en 
  4K UHD con tu móvil o dron. Tambiés es perfecta si necesitas expandir el almacenamiento de tu dispositivo o tablet para jugar a los juegos más exigentes. 
  Lleva la capacidad y velocidad que deseas siempre encima para todos tus dispositivos.', 
  112.99, 150, 'i', 2);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('TV Q50A QLED 80cm 32" Smart TV 2023', 
  'Tecnología Quantum Dot: Convierte la luz en más de 1.000 millones de colores puros, incluso al máximo nivel de brillo.
  Quantum HDR10+: Experimenta la potencia de cada imagen más allá de cualquier estándar, resaltando los detalles y el contraste.
  Multi View: Disfruta de hasta 2 contenidos al mismo tiempo dividiendo tu TV en múltiples pantallas. Elige el tamaño y volumen de cada una.
  Smart TV powered by Tizen: Disfruta de tus contenidos, juega en la nube con Gaming Hub o controla tus dispositivos conectados con SmartThings.
  Q-Symphony: Disfruta de todos los altavoces a la vez. Esta tecnología exclusiva de Samsung combina el sonido de tu TV con tu barra de sonido, sin anular 
  ninguno.', 
  399.20, 120, 't', 3);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Cepillo mopa giratoria', 
  'Fácil limpieza en suelos duros gracias a sus dos rodillos giratorios
  Contiene almohadillas higiénicas de una solo uso (VCA SPA90/GL)
  Contiene almohadillas de microfibra (VCA SPW90)
  Compatible con aspiradoras sin cable Jet 90 y Jet 75.', 
  150.00, 80, 'e', 1);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('SSD Interno 990 PRO 1TB PCIe 4.0 (up to 7,450MB/s) NVMe M.2 (2280)', 
  'Potente SSD Interno PCIe 4.0 NVMeTM para tareas exigentes como el procesamiento de vídeo en 4K y gráficos en 3D, así como para juegos de alta exigencia.
  Velocidad de vértigo: velocidades de lectura/escritura de hasta 7450/6900 MB/s.', 
  149.99, 100, 'i', 2);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Galaxy Tab S9 Book Cover Keyboard', 
  'La experiencia de un ordenador en un solo toque
  Enganche magnético y fácil de cambiar
  150° de comodidad sin esfuerzo', 
  229.90, 50, 'a', 3);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Secadora DV5000C 8kg Blanca eficiencia A++ y Hygiene Care DV80CGC0B0THEC', 
  'Secado por Bomba de Calor
  Inteligencia Artificial
  Secado Automático OptimalDry', 
  479.00, 90, 'e', 1);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Barra de sonido HW-Q600C/ZF Premium Q-series (2023)', 
  'Dolby Atmos / DTS:X
  Q Symphony Gen III
  3.1.2 canales
  Sonido Inteligente
  Modo Juego Pro', 
  469.00, 110, 't', 2);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Microondas de Integración 22L 850W/Grill 1100W Negro MG22M8254AK', 
  'Entrega gratuita
  Pago en cuotas
  Grill+30sec', 
  259.00, 30, 'e', 3);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('PSSD T7 1TB', 
  'Resistente a golpes
  Solución térmica avanzada
  Protección por contraseña', 
  137.99, 80, 'i', 1);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('Cargador 25W Blanco', 
  'El nuevo adaptador de corriente te proporciona energía para trabajar con hasta 25 W de Carga super rápida.
  Tu adaptador de corriente está disponible en blanco y negro y es más compacto y fácil de transportar que su predecesor gracias a la tecnología GaN.
  El adaptador de corriente reduce la potencia en espera de los 20 mW a los 5 mW para aumentar tu ahorro de energía en hasta un 75%.', 
  9.90, 150, 'a', 2);
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_proveedor) 
VALUES ('TV QN95C Neo QLED 138cm 55" Smart TV (2023)', 
  'Quantum Matrix Technology: Más luz, más contraste y 100% Volumen de color con los nuevos Mini LED.
  Procesador Neural 4K con IA: Imagen mejorada por Inteligencia Artificial a calidad 4K.
  Neo Quantum HDR: Disfruta de todos los colores adaptados a cada escena con la tecnología HDR+.', 
  2599.00, 70, 't', 3);

SELECT * FROM producto;

INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (1, 1);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (1, 2);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (2, 3);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (2, 4);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (3, 5);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (3, 6);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (4, 7);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (4, 8);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (5, 9);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (5, 10);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (6, 11);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (6, 12);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (7, 13);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (7, 14);
INSERT INTO pedido_producto (id_pedido, id_producto) VALUES (8, 15);

SELECT * FROM pedido_producto;

-- Obtén los nombres de los usuarios que sus nombres empiezan por la letra 'j'.
SELECT nombre
FROM usuario
WHERE nombre LIKE 'j%';

-- Obtén los usuarios españoles
SELECT *
FROM usuario
WHERE pais = 'España';

-- Obtén los usuarios que se suscribieron antes de 2020
SELECT * 
FROM usuario
WHERE fecha_registro < '2020-01-01';

-- Obtén los pedidos pendientes
SELECT *
FROM pedido
WHERE estado = 'p';

-- Obtén los pedidos realizados entre 2022 y 2024
SELECT *
FROM pedido
WHERE fecha BETWEEN '2022-01-01' AND '2024-12-31';

-- Obtén los pedidos realizados en 2022
SELECT *
FROM pedido
WHERE year(fecha) = 2022;

-- Obtén los proveedores que su nombre termine por 'e'
SELECT nombre
FROM proveedor
WHERE nombre LIKE '%e';

-- Obtén los proveedores ordenados por nombre
SELECT *
FROM proveedor
ORDER BY nombre; 

-- Obtén los proveedores ordenados al revés por el sitio web
SELECT *
FROM id_proveedor
ORDER BY sitio_web DESC;

-- Obtén los productos con un precio menor a 200€
SELECT * 
FROM producto
WHERE precio < 200;

-- Obtén los productos donde en su descripción aparezca la palabra 'TV'
SELECT *
FROM producto
WHERE descripcion LIKE '%TV%';

-- Obtén sólo el nombre y el precio de todos los productos
SELECT nombre, precio FROM producto; 