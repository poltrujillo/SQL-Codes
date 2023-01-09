
-- Exercici 2 (No corregit) --

CREATE DATABASE IF NOT EXISTS s3_c1_ej2 DEFAULT CHARACTER SET ‘utf8’ DEFAULT COLLATE ‘utf8_spanish_ci’;

USE s3_c1_ej2;

CREATE TABLE IF NOT EXISTS persona(
    num_ss VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    PRIMARY KEY(num_ss)
);

CREATE TABLE IF NOT EXISTS equipo(
    nombre VARCHAR(50),
    ano_fundacion INT,
    presupuesto INT,
    presidente VARCHAR(50),
    entrenador VARCHAR(50),
    direccion VARCHAR(50),
    PRIMARY KEY(nombre)
);

CREATE TABLE IF NOT EXISTS arbitro(
    num_ss_arbitro VARCHAR(50),
    num_colegiado INT,
    ano_inicio INT,
    profesion, VARCHAR(50),
    PRIMARY KEY(num_ss_arbitro),
    FOREIGN KEY(num_ss_arbitro) REFERENCES persona(num_ss) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS jugador(
    num_ss_jugador VARCHAR(50),
    dorsal INT,
    ubicacion VARCHAR(50),
    ficha DECIMAL,
    nombre_equipo VARCHAR(50),
    PRIMARY KEY(num_ss_jugador),
    FOREIGN KEY(num_ss_jugador) REFERENCES persona(num_ss) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(nombre_equipo) REFERENCES equipo(nombre)
);

CREATE TABLE IF NOT EXISTS partido(
    num_ss_arbitro VARCHAR(50),
    equipo_local VARCHAR(50),
    equipo_visitante VARCHAR(50),
    resultado INT,
    fecha DATE,
    PRIMARY KEY(num_ss_arbitro, equipo_local, equipo_visitante),
    FOREIGN KEY(num_ss_arbitro) REFERENCES arbitro(num_ss_arbitro) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(equipo_local) REFERENCES equipo(nombre) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(equipo_visitante) REFERENCES equipo(nombre) 
);

