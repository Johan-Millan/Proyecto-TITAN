# HU-C01

## Generación de reporte diario

| Campo       | Valor                   |
| ----------- | ----------------------- |
| ID          | HU-C01                  |
| Épica       | Reportes y Cumplimiento |
| RF cubierto | RF-002.1                |
| Prioridad   | Alta                    |
| Versión     | 1.0                     |

### Historia de usuario

Yo como personal administrativo quiero generar un informe diario al cierre de jornada para tener un resumen de las actividades del día.

### Criterios de aceptación

* CA-01: El sistema genera el reporte con datos del día en curso.
* CA-02: El reporte queda almacenado en el repositorio de informes.
* CA-03: El reporte no puede modificarse manualmente una vez generado.

### Tareas técnicas

| Capa          | Tarea                                                                              |
| ------------- | ---------------------------------------------------------------------------------- |
| Backend       | Crear endpoint POST /api/reportes/diario                                           |
| Backend       | Implementar CronJob para ejecución automática al cierre de jornada                 |
| Backend       | Bloquear edición del reporte tras generarse                                        |
| Base de datos | Crear tabla reporte: id, tipo, fecha, contenido_json, generado_por, fecha_creacion |
| Frontend      | Botón "Generar reporte diario" en panel de reportes                                |
| Frontend      | Lista cronológica de reportes generados                                            |
| QA            | CP-C01: Generar reporte diario manualmente                                         |
| QA            | CP-C02: Verificar que el reporte queda bloqueado para edición                      |

### Notas técnicas

* CronJob en horario configurable.
* Evaluar uso de node-cron o equivalente según stack.

### Small

Sí, cubre un proceso específico de generación y almacenamiento de reportes.

### Testable

Totalmente.
# HU-C02

## Consolidación de cierre mensual

| Campo       | Valor                   |
| ----------- | ----------------------- |
| ID          | HU-C02                  |
| Épica       | Reportes y Cumplimiento |
| RF cubierto | RF-002.2                |
| Prioridad   | Alta                    |
| Versión     | 1.0                     |

### Historia de usuario

Yo como personal administrativo quiero ejecutar el cierre de mes para consolidar automáticamente la información de participantes aprobados en el período.

### Criterios de aceptación

* CA-01: El sistema consolida todos los participantes aprobados del mes.
* CA-02: El proceso omite participantes con datos incompletos y notifica cuáles fueron omitidos.
* CA-03: El consolidado queda archivado en el repositorio mensual.

### Tareas técnicas

| Capa          | Tarea                                                                    |
| ------------- | ------------------------------------------------------------------------ |
| Backend       | Crear endpoint POST /api/reportes/cierre-mes                             |
| Backend       | Lógica de consolidación: filtrar aprobados con datos completos           |
| Backend       | Generar registro del consolidado mensual                                 |
| Base de datos | Crear tabla consolidado_mensual con referencia a participantes incluidos |
| Frontend      | Botón "Ejecutar cierre de mes"                                           |
| Frontend      | Resultado con lista de incluidos y excluidos                             |
| Frontend      | Confirmación antes de ejecutar (usar HU-T02)                             |
| QA            | CP-C03: Ejecutar cierre con participantes completos e incompletos        |
| QA            | CP-C04: Verificar que incompletos aparecen en lista de omitidos          |

### Notas técnicas

* La base de datos debe estar optimizada para consultas masivas durante el cierre mensual.

### Small

Sí, se enfoca en una única funcionalidad de consolidación mensual.

### Testable

Totalmente.
# HU-C03

## Generación automática de certificados

| Campo       | Valor                   |
| ----------- | ----------------------- |
| ID          | HU-C03                  |
| Épica       | Reportes y Cumplimiento |
| RF cubierto | RF-002.3                |
| Prioridad   | Alta                    |
| Versión     | 1.0                     |

### Historia de usuario

Yo como personal administrativo quiero que el sistema genere certificados PDF automáticamente al ejecutar el cierre de mes para los participantes aprobados.

### Criterios de aceptación

* CA-01: El sistema genera un certificado PDF por cada participante aprobado con datos completos.
* CA-02: Cada certificado tiene un número único e irrepetible.
* CA-03: El sistema no genera certificado para participantes con datos incompletos y muestra un aviso.

### Tareas técnicas

| Capa          | Tarea                                                                          |
| ------------- | ------------------------------------------------------------------------------ |
| Backend       | Crear servicio de generación PDF (ej. PDFKit, Puppeteer)                       |
| Backend       | Asignar numeración única a cada certificado                                    |
| Backend       | Archivar PDF generado y registrar en base de datos                             |
| Base de datos | Agregar columna numero_certificado con restricción UNIQUE en tabla certificado |
| Frontend      | Vista de certificados generados con opción de descarga                         |
| Frontend      | Aviso de participantes omitidos con motivo                                     |
| QA            | CP-C05: Verificar generación de PDF con datos completos                        |
| QA            | CP-C06: Verificar que participante con datos incompletos no recibe certificado |

### Notas técnicas

* Los certificados deben cumplir la Resolución 4272 del Ministerio de Trabajo.
* Se recomienda implementar control de versiones de los PDF generados.

### Small

Sí, se centra en la generación automática de certificados.

### Testable

Totalmente.
