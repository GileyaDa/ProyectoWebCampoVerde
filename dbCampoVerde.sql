CREATE DATABASE dbCampoVerde;
USE dbCampoVerde;

CREATE TABLE proveedor (
    idProveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombreProveedor VARCHAR(50),
    direccionProveedor VARCHAR(255),
    telefonoProveedor VARCHAR(9),
    correoProveedor VARCHAR(50),
    rucProveedor VARCHAR(11),
    imagenProveedor VARCHAR(255)
);
INSERT INTO proveedor (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, rucProveedor, imagenProveedor)
VALUES 
    ('Equilibra Peru S.A.', 'Av. Circunvalación Del Club Golf Los Incas N° 134, Santiago de Surco 15023, Lima - Perú', '934959493', 'fertilizantes@equilibra.pe', '20601647649','equilibraProveedor.jpg'),
    ('Fertisur S.A.C. ', 'Cal. Carlos Nuñez del Arco Nro. 110, Callao - Perú', '974859495', 'comercial@fertisur.com', '20512122311','fertisurProveedor.jpg'),
    ('Alimencorp S.A.C.', 'Mza. H1 Lote. 05 Huertos de Oro de San Hil, Cañete - Perú', '945958662', 'alimenCorp@gmail.com', '20557543571','alimencorpProveedor.jpg'),
    ('G.E. Corina S.A.C.', 'Mza. K Lote. 8a A.F. la Capitana, Lima - Perú', '934558495', 'CorinaGE@gmail.com', '20563732416','corinaProveedor.png');

CREATE TABLE insumo (
    idInsumo INT PRIMARY KEY AUTO_INCREMENT,
    nombreInsumo VARCHAR(50) NOT NULL, 	
    descripcionInsumo VARCHAR(255),
    unidadMedida VARCHAR(20),
    precioInsumo DECIMAL(10, 2),
    imagenInsumo VARCHAR(255),
    idProveedor INT,
    FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor)
);
INSERT INTO insumo (nombreInsumo, descripcionInsumo, unidadMedida, precioInsumo, imagenInsumo, idProveedor)
VALUES 
    ('Semilla de Maíz', 'Semilla de maíz para siembra.', 'kg', 10.50,'semillaMaiz.png', 1),
    ('Semilla de Soya', 'Semilla de soya para siembra.', 'kg', 12.75,'semillaSoya.png', 1),
    ('Semilla de Quinua', 'Semilla de quinua para siembra.', 'kg', 15.00,'semillaQuinua.png', 1),
    ('Semilla de Cebada', 'Semilla de cebada para siembra.', 'kg', 11.80,'semillaCebada.png', 1),
    ('Fertilizante Cloruro de Potasio', 'KCl Fuente de Fertilización de Potasio (K). Es un producto 100% soluble para aplicación en Fertirriego.', 'kg', 30.00,'fertilizanteCloruro.png', 2),
    ('Fertilizante Nitrato de Magnesio', 'El Magnesio es esencial para la síntesis de la clorofila.', 'kg', 45.00,'fertilizanteMagnesio.png', 2),
    ('Alimento para Vacunos Tipo A', 'Alimento balanceado para vacunos de tipo A.', 'kg', 58.50,'alimentoVacunoA.png', 3),
    ('Alimento para Vacunos Tipo B', 'Alimento balanceado para vacunos de tipo B.', 'kg', 64.20,'alimentoVacunoB.png', 4),
    ('Alimento para Cerdos de Engorde', 'Alimento concentrado para cerdos de engorde.', 'kg', 49.00,'alimentoCerdoEngorde.png', 3),
    ('Alimento para Cerdos en Crecimiento', 'Alimento concentrado para cerdos en crecimiento.', 'kg', 38.20,'alimentoCerdoCrecimiento.png', 4),
    ('Alimento para Corderos Tipo A', 'Alimento balanceado para corderos de tipo A.', 'kg', 55.00,'alimentoCorderoA.png', 3),
    ('Alimento para Corderos Tipo B', 'Alimento balanceado para corderos de tipo B.', 'kg', 50.00,'alimentoCorderoB.png', 4),
    ('Fertilizante Urea Granular', 'El Nitrógeno es esencial en la planta y es un componente de los aminoácidos; por lo tanto el nitrógeno es directamente responsable del incremento de proteínas en la plantas.', 'kg', 45.00,'fertilizanteUrea.png', 2);
    
