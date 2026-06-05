# HU-G01

## Registro de equipos de seguridad

| Campo       | Valor                 |
| ----------- | --------------------- |
| ID          | HU-G01                |
| Épica       | Seguridad Operacional |
| RF cubierto | RF-003.5              |
| Prioridad   | Alta                  |
| Versión     | 1.0                   |

### Historia de usuario

Yo como personal administrativo quiero registrar un equipo de seguridad con su código único para tener un inventario actualizado de los elementos del centro.

### Criterios de aceptación

* CA-01: Cada equipo tiene un código único asignado al momento del registro.
* CA-02: El sistema permite registrar tipo, marca, fecha de adquisición y estado inicial.
* CA-03: El sistema rechaza registros con código duplicado.

### Tareas técnicas

| Capa          | Tarea                                                                           |
| ------------- | ------------------------------------------------------------------------------- |
| Backend       | Crear endpoint POST /api/equipos                                                |
| Backend       | Validar unicidad del código de equipo                                           |
| Backend       | Retornar equipo creado con su ID                                                |
| Base de datos | Crear tabla equipo: id, codigo (UNIQUE), tipo, marca, fecha_adquisicion, estado |
| Frontend      | Formulario de registro de equipo                                                |
| Frontend      | Tabla de inventario con equipos registrados                                     |
| Frontend      | Mensaje de error en caso de código duplicado                                    |
| QA            | CP-G01: Registrar equipo con código nuevo                                       |
| QA            | CP-G02: Intentar registrar con código ya existente                              |

### Notas técnicas

* El código puede ser generado automáticamente o ingresado manualmente según la política del centro.
* Debe mantenerse la unicidad del código mediante restricciones en la base de datos.

### Small

Sí, se enfoca únicamente en el registro de equipos de seguridad.

### Testable

Totalmente.
# HU-G02

## Registro de inspección de equipos

| Campo       | Valor                 |
| ----------- | --------------------- |
| ID          | HU-G02                |
| Épica       | Seguridad Operacional |
| RF cubierto | RF-005.3              |
| Prioridad   | Alta                  |
| Versión     | 1.0                   |

### Historia de usuario

Yo como inspector quiero registrar el resultado de una inspección de un equipo para mantener el historial de su estado operativo.

### Criterios de aceptación

* CA-01: El sistema permite registrar resultado (Apto / No apto), observaciones e inspector responsable.
* CA-02: El estado del equipo se actualiza automáticamente según el resultado.
* CA-03: Cada inspección queda registrada en el historial del equipo.

### Tareas técnicas

| Capa          | Tarea                                                                                |
| ------------- | ------------------------------------------------------------------------------------ |
| Backend       | Crear endpoint POST /api/equipos/:id/inspecciones                                    |
| Backend       | Actualizar estado del equipo según resultado de inspección                           |
| Backend       | Registrar inspector responsable obligatoriamente                                     |
| Base de datos | Crear tabla inspeccion: id, equipo_id, resultado, observaciones, inspector_id, fecha |
| Frontend      | Formulario de inspección en vista de detalle del equipo                              |
| Frontend      | Historial de inspecciones con fecha y resultado                                      |
| Frontend      | Indicador de estado actual del equipo                                                |
| QA            | CP-G03: Registrar inspección con resultado Apto                                      |
| QA            | CP-G04: Registrar inspección con resultado No apto y verificar cambio de estado      |

### Notas técnicas

* Toda inspección debe estar asociada a un inspector responsable identificado.
* El historial de inspecciones debe mantenerse para fines de auditoría y trazabilidad.

### Small

Sí, se enfoca exclusivamente en el registro y seguimiento de inspecciones.

### Testable

Totalmente.
# HU-G03

## Generación de certificado de aptitud de equipo

| Campo       | Valor                 |
| ----------- | --------------------- |
| ID          | HU-G03                |
| Épica       | Seguridad Operacional |
| RF cubierto | RF-005.4              |
| Prioridad   | Alta                  |
| Versión     | 1.0                   |

### Historia de usuario

Yo como personal administrativo quiero generar el certificado de aptitud de un equipo inspeccionado para tener constancia oficial de su estado.

### Criterios de aceptación

* CA-01: Solo se puede generar un certificado para equipos con inspección vigente y estado Apto.
* CA-02: El certificado se genera en formato PDF y puede descargarse.
* CA-03: El certificado posee una vigencia definida y queda registrado en el sistema.

### Tareas técnicas

| Capa          | Tarea                                                                                                    |
| ------------- | -------------------------------------------------------------------------------------------------------- |
| Backend       | Crear endpoint POST /api/equipos/:id/certificado                                                         |
| Backend       | Validar que el equipo tenga una inspección vigente con resultado Apto                                    |
| Backend       | Generar PDF del certificado con información del equipo e inspector                                       |
| Base de datos | Crear tabla certificado_equipo: id, equipo_id, inspeccion_id, fecha_emision, fecha_vencimiento, pdf_ruta |
| Frontend      | Botón "Generar certificado" visible únicamente para equipos Aptos                                        |
| Frontend      | Descarga directa del PDF generado                                                                        |
| QA            | CP-G05: Generar certificado para equipo Apto                                                             |
| QA            | CP-G06: Verificar que equipo No apto no tiene opción de certificado                                      |

### Notas técnicas

* La vigencia de los certificados debe ser configurable (por ejemplo, 1 año).
* El PDF generado debe almacenarse y mantenerse disponible para futuras consultas.
* Solo se permitirá la generación cuando exista una inspección vigente y aprobada.

### Small

Sí, se enfoca exclusivamente en la emisión de certificados de aptitud para equipos.

### Testable

Totalmente.

