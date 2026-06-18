# Backlog - Modelo Cursos

## Resumen

| ID | Historia | Prioridad | Estimación |Sprint |
|---|---|---|---|---|
| HU-E01 | Programación de cursos | Alta | 5 |Sprint 1 |
| HU-E02 | Inscripción de participantes a cursos | Alta | 5 |Sprint 1 |
| HU-E03 | Validación de requisitos para inscripción | Alta | 8 |Sprint 1 |
| HU-F01 | Registro de asistencia | Media | 3 |Sprint 2 |
| HU-F02 | Registro de calificaciones | Media | 3 |Sprint 2 |
| HU-C03 | Generación automática de certificados | Alta | 8 |Sprint 2 |
| HU-D01 | Consulta de certificados por participante | Media | 3 |Sprint 3 |
| HU-D02 | Descarga de certificado en PDF | Media | 5 |Sprint 3 |

---

## HU-E01 — Programación de cursos

**Como** coordinador académico,
**quiero** programar un curso (nombre, fechas, horario, instructor, sede, cupo)
**para** ofertarlo a los participantes.

**Criterios de aceptación:**
- El sistema valida que el instructor esté disponible y certificado.
- El cupo no puede ser negativo.
- La fecha de fin debe ser posterior a la fecha de inicio.

---

## HU-E02 — Inscripción de participantes a cursos

**Como** administrador,
**quiero** inscribir a un participante en un curso programado
**para** formalizar su matrícula.

**Criterios de aceptación:**
- No se permite inscripción si el cupo está lleno.
- No se permite inscripción duplicada del mismo participante al mismo curso.
- Se notifica al participante mediante el componente de mensajes (HU-T01).

---

## HU-E03 — Validación de requisitos para inscripción

**Como** administrador,
**quiero** que el sistema valide automáticamente los requisitos previos (exámenes médicos, cursos previos aprobados)
**para** asegurar que el participante es elegible antes de inscribirlo.

**Criterios de aceptación:**
- Si falta un requisito, el sistema bloquea la inscripción.
- Se muestra un mensaje de error indicando el requisito faltante (HU-T01).

---

## Sprint 1 — Núcleo Operativo (18 SP)

**Objetivo:** Permitir la programación de cursos y la inscripción segura de participantes, validando cupos, disponibilidad de instructor y requisitos previos.

---

## HU-F01 — Registro de asistencia

**Como** instructor,
**quiero** registrar la asistencia diaria de los participantes de mi curso
**para** mantener trazabilidad de la formación.

**Criterios de aceptación:**
- Solo el instructor asignado al curso puede registrar asistencia.
- El registro queda asociado a la fecha de sesión y al curso correspondiente.

---

## HU-F02 — Registro de calificaciones

**Como** instructor,
**quiero** registrar las calificaciones/resultados de evaluación de cada participante al finalizar el curso
**para** determinar si aprueba la formación.

**Criterios de aceptación:**
- La calificación define si el participante aprueba o no.
- La aprobación es requisito para la generación del certificado (HU-C03).

---

## HU-C03 — Generación automática de certificados

**Como** sistema,
**quiero** generar automáticamente el certificado al finalizar el curso si el participante cumple asistencia y calificación mínima
**para** agilizar la emisión y garantizar trazabilidad.

**Criterios de aceptación:**
- El certificado se asocia al tipo de curso correspondiente.
- Incluye un código de verificación único.

---

## HU-D01 — Consulta de certificados por participante

**Como** participante,
**quiero** consultar el historial de certificados obtenidos asociados a los cursos que he tomado
**para** verificar mi formación.

**Criterios de aceptación:**
- Se listan todos los certificados del participante con curso, fecha y estado.

---

## HU-D02 — Descarga de certificado en PDF

**Como** participante,
**quiero** descargar mi certificado en formato PDF
**para** tener un comprobante físico/digital de mi formación.

**Criterios de aceptación:**
- El PDF incluye nombre del curso, fecha, instructor y código de verificación.