CREATE TABLE animal (
    idAnimal INT PRIMARY KEY AUTO_INCREMENT,
    razaAnimal VARCHAR(50),
    cantidadAnimal INT,
    idInsumo INT,
    cantidadInsumo DECIMAL(10, 2),
    imagenAnimal VARCHAR(255),
    FOREIGN KEY (idInsumo) REFERENCES insumo(idInsumo));

INSERT INTO animal (razaAnimal, cantidadAnimal, idInsumo, cantidadInsumo, imagenAnimal)
VALUES 
    ('Vaca Holstein', 50, 7, 100.00, 'vacaHolstein.png'), 
    ('Vaca Jersey', 50, 8, 200.00, 'vacaJersey.png'), 
    ('Cerdo Landrace', 75, 9, 150.00, 'cerdoLandrace.png'), 
    ('Cerdo Yorkshire', 75, 10, 250.00, 'cerdoYorkshire.png'), 
    ('Cordero Suffolk', 40, 11, 120.00, 'corderoSuffolk.png'), 
    ('Cordero Merino', 40, 12, 180.00, 'corderoMerino.png');

CREATE TABLE tipoProducto (
    idTipo INT PRIMARY KEY AUTO_INCREMENT,
    nombreTipo VARCHAR(50) NOT NULL,
    descripcionTipo VARCHAR(255)
);
INSERT INTO tipoProducto (nombreTipo, descripcionTipo) VALUES
('Agrícola', 'Productos derivados del cultivo y cosecha de plantas.'),
('Ganadero', 'Productos derivados de los animales.');

CREATE TABLE categoriaProducto (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombreCategoria VARCHAR(50) NOT NULL,
    descripcionCategoria VARCHAR(255),
    idTipo INT,
    FOREIGN KEY (idTipo) REFERENCES tipoProducto(idTipo)
);
INSERT INTO categoriaProducto (nombreCategoria, descripcionCategoria, idTipo) VALUES
('Frutas', 'Frutas cultivadas y cosechadas.', 1),
('Hortalizas', 'Hortalizas cultivadas y cosechadas.', 1),
('Granos y Cereales', 'Granos y cereales cultivados y cosechados.', 1),
('Legumbres', 'Legumbres cultivadas y cosechadas.', 1),
('Carne', 'Carne obtenida de animales.', 2),
('Lácteos', 'Productos lácteos obtenidos de animales.', 2);

