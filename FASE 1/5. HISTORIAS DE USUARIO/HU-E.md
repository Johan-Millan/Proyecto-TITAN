# Gestión Académica
HU-E01
Programación de cursos
CampoValorIDHU-E01ÉpicaGestión AcadémicaRF cubiertoRF-003.1PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero programar un curso en el calendario asignando instructor, fecha, horario y cupos para organizar las capacitaciones del centro.

Criterios de aceptación

CA-01: El sistema permite crear un curso con tipo, fecha, horario, instructor y cupos máximos.
CA-02: El sistema valida que el instructor no tenga otro curso en el mismo horario.
CA-03: El curso queda visible en el calendario con la información registrada.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/cursosBackendValidar disponibilidad del instructor (no solapamiento de horario)BackendAsociar tipo de curso al registroBase de datosCrear tabla curso: id, tipo, fecha, hora_inicio, hora_fin, instructor_id, cupos_max, cupos_disponiblesFrontendFormulario de programación de cursoFrontendSelector de instructor con validación de disponibilidadFrontendVista en calendario al guardarQACP-E01: Programar curso con instructor disponibleQACP-E02: Intentar asignar instructor con conflicto de horario
Notas técnicas

El calendario puede usar FullCalendar u otra librería interactiva.
Todo curso debe tener tipo asignado (RN obligatoria).

HU-E02
Inscripción de participantes a cursos
CampoValorIDHU-E02ÉpicaGestión AcadémicaRF cubiertoRF-003.2PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero inscribir un participante a un curso para registrar su vinculación al proceso de capacitación.

Criterios de aceptación

CA-01: El sistema permite inscribir a un participante si el curso tiene cupos disponibles.
CA-02: El sistema descuenta un cupo al realizar la inscripción.
CA-03: El sistema rechaza la inscripción si el curso está lleno.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/cursos/:id/inscripcionesBackendVerificar cupos disponibles antes de inscribirBackendDescontar cupo en tabla curso con control de concurrenciaBase de datosCrear tabla inscripcion: id, curso_id, participante_id, fecha_inscripcion, estadoFrontendPanel lateral de inscritos en vista de cursoFrontendBotón "Inscribir participante"FrontendIndicador de cupos disponibles actualizadoQACP-E03: Inscribir participante en curso con cuposQACP-E04: Intentar inscribir en curso sin cupos
Notas técnicas

Usar transacción en BD para evitar sobreinscripción por concurrencia.

HU-E03
Validación de requisitos para inscripción
CampoValorIDHU-E03ÉpicaGestión AcadémicaRF cubiertoRF-005.1PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero que el sistema valide los requisitos del participante antes de inscribirlo para garantizar que cumple las condiciones del curso.

Criterios de aceptación

CA-01: El sistema verifica si el tipo de curso exige certificado previo.
CA-02: Si el participante no cumple el requisito, la inscripción es bloqueada con mensaje explicativo.
CA-03: Si cumple los requisitos, la inscripción procede normalmente.

Tareas técnicas
CapaTareaBackendImplementar lógica de validación de requisitos según tipo de cursoBackendRetornar error descriptivo si no cumple requisitoBase de datosCrear tabla tipo_curso_requisito: tipo_curso_id, requisito (ej. certificado_previo)FrontendMostrar mensaje de bloqueo con motivo específicoFrontendMostrar requisitos del curso antes de intentar inscribirQACP-E05: Inscribir en reentrenamiento con certificado previo vigenteQACP-E06: Intentar inscribir sin certificado previo requerido
Notas técnicas

Reentrenamiento exige certificado previo vigente del mismo tipo de curso (RN).

