-- Consultas usadas en el notebook satisfaccion_estudiantil.ipynb

-- 1. Tablas que existen en la base de datos
SELECT name FROM sqlite_master WHERE type = 'table';

-- 2. Entidad area_conocimiento
SELECT * FROM area_conocimiento;

-- 3. Entidad estudiante
SELECT * FROM estudiante;

-- 4. Las dos entidades unidas: cada estudiante con el nombre de su área
SELECT e.id_encuestado,
       e.sexo,
       e.rango_edad,
       e.etapa_carrera,
       e.es_foraneo,
       a.nombre_area
FROM estudiante AS e
JOIN area_conocimiento AS a ON a.id_area = e.id_area;

-- 5. Número de estudiantes por área
SELECT a.nombre_area,
       COUNT(*) AS estudiantes
FROM estudiante AS e
JOIN area_conocimiento AS a ON a.id_area = e.id_area
GROUP BY a.nombre_area
ORDER BY estudiantes DESC;

-- 6. Estudiantes foráneos de un área (el área se pasa como parámetro)
SELECT e.id_encuestado,
       e.sexo,
       e.rango_edad,
       e.etapa_carrera
FROM estudiante AS e
JOIN area_conocimiento AS a ON a.id_area = e.id_area
WHERE a.nombre_area = ?
  AND e.es_foraneo = 'Si';
