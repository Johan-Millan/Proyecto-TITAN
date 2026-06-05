# HU-F01

## Registro de asistencia

| Campo       | Valor               |
| ----------- | ------------------- |
| ID          | HU-F01              |
| Épica       | Ejecución Académica |
| RF cubierto | RF-003.3            |
| Prioridad   | Alta                |
| Versión     | 1.0                 |

### Historia de usuario

Yo como instructor quiero registrar la asistencia de los participantes por sesión para llevar el control de presencia en el curso.

### Criterios de aceptación

* CA-01: Solo aparecen participantes inscritos en el curso.
* CA-02: El sistema permite marcar asistencia o ausencia por participante.
* CA-03: El registro queda guardado y solo puede corregirse con permiso especial.

### Tareas técnicas

| Capa          | Tarea                                                                      |
| ------------- | -------------------------------------------------------------------------- |
| Backend       | Crear endpoint POST /api/cursos/:id/sesiones/:sesion/asistencia            |
| Backend       | Validar que el participante esté inscrito en el curso                      |
| Backend       | Registrar en auditoría cualquier corrección posterior                      |
| Base de datos | Crear tabla asistencia: id, inscripcion_id, sesion, presente (bool), fecha |
| Frontend      | Lista de participantes con casilla de asistencia                           |
| Frontend      | Botón de guardar por sesión                                                |
| Frontend      | Indicador de sesión actual                                                 |
| QA            | CP-F01: Registrar asistencia completa de una sesión                        |
| QA            | CP-F02: Verificar que participante no inscrito no aparece en lista         |

### Notas técnicas

* Si se utiliza ORM, crear los modelos Asistencia y Sesion.
* Las correcciones posteriores deben quedar registradas en auditoría para trazabilidad.

### Small

Sí, se enfoca exclusivamente en el control de asistencia de los participantes.

### Testable

Totalmente.
# HU-F02

## Registro de calificaciones

| Campo       | Valor               |
| ----------- | ------------------- |
| ID          | HU-F02              |
| Épica       | Ejecución Académica |
| RF cubierto | RF-003.4            |
| Prioridad   | Alta                |
| Versión     | 1.0                 |

### Historia de usuario

Yo como instructor quiero ingresar la calificación de un participante para determinar si aprobó o reprobó el curso.

### Criterios de aceptación

* CA-01: Solo se puede calificar a participantes que registraron asistencia en la sesión.
* CA-02: El sistema valida que la nota esté dentro del rango permitido.
* CA-03: El sistema determina automáticamente el estado aprobado o reprobado según la nota.
* CA-04: Las notas requieren permiso especial para modificarse y dejan trazabilidad.

### Tareas técnicas

| Capa          | Tarea                                                                  |
| ------------- | ---------------------------------------------------------------------- |
| Backend       | Crear endpoint POST /api/inscripciones/:id/calificacion                |
| Backend       | Validar que el participante asistió antes de permitir la nota          |
| Backend       | Calcular y asignar estado aprobado/reprobado automáticamente           |
| Base de datos | Agregar columnas calificacion y estado_aprobacion en tabla inscripcion |
| Frontend      | Campo de nota junto a cada participante con asistencia marcada         |
| Frontend      | Estado aprobado/reprobado visible en tiempo real                       |
| Frontend      | Botón de guardar calificaciones                                        |
| QA            | CP-F03: Registrar nota válida a participante presente                  |
| QA            | CP-F04: Intentar calificar participante ausente                        |
| QA            | CP-F05: Ingresar nota fuera del rango permitido                        |

### Notas técnicas

* Las notas solo pueden modificarse mediante permisos especiales.
* Toda modificación debe quedar registrada en auditoría con usuario, fecha y valor anterior.
* El rango permitido de notas debe configurarse según las reglas académicas del sistema.

### Small

Sí, se enfoca en el proceso de registro y validación de calificaciones.

### Testable

Totalmente.

