-- Creación de Base de datos
CREATE DATABASE SmartFlex;
USE SmartFlex;

-- Tablas independientes:
CREATE TABLE usuario(
	id INT AUTO_INCREMENT,
    email VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    sexo VARCHAR(6),
    altura INT,
    peso INT,
    dob VARCHAR(10), -- Si no, no lo reconoce el JSON
    PRIMARY KEY(id,email)
);

CREATE TABLE entrenamiento (
    id INT AUTO_INCREMENT,
    fecha VARCHAR(10) NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    tiempo INT NOT NULL,
    PRIMARY KEY(id)
);

-- Tablas dependientes
CREATE TABLE usuarioEntrena (
	idUsuario INT,
    idEntrenamiento INT,
    PRIMARY KEY(idUsuario,idEntrenamiento),
    CONSTRAINT fk_usuario_usuarioEntrena1
		FOREIGN KEY (idUsuario) REFERENCES usuario(id),
	CONSTRAINT fk_entrenamiento_usuarioEntrena1
		FOREIGN KEY (idEntrenamiento) REFERENCES entrenamiento(id)
);

CREATE TABLE stats (
	idEntrenamiento INT AUTO_INCREMENT,
    segundo INT NOT NULL,
    ECG INT NOT NULL,
    temperatura DECIMAL(3,1) NOT NULL,
    humedad DECIMAL(3,1) NOT NULL,
    PRIMARY KEY(idEntrenamiento,segundo),
    CONSTRAINT fk_entrenamiento_stats1
		FOREIGN KEY (idEntrenamiento) REFERENCES entrenamiento(id)
);

INSERT INTO usuario(email, password, nombre, apellido, sexo, altura, peso, dob)
VALUES('iker@gmail.com',SHA2("iker.123", 224),"Iker", "Landeros", "Hombre", 173, 63, '2002-08-24'),
	  ('lore@gmail.com',SHA2("lore.123", 224),"Loredana", "Landeros", "Mujer", 162, 55, '2007-08-10');


INSERT INTO entrenamiento(fecha,tipo,tiempo)
VALUES('2011-09-03',"Caminadora",600),
	  ('2011-09-04',"Bicicleta",500);
      
INSERT INTO stats(idEntrenamiento, segundo, ECG, temperatura, humedad)
VALUES(1, 5, 657, 24.3, 55.9),
	  (1, 10, 658, 24.3, 56.0),
      (1, 15, 569, 24.3, 56.1),
      (1, 20, 657, 24.4, 55.9),
	  (1, 25, 658, 24.4, 56.0),
      (1, 30, 658, 24.3, 56.0),
      (1, 35, 569, 24.3, 56.1),
      (1, 40, 657, 24.2, 55.9),
	  (1, 45, 658, 24.2, 56.0),
      (1, 50, 657, 24.3, 55.9),
	  (1, 55, 658, 24.3, 56.0),
      (1, 60, 658, 24.4, 56.0),
      (1, 65, 569, 24.4, 56.1),
      (1, 70, 657, 24.5, 55.9),
	  (1, 75, 658, 24.5, 56.0);
      
INSERT INTO usuarioEntrena(idUsuario,idEntrenamiento)
VALUES(1,1),
	  (1,2),
      (2,3),
      (1,4);

SELECT * FROM usuario;
SELECT * FROM entrenamiento;
SELECT * FROM stats;
SELECT * FROM usuarioEntrena;

-- Sacar nombre,, apellido, dob, peso, altura, sexo, tipo de último entrenamiento, fecha de último entrenamiento
SELECT u.nombre, u.apellido, u.dob, u.peso, u.altura, u.sexo, e.tipo, e.fecha FROM entrenamiento e 
JOIN usuarioEntrena uE ON e.id = uE.idEntrenamiento
JOIN usuario u ON uE.idUsuario = u.id
WHERE u.id = 1 
ORDER BY e.id DESC
LIMIT 1;

SELECT *
FROM entrenamiento
ORDER BY id DESC
LIMIT 1;

-- Dar el último segundo y humedad, pero los últimos 5 ECG y Temperatura
SELECT segundo, ECG, temperatura, humedad
FROM stats
ORDER BY segundo DESC
LIMIT 10;

SELECT s.segundo, s.ECG, s.temperatura, s.humedad
FROM stats s
JOIN entrenamiento e ON s.idEntrenamiento = e.id
WHERE e.id = 1
ORDER BY segundo DESC
LIMIT 20;