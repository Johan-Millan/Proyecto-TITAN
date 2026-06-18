# HU-D01

## Consulta de certificados por participante

| Campo       | Valor                     |
| ----------- | ------------------------- |
| ID          | HU-D01                    |
| Épica       | Servicios al Participante |
| RF cubierto | RF-002.4                  |
| Prioridad   | Alta                      |
| Versión     | 1.0                       |

### Historia de usuario

Yo como participante quiero consultar mis certificados ingresando mi número de documento para verificar cuáles tengo disponibles.

### Criterios de aceptación

* CA-01: El sistema valida que el documento ingresado exista en el sistema.
* CA-02: El sistema muestra la lista de certificados asociados al participante.
* CA-03: Los certificados vencidos aparecen marcados como "Expirado".
* CA-04: Si no hay certificados, muestra un mensaje informativo.

### Tareas técnicas

| Capa          | Tarea                                                       |
| ------------- | ----------------------------------------------------------- |
| Backend       | Crear endpoint GET /api/certificados?documento=X            |
| Backend       | Validar existencia del documento                            |
| Backend       | Filtrar y retornar certificados con estado vigente/expirado |
| Base de datos | Agregar columna fecha_vencimiento en tabla certificado      |
| Frontend      | Campo de ingreso de documento                               |
| Frontend      | Botón "Consultar"                                           |
| Frontend      | Lista de tarjetas de certificados con estado                |
| Frontend      | Mensaje si no hay resultados                                |
| QA            | CP-D01: Consultar con documento válido y con certificados   |
| QA            | CP-D02: Consultar con documento válido sin certificados     |
| QA            | CP-D03: Consultar con documento inexistente                 |

### Notas técnicas

* El participante solo puede visualizar sus propios certificados mediante validación por documento.
* La interfaz debe ser responsiva para dispositivos móviles.

### Small

Sí, aborda una única funcionalidad de consulta de certificados.

### Testable

Totalmente.
# HU-D02

## Descarga de certificado en PDF

| Campo       | Valor                     |
| ----------- | ------------------------- |
| ID          | HU-D02                    |
| Épica       | Servicios al Participante |
| RF cubierto | RF-002.4                  |
| Prioridad   | Alta                      |
| Versión     | 1.0                       |

### Historia de usuario

Yo como participante quiero descargar mi certificado en PDF para tenerlo disponible o presentarlo donde se requiera.

### Criterios de aceptación

* CA-01: El sistema permite descargar únicamente certificados vigentes.
* CA-02: El archivo descargado es un PDF válido con los datos del participante.
* CA-03: Los certificados expirados no son descargables.

### Tareas técnicas

| Capa          | Tarea                                                                  |
| ------------- | ---------------------------------------------------------------------- |
| Backend       | Crear endpoint GET /api/certificados/:id/pdf                           |
| Backend       | Validar que el certificado pertenece al participante solicitante       |
| Backend       | Servir archivo PDF desde almacenamiento                                |
| Base de datos | Verificar ruta de almacenamiento del PDF en tabla certificado          |
| Frontend      | Botón "Descargar PDF" en cada certificado vigente                      |
| Frontend      | Deshabilitar botón para certificados expirados                         |
| Frontend      | Mostrar indicador de carga durante la descarga                         |
| QA            | CP-D04: Descargar certificado vigente                                  |
| QA            | CP-D05: Verificar que certificado expirado no tiene opción de descarga |

### Notas técnicas

* El renderizado del PDF se realiza en el backend.
* Considerar el uso de caché para certificados PDF previamente generados.

### Small

Sí, se enfoca únicamente en la descarga de certificados.

### Testable

Totalmente.
