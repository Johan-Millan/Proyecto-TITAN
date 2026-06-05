# Ejecución Académica
HU-F01
Registro de asistencia
CampoValorIDHU-F01ÉpicaEjecución AcadémicaRF cubiertoRF-003.3PrioridadAltaVersión1.0
Historia de usuario

Yo como instructor quiero registrar la asistencia de los participantes por sesión para llevar el control de presencia en el curso.

Criterios de aceptación

CA-01: Solo aparecen participantes inscritos en el curso.
CA-02: El sistema permite marcar asistencia o ausencia por participante.
CA-03: El registro queda guardado y solo puede corregirse con permiso especial.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/cursos/:id/sesiones/:sesion/asistenciaBackendValidar que el participante esté inscrito en el cursoBackendRegistrar en auditoría cualquier corrección posteriorBase de datosCrear tabla asistencia: id, inscripcion_id, sesion, presente (bool), fechaFrontendLista de participantes con casilla de asistenciaFrontendBotón de guardar por sesiónFrontendIndicador de sesión actualQACP-F01: Registrar asistencia completa de una sesiónQACP-F02: Verificar que participante no inscrito no aparece en lista
Notas técnicas

Si se usa ORM, crear modelos Asistencia y Sesion.

HU-F02
Registro de calificaciones
CampoValorIDHU-F02ÉpicaEjecución AcadémicaRF cubiertoRF-003.4PrioridadAltaVersión1.0
Historia de usuario

Yo como instructor quiero ingresar la calificación de un participante para determinar si aprobó o reprobó el curso.

Criterios de aceptación

CA-01: Solo se puede calificar a participantes que registraron asistencia en la sesión.
CA-02: El sistema valida que la nota esté dentro del rango permitido.
CA-03: El sistema determina automáticamente el estado aprobado/reprobado según la nota.
CA-04: Las notas requieren permiso especial para modificarse y dejan trazabilidad.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/inscripciones/:id/calificacionBackendValidar que el participante asistió antes de permitir la notaBackendCalcular y asignar estado aprobado/reprobado automáticamenteBase de datosAgregar columnas calificacion y estado_aprobacion en tabla inscripcionFrontendCampo de nota junto a cada participante con asistencia marcadaFrontendEstado aprobado/reprobado visible en tiempo realFrontendBotón de guardar calificacionesQACP-F03: Registrar nota válida a participante presenteQACP-F04: Intentar calificar participante ausenteQACP-F05: Ingresar nota fuera del rango permitido
Notas técnicas

Las notas solo pueden modificarse con permiso especial; cada modificación queda en auditoría.