CREATE TABLE producto (
    idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProducto VARCHAR(50),
    descripcionProducto VARCHAR(255),
    stockProducto INT,
    precioProducto DECIMAL(10, 2),
    idCategoria INT,
    idAnimal INT,
    FOREIGN KEY (idCategoria) REFERENCES categoriaProducto(idCategoria),
    FOREIGN KEY (idAnimal) REFERENCES animal(idAnimal)
);
INSERT INTO producto (nombreProducto, descripcionProducto, stockProducto, precioProducto, idCategoria, idAnimal) VALUES 
('Mango', 'Mangifera indica, fruta tropical jugosa y dulce.', 200, 5.50, 1, NULL),
('Palta', 'Persea americana, fruta verde y cremosa, ideal para ensaladas.', 300, 7.20, 1, NULL),
('Uva', 'Vitis vinifera, fruta pequeña y jugosa, perfecta para snacks.', 150, 6.30, 1, NULL),
('Plátano', 'Musa, fruta alargada y dulce, rica en potasio.', 250, 4.10, 1, NULL),
('Maracuyá', 'Passiflora edulis, fruta tropical ácida, ideal para jugos.', 180, 8.50, 1, NULL),
('Papa', 'Solanum tuberosum, tubérculo versátil y nutritivo.', 400, 3.20, 2, NULL),
('Maíz', 'Zea mays, cereal esencial en muchas cocinas.', 350, 2.80, 2, NULL),
('Cebolla', 'Allium cepa, hortaliza de sabor fuerte, usada en muchas recetas.', 300, 2.50, 2, NULL),
('Zanahoria', 'Daucus carota, hortaliza crujiente y dulce, rica en betacaroteno.', 280, 3.00, 2, NULL),
('Quinua', 'Chenopodium quinoa, grano andino altamente nutritivo.', 500, 9.50, 3, NULL),
('Cebada', 'Hordeum vulgare, cereal usado en la elaboración de cerveza.', 450, 7.00, 3, NULL),
('Soya', 'Glycine max, leguminosa rica en proteínas.', 400, 8.20, 3, NULL),
('Lenteja', 'Lens culinaris, leguminosa pequeña y nutritiva.', 350, 6.50, 4, NULL),
('Garbanzo', 'Cicer arietinum, leguminosa versátil, usada en hummus y otras preparaciones.', 300, 7.00, 4, NULL),
('Carne de res', 'Carne de vacuno, carne obtenida de animales.', 500, 9.80, 5, 1), 
('Carne de cerdo', 'Carne de cerdo, carne obtenida de animales.', 450, 8.60, 5, 2), 
('Carne de cordero', 'Carne de cordero, carne obtenida de animales.', 400, 12.00, 5, 3), 
('Leche', 'Leche, producto lácteo obtenido de animales.', 800, 1.50, 6, 1), 
('Queso', 'Queso, producto lácteo obtenido de animales.', 600, 4.00, 6, 1), 
('Yogur', 'Yogur, producto lácteo obtenido de animales.', 500, 3.00, 6, 1), 
('Mantequilla', 'Mantequilla, producto lácteo obtenido de animales.', 400, 5.50, 6, 1); 

CREATE TABLE detalleProducto (
    idDetalleProducto INT PRIMARY KEY AUTO_INCREMENT,
    idProducto INT,
    idInsumo INT,
    cantidadInsumo INT,
    FOREIGN KEY (idProducto) REFERENCES producto(idProducto),
    FOREIGN KEY (idInsumo) REFERENCES insumo(idInsumo)
);
INSERT INTO detalleProducto (idProducto, idInsumo, cantidadInsumo) VALUES 
(1, 6, 20),
(2, 6, 30),    
(3, 6, 20),    
(4, 6, 15),    
(5, 6, 15),    
(6, 5, 40),   
(7, 1, 23),   
(8, 5, 35),    
(9, 5, 35),  
(10, 3, 22),   
(11, 4, 15),   
(12, 2, 18),   
(13, 13, 19), 
(14, 13, 19);

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombreCliente VARCHAR(50),
    direccionCliente VARCHAR(255),
    telefonoCliente VARCHAR(9),
    correoCliente VARCHAR(50),
    dniCliente VARCHAR(8)
);
INSERT INTO cliente (nombreCliente, direccionCliente, telefonoCliente, correoCliente, dniCliente) VALUES 
('Julian Quispe', 'Jr. Los Pinos 123, Lima', '987654311', 'juan.perez@gmail.com', '47283901'),
('Juan Lazaro', 'Av. Primavera 456, Arequipa', '987654312', 'maria.garcia@gmail.com', '48273612'),
('Carlos Lopez', 'Calle Las Flores 789, Trujillo', '987654313', 'carlos.lopez@gmail.com', '49264723'),
('Ana Lobaton', 'Av. Los Álamos 101, Cusco', '987654314', 'ana.sanchez@gmail.com', '50285734'),
('Lucero Hernandez', 'Calle El Sol 202, Piura', '987654315', 'lucia.fernandez@gmail.com', '51296745'),
('Piero Mendoza', 'Av. Grau 303, Chiclayo', '987654316', 'pedro.torres@gmail.com ', '52237856'),
('Claudia Zapata', 'Jr. Amazonas 404, Iquitos', '987654317', 'claudia.romero@gmail.com', '53248967'),
('José Martínez', 'Calle Puno 505, Tacna', '987654318', 'josiMa@gmail.com', '54259078'),
('Elsa Fuentes', 'Av. Cusco 606, Huancayo', '987654319', 'elenita@gmail.com', '55260189'),
('Miguel Noa', 'Jr. Ayacucho 707, Puno', '987654320', 'miguelinho@gmail.com', '56271290');

