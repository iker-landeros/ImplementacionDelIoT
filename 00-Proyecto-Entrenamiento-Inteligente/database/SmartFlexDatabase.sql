-- Creación de Base de datos
CREATE DATABASE SmartFlex;
USE SmartFlex;

-- Tablas independientes:
CREATE TABLE usuario(
	id INT AUTO_INCREMENT,
    email VARCHAR(30) NOT NULL,
    password VARCHAR(16) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    sexo VARCHAR(6),
    altura INT,
    peso INT,
    dob DATE,
    PRIMARY KEY(id)
);

CREATE TABLE entrenamiento (
    id INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
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
    presion INT NOT NULL,
    temperatura INT NOT NULL,
    PRIMARY KEY(idEntrenamiento,segundo),
    CONSTRAINT fk_entrenamiento_stats1
		FOREIGN KEY (idEntrenamiento) REFERENCES entrenamiento(id)
);