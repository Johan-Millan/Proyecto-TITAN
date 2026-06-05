# HU-E01

## Programación de cursos

| Campo       | Valor             |
| ----------- | ----------------- |
| ID          | HU-E01            |
| Épica       | Gestión Académica |
| RF cubierto | RF-003.1          |
| Prioridad   | Alta              |
| Versión     | 1.0               |

### Historia de usuario

Yo como personal administrativo quiero programar un curso en el calendario asignando instructor, fecha, horario y cupos para organizar las capacitaciones del centro.

### Criterios de aceptación

* CA-01: El sistema permite crear un curso con tipo, fecha, horario, instructor y cupos máximos.
* CA-02: El sistema valida que el instructor no tenga otro curso en el mismo horario.
* CA-03: El curso queda visible en el calendario con la información registrada.

### Tareas técnicas

| Capa          | Tarea                                                                                                  |
| ------------- | ------------------------------------------------------------------------------------------------------ |
| Backend       | Crear endpoint POST /api/cursos                                                                        |
| Backend       | Validar disponibilidad del instructor (no solapamiento de horario)                                     |
| Backend       | Asociar tipo de curso al registro                                                                      |
| Base de datos | Crear tabla curso: id, tipo, fecha, hora_inicio, hora_fin, instructor_id, cupos_max, cupos_disponibles |
| Frontend      | Formulario de programación de curso                                                                    |
| Frontend      | Selector de instructor con validación de disponibilidad                                                |
| Frontend      | Vista en calendario al guardar                                                                         |
| QA            | CP-E01: Programar curso con instructor disponible                                                      |
| QA            | CP-E02: Intentar asignar instructor con conflicto de horario                                           |

### Notas técnicas

* El calendario puede implementarse con FullCalendar u otra librería interactiva.
* Todo curso debe tener un tipo asignado según las reglas de negocio.

### Small

Sí, se enfoca exclusivamente en la programación de cursos.

### Testable

Totalmente.
# HU-E02

## Inscripción de participantes a cursos

| Campo       | Valor             |
| ----------- | ----------------- |
| ID          | HU-E02            |
| Épica       | Gestión Académica |
| RF cubierto | RF-003.2          |
| Prioridad   | Alta              |
| Versión     | 1.0               |

### Historia de usuario

Yo como personal administrativo quiero inscribir un participante a un curso para registrar su vinculación al proceso de capacitación.

### Criterios de aceptación

* CA-01: El sistema permite inscribir a un participante si el curso tiene cupos disponibles.
* CA-02: El sistema descuenta un cupo al realizar la inscripción.
* CA-03: El sistema rechaza la inscripción si el curso está lleno.

### Tareas técnicas

| Capa          | Tarea                                                                             |
| ------------- | --------------------------------------------------------------------------------- |
| Backend       | Crear endpoint POST /api/cursos/:id/inscripciones                                 |
| Backend       | Verificar cupos disponibles antes de inscribir                                    |
| Backend       | Descontar cupo en tabla curso con control de concurrencia                         |
| Base de datos | Crear tabla inscripcion: id, curso_id, participante_id, fecha_inscripcion, estado |
| Frontend      | Panel lateral de inscritos en vista de curso                                      |
| Frontend      | Botón "Inscribir participante"                                                    |
| Frontend      | Indicador de cupos disponibles actualizado                                        |
| QA            | CP-E03: Inscribir participante en curso con cupos                                 |
| QA            | CP-E04: Intentar inscribir en curso sin cupos                                     |

### Notas técnicas

* Utilizar transacciones en base de datos para evitar sobreinscripciones por concurrencia.
* Mantener sincronizado el número de cupos disponibles.

### Small

Sí, aborda únicamente el proceso de inscripción a cursos.

### Testable

Totalmente.
# HU-E03

## Validación de requisitos para inscripción

| Campo       | Valor             |
| ----------- | ----------------- |
| ID          | HU-E03            |
| Épica       | Gestión Académica |
| RF cubierto | RF-005.1          |
| Prioridad   | Alta              |
| Versión     | 1.0               |

### Historia de usuario

Yo como personal administrativo quiero que el sistema valide los requisitos del participante antes de inscribirlo para garantizar que cumple las condiciones del curso.

### Criterios de aceptación

* CA-01: El sistema verifica si el tipo de curso exige certificado previo.
* CA-02: Si el participante no cumple el requisito, la inscripción es bloqueada con un mensaje explicativo.
* CA-03: Si cumple los requisitos, la inscripción procede normalmente.

### Tareas técnicas

| Capa          | Tarea                                                                               |
| ------------- | ----------------------------------------------------------------------------------- |
| Backend       | Implementar lógica de validación de requisitos según tipo de curso                  |
| Backend       | Retornar error descriptivo si no cumple requisito                                   |
| Base de datos | Crear tabla tipo_curso_requisito: tipo_curso_id, requisito (ej. certificado_previo) |
| Frontend      | Mostrar mensaje de bloqueo con motivo específico                                    |
| Frontend      | Mostrar requisitos del curso antes de intentar inscribir                            |
| QA            | CP-E05: Inscribir en reentrenamiento con certificado previo vigente                 |
| QA            | CP-E06: Intentar inscribir sin certificado previo requerido                         |

### Notas técnicas

* Los cursos de reentrenamiento exigen un certificado previo vigente del mismo tipo de formación.
* La validación debe ejecutarse antes de confirmar la inscripción.

### Small

Sí, se enfoca en la validación de requisitos para la inscripción.

### Testable

Totalmente.