CREATE TABLE rol (
    idRol INT PRIMARY KEY AUTO_INCREMENT,
    nombreRol VARCHAR(5) NOT NULL,
    descripcionRol VARCHAR(255)
);
INSERT INTO rol (nombreRol, descripcionRol) VALUES
('admin', 'Rol de administrador con acceso completo al sistema.'),
('user', 'Rol de usuario con permisos limitados en el sistema.');

CREATE TABLE empleado (
    idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombreEmpleado VARCHAR(50),
    telefonoEmpleado VARCHAR(9),
    correoEmpleado VARCHAR(50),
    dniEmpleado VARCHAR(8),
    contraseñaEmpleado VARCHAR(255),
    fechaContratacion DATE,
    cargo VARCHAR(100),
    idRol INT,
    FOREIGN KEY (idRol) REFERENCES rol(idRol)
);
INSERT INTO empleado (nombreEmpleado, telefonoEmpleado, correoEmpleado, dniEmpleado, contraseñaEmpleado, fechaContratacion, cargo, idRol) VALUES
('José Alonzo Bustamante Bernuy', '934348439', 'AlonzoB21@gmail.com', '48659403', '6d321edbdad606cdee77e2113bee62b9dcac6f9ad7dcf71c473f00e4a6cf95d7', '2000-05-28', 'Gerente de Servicios', '1'),
('Dayana Yanett Lévano Giraldo ', '923579117', 'dayanalevanogiraldo@gmail.com', '74130764', 'e4a908a6a98c015912156c76aa303411e8c64728103da5df2e25f96e67eb58c8', '2024-06-20', 'Gerente de Recursos Humanos', '2');


CREATE TABLE pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    idProveedor INT,
    fechaPedido DATE,
    totalPedido DECIMAL(10, 2),
    idEmpleado INT,
    FOREIGN KEY (idProveedor) REFERENCES proveedor(idProveedor),
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);
INSERT INTO pedido (idProveedor, fechaPedido, totalPedido, idEmpleado) VALUES
(1, '2024-01-10', 200.00, 1),
(2, '2024-02-15', 400.00, 1),
(3, '2024-03-20', 300.00, 1),
(4, '2024-04-25', 500.00, 2),
(1, '2024-05-05', 250.00, 2),
(2, '2024-06-10', 450.00, 2);

CREATE TABLE detallePedido (
    idDetallePedido INT PRIMARY KEY AUTO_INCREMENT,
    idPedido INT,
    idInsumo INT,
    cantidadInsumo INT,
    FOREIGN KEY (idPedido) REFERENCES pedido(idPedido),
    FOREIGN KEY (idInsumo) REFERENCES insumo(idInsumo)
);
INSERT INTO detallePedido (idPedido, idInsumo, cantidadInsumo) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 8),
(2, 4, 7),
(3, 5, 6),
(3, 6, 4),
(4, 7, 12),
(4, 8, 15),
(5, 9, 20),
(5, 10, 10),
(6, 11, 25),
(6, 12, 20);


