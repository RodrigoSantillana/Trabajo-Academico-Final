# Satisfacción estudiantil: Pandas, SQLite, Matplotlib, Bokeh y PyGWalker

Trabajo final del curso Herramientas para Inteligencia Artificial (Maestría en Inteligencia Artificial Aplicada).

El proyecto analiza una encuesta de satisfacción respondida por 8 756 estudiantes de pregrado de una universidad. Las respuestas llegan en un archivo CSV y el perfil de cada estudiante está en una base de datos SQLite. Los dos se unen por la columna `id_encuestado` y sobre ese único DataFrame se hace el análisis y los gráficos.

El notebook descarga los datos desde Kaggle con `kagglehub`, así que funciona igual en Jupyter Lab y en Google Colab: [encuesta-satisfaccion-estudiantil](https://www.kaggle.com/datasets/rodrisantillana/encuesta-satisfaccion-estudiantil). El dataset de Kaggle tiene los mismos tres archivos que este repositorio: `respuestas_encuesta.csv`, `01_crear_tablas.sql` y `02_insertar_datos.sql`.

## Archivos del repositorio

| Lo que pide la actividad | Archivo |
|---|---|
| Dataset inicial (CSV) | `data/respuestas_encuesta.csv` |
| SQL de la base de datos | `sql/01_crear_tablas.sql` (crea las tablas) y `sql/02_insertar_datos.sql` (ingresa los datos) |
| Notebook que genera la base de datos | `satisfaccion_estudiantil.ipynb`, secciones 3.1 a 3.3, que crean `data/encuesta.db` |
| Notebook con los pasos de la actividad | `satisfaccion_estudiantil.ipynb` (todo el proyecto está en un solo notebook) |
| Dataset final | `data/dataset_final.csv` |

Además: `sql/03_consultas.sql` reúne las consultas que usa el notebook y la carpeta `img/` guarda los gráficos de Matplotlib que aparecen en el informe de la wiki.

## Los dos datasets

**Dataset 1: `data/respuestas_encuesta.csv`.** Una fila por estudiante.

| Columna | Contenido |
|---|---|
| `id_encuestado` | Identificador del estudiante. Sirve para unir con la base de datos. |
| `plan_estudios` | Plan de estudios y formación académica. |
| `evaluacion_aprendizaje` | Evaluación del aprendizaje y logro del perfil de egreso. |
| `docentes` | Plana docente. |
| `infraestructura` | Aulas, laboratorios, áreas comunes, limpieza y seguridad. |
| `recursos_virtuales` | Aula virtual, conectividad, soporte técnico y biblioteca virtual. |
| `responsabilidad_social` | Actividades de responsabilidad social universitaria. |
| `investigacion_formativa` | Actividades de investigación formativa. |
| `bienestar_universitario` | Servicio social, servicio médico, actividades culturales y deportivas. |
| `procesos_academicos` | Matrícula, trámites, horarios, atención administrativa y biblioteca. |
| `tutoria` | Tutoría y asesoría. |
| `comedor` | Comedor universitario. |
| `practicas_preprofesionales` | Prácticas preprofesionales. Solo la califica quien las está realizando. |
| `realiza_practicas` | Si el estudiante está realizando prácticas (`Si` / `No`). |
| `considero_desertar` | Si alguna vez consideró dejar la carrera (`Si` / `No`). No todos respondieron. |

Las doce columnas de dimensiones van de 1 a 5, donde 5 es la mayor satisfacción. Cada una es el promedio de las preguntas de la encuesta que tratan ese tema.

**Dataset 2: `data/encuesta.db` (SQLite).** Dos tablas relacionadas.

| Tabla | Columnas |
|---|---|
| `area_conocimiento` | `id_area`, `nombre_area` |
| `estudiante` | `id_encuestado`, `sexo`, `rango_edad`, `etapa_carrera`, `es_foraneo`, `id_area` |

Cada estudiante pertenece a un área (`estudiante.id_area` apunta a `area_conocimiento.id_area`).

## Anonimización

La encuesta original tiene datos personales y no se publica. Antes de subir los datos a este repositorio se hizo lo siguiente:

- Se eliminaron el nombre, las fechas y horas de respuesta, la ciudad y la universidad de procedencia, los datos de discapacidad y todos los comentarios de texto libre.
- El identificador del formulario se reemplazó por un número asignado al azar.
- Las preguntas se agruparon en doce dimensiones. El archivo guarda el promedio de cada dimensión y no la respuesta a cada pregunta.
- La edad se agrupó en cuatro rangos y el semestre en tres etapas de la carrera (inicial, intermedia y final).
- El programa de estudios se reemplazó por su área de conocimiento.
- Cada combinación de área, sexo, rango de edad, etapa y procedencia aparece en cinco estudiantes o más. Cuando una combinación tenía menos de cinco, se borró el rango de edad o la etapa (`No especificado`), y 19 filas que aun así seguían en grupos pequeños se retiraron.

## Informe

El informe completo del trabajo está en la wiki del repositorio: [Trabajo Académico Final](https://github.com/RodrigoSantillana/Trabajo-Academico-Final/wiki/Trabajo-Acad%C3%A9mico-Final).

## Cómo ejecutar

El notebook funciona igual en Jupyter Lab y en Google Colab. En los dos casos descarga los datos desde Kaggle, así que no hace falta subir ningún archivo.

### Jupyter Lab

```bash
python -m pip install -r requirements.txt
python -m jupyterlab
```

Abrir `satisfaccion_estudiantil.ipynb` y ejecutar todas las celdas en orden.

### Google Colab

1. Abrir el notebook en Colab con este enlace: [satisfaccion_estudiantil.ipynb en Colab](https://colab.research.google.com/github/RodrigoSantillana/Trabajo-Academico-Final/blob/main/satisfaccion_estudiantil.ipynb).
2. Ejecutar todas las celdas en orden (menú *Entorno de ejecución* > *Ejecutar todas*).

La primera celda instala `kagglehub` y `pygwalker`. Colab ya trae instaladas las demás librerías.

## Librerías

`kagglehub` para descargar los datos, Pandas y NumPy para leerlos y transformarlos, `sqlite3` para la base de datos, y Matplotlib, Bokeh y PyGWalker para los gráficos.
