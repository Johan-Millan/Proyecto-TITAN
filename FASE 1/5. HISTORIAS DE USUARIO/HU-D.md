HU-D01
Consulta de certificados por participante
CampoValorIDHU-D01ÉpicaServicios al ParticipanteRF cubiertoRF-002.4PrioridadAltaVersión1.0
Historia de usuario

Yo como participante quiero consultar mis certificados ingresando mi número de documento para verificar cuáles tengo disponibles.

Criterios de aceptación

CA-01: El sistema valida que el documento ingresado exista en el sistema.
CA-02: El sistema muestra la lista de certificados asociados al participante.
CA-03: Los certificados vencidos aparecen marcados como "Expirado".
CA-04: Si no hay certificados, muestra mensaje informativo.

Tareas técnicas
CapaTareaBackendCrear endpoint GET /api/certificados?documento=XBackendValidar existencia del documentoBackendFiltrar y retornar certificados con estado vigente/expiradoBase de datosAgregar columna fecha_vencimiento en tabla certificadoFrontendCampo de ingreso de documentoFrontendBotón ConsultarFrontendLista de tarjetas de certificados con estadoFrontendMensaje si no hay resultadosQACP-D01: Consultar con documento válido y con certificadosQACP-D02: Consultar con documento válido sin certificadosQACP-D03: Consultar con documento inexistente
Notas técnicas

El participante solo puede ver sus propios certificados (validar por documento).
Interfaz responsiva para acceso desde móvil.

HU-D02
Descarga de certificado en PDF
CampoValorIDHU-D02ÉpicaServicios al ParticipanteRF cubiertoRF-002.4PrioridadAltaVersión1.0
Historia de usuario

Yo como participante quiero descargar mi certificado en PDF para tenerlo disponible o presentarlo donde se requiera.

Criterios de aceptación

CA-01: El sistema permite descargar solo certificados vigentes.
CA-02: El archivo descargado es un PDF válido con los datos del participante.
CA-03: Los certificados expirados no son descargables.

Tareas técnicas
CapaTareaBackendCrear endpoint GET /api/certificados/:id/pdfBackendValidar que el certificado pertenece al participante solicitanteBackendServir archivo PDF desde almacenamientoBase de datosVerificar ruta de almacenamiento del PDF en tabla certificadoFrontendBotón "Descargar PDF" en cada tarjeta de certificado vigenteFrontendDeshabilitar botón para certificados expiradosFrontendIndicador de carga durante la descargaQACP-D04: Descargar certificado vigenteQACP-D05: Verificar que certificado expirado no tiene opción de descarga
Notas técnicas

Renderizado PDF en backend. Considerar caché para PDFs ya generados.