CREATE TABLE venta (
    idVenta INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT,
    fechaVenta DATE,
    totalVenta DECIMAL(10, 2),
    idEmpleado INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);
INSERT INTO venta (idCliente, fechaVenta, totalVenta, idEmpleado) VALUES
(1, '2024-01-12', 50.00, 1),
(2, '2024-02-18', 75.00, 2),
(3, '2024-03-22', 100.00, 1),
(4, '2024-04-28', 65.00, 2),
(5, '2024-05-06', 85.00, 1),
(6, '2024-06-11', 90.00, 2),
(1, '2024-01-20', 55.00, 1),
(2, '2024-02-25', 80.00, 2),
(3, '2024-03-30', 95.00, 1),
(4, '2024-04-12', 60.00, 2),
(5, '2024-05-18', 70.00, 1);

CREATE TABLE detalleVenta (
    idDetalleVenta INT PRIMARY KEY AUTO_INCREMENT,
    idVenta INT,
    idProducto INT,
    cantidadProducto INT,
    FOREIGN KEY (idVenta) REFERENCES venta(idVenta),
    FOREIGN KEY (idProducto) REFERENCES producto(idProducto)
);
INSERT INTO detalleVenta (idVenta, idProducto, cantidadProducto) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 15),
(2, 4, 10),
(3, 5, 20),
(3, 6, 10),
(4, 7, 25),
(4, 8, 20),
(5, 9, 15),
(5, 10, 5),
(6, 11, 10),
(6, 12, 10),
(7, 1, 10),
(7, 2, 5),
(8, 3, 15),
(8, 4, 10),
(9, 5, 20),
(9, 6, 10),
(10, 7, 25),
(10, 8, 20),
(11, 9, 15),
(11, 10, 5);

CREATE TABLE noticia (
    idNoticia INT PRIMARY KEY AUTO_INCREMENT,
    tituloNoticia VARCHAR(255),
    descripcionNoticia VARCHAR(255),
    contenido TEXT,
    fechaNoticia DATE,
    idEmpleado INT,
    imagen VARCHAR(255),
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);
INSERT INTO noticia (tituloNoticia, descripcionNoticia, contenido, fechaNoticia, idEmpleado, imagen)
VALUES 
    ('Nueva Cosecha de Mangos en Temporada', 
     'Nos complace anunciar la llegada de una nueva cosecha de mangos frescos y jugosos. ¡Listos para ofrecer!',
     'El uso de fertilizantes en el cultivo de frutas es esencial para garantizar un crecimiento saludable y una producción abundante. Los fertilizantes proporcionan los nutrientes necesarios que el suelo puede no tener en cantidades suficientes. Sin ellos, las plantas podrían sufrir de deficiencias nutricionales, lo que resultaría en una menor calidad y cantidad de fruta. El fertilizante Cloruro de Potasio (KCl), por ejemplo, es crucial para el desarrollo de frutas como el mango y la palta, ya que el potasio es vital para la formación de azúcares y almidones. Además, el Nitrato de Magnesio es esencial para la síntesis de clorofila, lo que mejora la fotosíntesis y el crecimiento general de la planta. En Grupo Campo Verde, utilizamos fertilizantes de alta calidad para asegurarnos de que nuestras frutas sean de la mejor calidad posible.',
     '2024-01-15', 1, 'cosechaMangos.jpg'),
     
    ('Beneficios de la Comunicación Efectiva en el Trabajo', 
     'Aprende por qué la comunicación es clave en el trabajo.',
     'La comunicación efectiva en el trabajo es fundamental para el éxito de cualquier organización. Facilita la colaboración, mejora la moral de los empleados y aumenta la eficiencia operativa. En Grupo Campo Verde, fomentamos una comunicación abierta y honesta entre todos los niveles de la empresa. Esto nos permite resolver problemas rápidamente, compartir ideas innovadoras y mantener a todos informados sobre los objetivos y logros de la empresa. Además, una buena comunicación puede ayudar a prevenir malentendidos y conflictos, creando un ambiente de trabajo más armonioso y productivo.',
     '2024-03-15', 1, 'comunicacionEfectiva.jpg'),

    ('Técnicas de Cultivo de Quinua para Máximos Rendimientos', 
     'Descubre nuestras técnicas avanzadas de cultivo de quinua.',
     'La quinua es un cultivo que requiere técnicas específicas para obtener los mejores rendimientos. Desde la selección de semillas hasta el manejo del suelo y el riego, cada paso es crucial para asegurar una cosecha exitosa. En Grupo Campo Verde, utilizamos prácticas agrícolas sostenibles y avanzadas para cultivar quinua de alta calidad. Esto incluye el uso de fertilizantes específicos que mejoran la fertilidad del suelo y el control de plagas mediante métodos naturales. También implementamos tecnologías de riego eficientes que optimizan el uso del agua y reducen el impacto ambiental.',
     '2024-04-20', 1, 'tecnicasCultivoQuinua.jpg');

