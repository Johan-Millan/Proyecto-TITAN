# Seguridad Operacional
HU-G01
Registro de equipos de seguridad
CampoValorIDHU-G01ÉpicaSeguridad OperacionalRF cubiertoRF-003.5PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero registrar un equipo de seguridad con su código único para tener un inventario actualizado de los elementos del centro.

Criterios de aceptación

CA-01: Cada equipo tiene un código único asignado al momento del registro.
CA-02: El sistema permite registrar tipo, marca, fecha de adquisición y estado inicial.
CA-03: El sistema rechaza registros con código duplicado.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/equiposBackendValidar unicidad del código de equipoBackendRetornar equipo creado con su IDBase de datosCrear tabla equipo: id, codigo (UNIQUE), tipo, marca, fecha_adquisicion, estadoFrontendFormulario de registro de equipoFrontendTabla de inventario con equipos registradosFrontendMensaje de error en código duplicadoQACP-G01: Registrar equipo con código nuevoQACP-G02: Intentar registrar con código ya existente
Notas técnicas

El código puede ser generado automáticamente o ingresado manualmente según política del centro.

HU-G02
Registro de inspección de equipos
CampoValorIDHU-G02ÉpicaSeguridad OperacionalRF cubiertoRF-005.3PrioridadAltaVersión1.0
Historia de usuario

Yo como inspector quiero registrar el resultado de una inspección de un equipo para mantener el historial de su estado operativo.

Criterios de aceptación

CA-01: El sistema permite registrar resultado (Apto / No apto), observaciones e inspector responsable.
CA-02: El estado del equipo se actualiza automáticamente según el resultado.
CA-03: Cada inspección queda en el historial del equipo.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/equipos/:id/inspeccionesBackendActualizar estado del equipo según resultado de inspecciónBackendRegistrar inspector responsable obligatoriamenteBase de datosCrear tabla inspeccion: id, equipo_id, resultado, observaciones, inspector_id, fechaFrontendFormulario de inspección en vista de detalle del equipoFrontendHistorial de inspecciones con fecha y resultadoFrontendIndicador de estado actual del equipoQACP-G03: Registrar inspección con resultado AptoQACP-G04: Registrar inspección con resultado No apto y verificar cambio de estado

Notas técnicas
Toda inspección requiere inspector responsable identificado (RN).

HU-G03
Generación de certificado de aptitud de equipo
CampoValorIDHU-G03ÉpicaSeguridad OperacionalRF cubiertoRF-005.4PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero generar el certificado de aptitud de un equipo inspeccionado para tener constancia oficial de su estado.

Criterios de aceptación

CA-01: Solo se puede generar certificado para equipos con inspección vigente en estado Apto.
CA-02: El certificado se genera en PDF y es descargable.
CA-03: El certificado tiene vigencia definida y queda registrado en el sistema.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/equipos/:id/certificadoBackendValidar que el equipo tiene inspección vigente AptoBackendGenerar PDF del certificado con datos del equipo e inspectorBase de datosCrear tabla certificado_equipo: id, equipo_id, inspeccion_id, fecha_emision, fecha_vencimiento, pdf_rutaFrontendBotón "Generar certificado" visible solo si equipo está AptoFrontendDescarga directa del PDF generadoQACP-G05: Generar certificado para equipo AptoQACP-G06: Verificar que equipo No apto no tiene opción de certificado
Notas técnicas

Los certificados de equipo deben tener vigencia configurable (ej. 1 año).
