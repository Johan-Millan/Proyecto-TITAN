HU-A01
Registro de participantes
CampoValorIDHU-A01ÉpicaGestión de PersonasRF cubiertoRF-001.1PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero registrar un nuevo participante en el sistema para tener su información almacenada y disponible.

Criterios de aceptación

CA-01: El sistema permite ingresar nombre, documento, contacto y rol.
CA-02: El sistema guarda el registro y muestra confirmación.
CA-03: El sistema impide registrar un participante con documento ya existente.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/participantesBackendValidar campos obligatorios en el servidorBackendRetornar respuesta de éxito o errorBase de datosCrear tabla participante con sus columnas y restriccionesBase de datosDefinir índice único sobre número de documentoFrontendCrear formulario de registro con validacionesFrontendMostrar mensaje de confirmación o error según respuestaQACP-A01: Registrar participante con datos completosQACP-A02: Intentar duplicar documento
Notas técnicas

Si se usa ORM, crear el modelo Participante y modificar el controlador.
Validar formato del teléfono en frontend y backend.

Small: Sí, cubre un proceso compacto

Testable: Totalmente

HU-A02
Registro de instructores
CampoValorIDHU-A02ÉpicaGestión de PersonasRF cubiertoRF-001.1PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero registrar un instructor con sus datos y certificaciones para asignarlo a cursos del centro.

Criterios de aceptación

CA-01: El sistema permite ingresar datos personales y al menos una certificación vigente.
CA-02: El sistema guarda el registro y muestra confirmación.
CA-03: El sistema rechaza el registro si no se ingresa ninguna certificación.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/instructoresBackendValidar existencia de certificación vigenteBackendRetornar respuesta de éxito o errorBase de datosCrear tabla instructorBase de datosCrear tabla certificacion con relación a instructorBase de datosÍndice único sobre documento del instructorFrontendFormulario de registro con sección de certificacionesFrontendValidación de campos obligatoriosFrontendMensaje de confirmación o errorQACP-A03: Registrar instructor con certificaciónQACP-A04: Intentar registrar instructor sin certificación
Notas técnicas

Si se usa ORM, crear modelos Instructor y Certificacion.

HU-A03
Búsqueda de personas
CampoValorIDHU-A03ÉpicaGestión de PersonasRF cubiertoRF-001.2PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero buscar participantes o instructores por múltiples criterios para localizar rápidamente su información.

Criterios de aceptación

CA-01: El sistema permite buscar por nombre, documento y rol.
CA-02: Los resultados se muestran en menos de 3 segundos.
CA-03: Si no hay coincidencias, muestra mensaje informativo.

Tareas técnicas
CapaTareaBackendCrear endpoint GET /api/personas con parámetros de búsquedaBackendImplementar consulta con filtros dinámicosBackendPaginar resultadosBase de datosAgregar índices en campos de búsqueda frecuente (nombre, documento)FrontendBarra de búsqueda con filtros por criterioFrontendTabla de resultados paginadaFrontendMensaje cuando no hay resultadosQACP-A05: Buscar por nombre existenteQACP-A06: Buscar con criterio sin resultados
Notas técnicas

Evaluar uso de búsqueda full-text según motor de base de datos.

HU-A04
Actualización de datos de personas
CampoValorIDHU-A04ÉpicaGestión de PersonasRF cubiertoRF-001.3PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero editar los datos de un participante o instructor para corregir información incorrecta o desactualizada.

Criterios de aceptación

CA-01: El sistema permite modificar campos editables del registro.
CA-02: El sistema guarda los cambios y muestra confirmación.
CA-03: El sistema registra quién, cuándo y qué campo fue modificado.

Tareas técnicas
CapaTareaBackendCrear endpoint PUT /api/personas/:idBackendRegistrar log de auditoría con usuario, fecha y campos modificadosBackendValidar datos antes de actualizarBase de datosCrear tabla auditoria_personas: id_persona, campo, valor_anterior, valor_nuevo, usuario, fechaFrontendFormulario de edición prellenado con datos actualesFrontendConfirmación antes de guardarFrontendMostrar historial de cambiosQACP-A07: Editar nombre de un participanteQACP-A08: Verificar que el log registra el cambio
Notas técnicas

Solo usuarios con rol administrativo pueden editar.
Las modificaciones no deben requerir reingreso completo del formulario.