CREATE TABLE evento (
    idEvento INT PRIMARY KEY AUTO_INCREMENT,
    nombreEvento VARCHAR(255),
    descripcionEvento VARCHAR(255),
    enlaceInvitacion VARCHAR(255),
    fechaCreacion DATE,
    imagen VARCHAR(255),
    idEmpleado INT,
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);
INSERT INTO evento (nombreEvento, descripcionEvento, enlaceInvitacion, fechaCreacion, imagen, idEmpleado)
VALUES 
    ('Reunión Corporativa', 'Se hablará de temas importantes referente a la organización de Campo Verde, el día 20 de Julio a las 3:00 p.m. en la sala principal', 'https://forms.gle/V97mRQ3DgrXXYKz48', '2024-07-01', 'reunionCorporativa.jpg', 1),
    ('Seminario de Innovación', 'Participa en el seminario de innovación a cargo de un conocido escritor sobre cuidados ambientales. Será el día 10 de Agosto a las 6:00 p.m. en el área general', 'https://forms.gle/LrZBf5zXc68shxT96', '2024-07-04', 'seminarioIn	novacion.jpg', 1);
    
CREATE TABLE foro (
idForo INT PRIMARY KEY AUTO_INCREMENT,
tituloForo VARCHAR(255),
comentario TEXT,
fechaForo DATE,
idEmpleado INT,
esAdmin BOOLEAN DEFAULT FALSE,
FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);
INSERT INTO foro (tituloForo, comentario, fechaForo, idEmpleado, esAdmin)
VALUES 
    ('Impacto de los Fertilizantes en la Calidad de los Productos Agrícolas', 
     'Discutamos cómo los diferentes tipos de fertilizantes afectan la calidad de nuestros productos agrícolas. ¿Qué fertilizantes estás usando y qué resultados has observado?', 
     '2024-05-01', 2, TRUE),
     
    ('Mejores Prácticas para la Comunicación Interna en la Empresa', 
     'La comunicación interna efectiva es clave para el éxito de nuestra empresa. Comparte tus mejores prácticas y estrategias para mejorar la comunicación entre departamentos.', 
     '2024-06-01', 1, TRUE),
     
    ('Innovaciones en el Cultivo de Granos y Cereales', 
     'Este foro es para compartir y discutir las últimas innovaciones en el cultivo de granos y cereales. ¿Qué nuevas técnicas o tecnologías estás utilizando?', 
     '2024-06-15', 2, TRUE);

CREATE TABLE respuestaForo (
    idRespuesta INT PRIMARY KEY AUTO_INCREMENT,
    idForo INT,
    comentario TEXT,
    fechaRespuesta DATE,
    idEmpleado INT,
    FOREIGN KEY (idForo) REFERENCES foro(idForo),
    FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);