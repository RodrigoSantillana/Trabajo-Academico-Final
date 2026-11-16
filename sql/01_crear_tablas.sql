-- Base de datos del proyecto (SQLite)
-- Guarda el perfil de los estudiantes que respondieron la encuesta.
-- Dos entidades: area_conocimiento y estudiante (un área tiene muchos estudiantes).

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS estudiante;
DROP TABLE IF EXISTS area_conocimiento;

-- Entidad 1: área de conocimiento a la que pertenece el programa de estudios
CREATE TABLE area_conocimiento (
    id_area      INTEGER PRIMARY KEY,
    nombre_area  TEXT    NOT NULL UNIQUE
);

-- Entidad 2: estudiante que respondió la encuesta
CREATE TABLE estudiante (
    id_encuestado  INTEGER PRIMARY KEY,
    sexo           TEXT    NOT NULL CHECK (sexo IN ('Mujer', 'Hombre')),
    rango_edad     TEXT    NOT NULL CHECK (rango_edad IN ('18 o menos', '19 a 21', '22 a 24', '25 o más', 'No especificado')),
    etapa_carrera  TEXT    NOT NULL CHECK (etapa_carrera IN ('Inicial', 'Intermedia', 'Final', 'No especificado')),
    es_foraneo     TEXT    NOT NULL CHECK (es_foraneo IN ('Si', 'No')),
    id_area        INTEGER NOT NULL,
    FOREIGN KEY (id_area) REFERENCES area_conocimiento (id_area)
);

-- Índice para acelerar las consultas que unen estudiante con su área
CREATE INDEX idx_estudiante_area ON estudiante (id_area);
