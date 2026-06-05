HU-C01
Generación de reporte diario
CampoValorIDHU-C01ÉpicaReportes y CumplimientoRF cubiertoRF-002.1PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero generar un informe diario al cierre de jornada para tener un resumen de las actividades del día.

Criterios de aceptación

CA-01: El sistema genera el reporte con datos del día en curso.
CA-02: El reporte queda almacenado en el repositorio de informes.
CA-03: El reporte no puede modificarse manualmente una vez generado.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/reportes/diarioBackendImplementar CronJob para ejecución automática al cierre de jornadaBackendBloquear edición del reporte tras generarseBase de datosCrear tabla reporte: id, tipo, fecha, contenido_json, generado_por, fecha_creacionFrontendBotón "Generar reporte diario" en panel de reportesFrontendLista cronológica de reportes generadosQACP-C01: Generar reporte diario manualmenteQACP-C02: Verificar que el reporte queda bloqueado para edición
Notas técnicas
CronJob en horario configurable. Evaluar uso de node-cron o equivalente según stack.

HU-C02
Consolidación de cierre mensual
CampoValorIDHU-C02ÉpicaReportes y CumplimientoRF cubiertoRF-002.2PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero ejecutar el cierre de mes para consolidar automáticamente la información de participantes aprobados en el período.

Criterios de aceptación

CA-01: El sistema consolida todos los participantes aprobados del mes.
CA-02: El proceso omite participantes con datos incompletos y notifica cuáles fueron omitidos.
CA-03: El consolidado queda archivado en el repositorio mensual.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/reportes/cierre-mesBackendLógica de consolidación: filtrar aprobados con datos completosBackendGenerar registro del consolidado mensualBase de datosCrear tabla consolidado_mensual con referencia a participantes incluidosFrontendBotón "Ejecutar cierre de mes"FrontendResultado con lista de incluidos y excluidosFrontendConfirmación antes de ejecutar (usar HU-T02)QACP-C03: Ejecutar cierre con participantes completos e incompletosQACP-C04: Verificar que incompletos aparecen en lista de omitidos
Notas técnicas

La BD debe estar optimizada para consultas masivas en el cierre mensual.

HU-C02
Consolidación de cierre mensual
CampoValorIDHU-C02ÉpicaReportes y CumplimientoRF cubiertoRF-002.2PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero ejecutar el cierre de mes para consolidar automáticamente la información de participantes aprobados en el período.

Criterios de aceptación

CA-01: El sistema consolida todos los participantes aprobados del mes.
CA-02: El proceso omite participantes con datos incompletos y notifica cuáles fueron omitidos.
CA-03: El consolidado queda archivado en el repositorio mensual.

Tareas técnicas
CapaTareaBackendCrear endpoint POST /api/reportes/cierre-mesBackendLógica de consolidación: filtrar aprobados con datos completosBackendGenerar registro del consolidado mensualBase de datosCrear tabla consolidado_mensual con referencia a participantes incluidosFrontendBotón "Ejecutar cierre de mes"FrontendResultado con lista de incluidos y excluidosFrontendConfirmación antes de ejecutar (usar HU-T02)QACP-C03: Ejecutar cierre con participantes completos e incompletosQACP-C04: Verificar que incompletos aparecen en lista de omitidos
Notas técnicas

La BD debe estar optimizada para consultas masivas en el cierre mensual.

HU-C03
Generación automática de certificados
CampoValorIDHU-C03ÉpicaReportes y CumplimientoRF cubiertoRF-002.3PrioridadAltaVersión1.0
Historia de usuario

Yo como personal administrativo quiero que el sistema genere certificados PDF automáticamente al ejecutar el cierre de mes para los participantes aprobados.

Criterios de aceptación

CA-01: El sistema genera un certificado PDF por cada participante aprobado con datos completos.
CA-02: Cada certificado tiene un número único e irrepetible.
CA-03: El sistema no genera certificado para participantes con datos incompletos y muestra un aviso.

Tareas técnicas
CapaTareaBackendCrear servicio de generación PDF (ej. PDFKit, Puppeteer)BackendAsignar numeración única a cada certificadoBackendArchivar PDF generado y registrar en BDBase de datosAgregar columna numero_certificado con restricción UNIQUE en tabla certificadoFrontendVista de certificados generados con opción de descargaFrontendAviso de participantes omitidos con motivoQACP-C05: Verificar generación de PDF con datos completosQACP-C06: Verificar que participante con datos incompletos no recibe certificado
Notas técnicas

Los certificados deben cumplir resolución 4272 del Ministerio de Trabajo.
Control de versiones de PDF generados recomendado.
