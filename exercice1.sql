
-- Exercici 1 (corregit i compila) --

CREATE DATABASE s3_c1_ej1 DEFAULT CHARACTER SET 'latin1' DEFAULT COLLATE 'latin1_bin';

USE s3_c1_ej1;

CREATE TABLE temporada(
    id_temporada INT AUTO_INCREMENT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    PRIMARY KEY(id_temporada)
);

CREATE TABLE competicion(
    nombre_competicion VARCHAR(50),
    nombre_TV VARCHAR(50),
    PRIMARY KEY(nombre_competicion)
);

CREATE TABLE federacion(
    nombre_federacion VARCHAR(50),
    fecha_creacion DATETIME,
    responsable VARCHAR(50),
    PRIMARY KEY(nombre_federacion)
);

CREATE TABLE equipo(
    nombre_equipo VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    presidente VARCHAR(50) NOT NULL,
    nombre_federacion VARCHAR(50) NOT NULL,
    PRIMARY KEY(nombre_equipo),
    FOREIGN KEY(nombre_federacion) REFERENCES federacion(nombre_federacion)
);

CREATE TABLE clasificacion(
    posicion VARCHAR(50),
    id_temporada INT,
    nombre_competicion VARCHAR(50),
    nombre_equipo VARCHAR(50),
    PRIMARY KEY(id_temporada, nombre_competicion, nombre_equipo),
    FOREIGN KEY(id_temporada) REFERENCES temporada(id_temporada),
    FOREIGN KEY(nombre_competicion) REFERENCES competicion(nombre_competicion),
    FOREIGN KEY(nombre_equipo) REFERENCES equipo(nombre_equipo)
);
