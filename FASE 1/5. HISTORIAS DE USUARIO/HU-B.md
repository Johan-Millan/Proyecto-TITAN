# Seguridad y Control

# HU-B01
## Registro de incidentes
| Campo | Valor | 
|------|-------|
| ID | HU-B01 | 
| Épica | Seguridad y Control |
| RF cubierto | RF-001.4 | 
| Prioridad | Alta | 
| Versión | 1.0 |

## Historia de usuario

Yo como personal administrativo quiero registrar un incidente ocurrido en el centro para mantener un control formal y rastreable del evento.

## Criterios de aceptación

- **CA-01:** El sistema permite ingresar fecha, descripción, responsable y nivel de gravedad.
- **CA-02:** El sistema asigna estado inicial "Abierto" al crear el incidente.
- **CA-03:** El sistema guarda el registro y muestra confirmación.

## Tareas técnicas
| Capa | Tarea |
|------|-------|
| Backend | Crear endpoint POST /api/incidentes |
| Backend | Asignar estado inicial automáticamente |
| Backend | Validar campos obligatorios |
| Base de datos | Crear tabla incidente: id, fecha, descripcion, gravedad, estado, responsable, usuario_registro
| Frontend | Formulario de registro de incidente |
| Frontend | Selector de gravedad y responsable |
| Frontend | Mensaje de confirmación |
| QA | CP-B01: Registrar incidente con todos los datos |
| QA | CP-B02: Intentar guardar sin campos obligatorios |

## Notas técnicas
Incidentes de gravedad alta deben generar notificación (ver HU-T01).

---

# HU-B02
## Adjuntar evidencia a incidente
| Campo | Valor |
|------|-------|
| ID | HU-B02 | 
| Épica | Seguridad y Control | 
| RF cubierto | RF-001.4 | 
| Prioridad | Alta | 
| Versión | 1.0 |

## Historia de usuario

Yo como personal administrativo quiero adjuntar archivos de evidencia a un incidente registrado para respaldar la información con documentos o imágenes.

## Criterios de aceptación

- **CA-01:** El sistema permite subir imágenes y PDF como evidencia.
- **CA-02:** El sistema rechaza formatos o tamaños no permitidos con mensaje de error.
- **CA-03:** La evidencia queda asociada al incidente y puede consultarse después.

## Tareas técnicas
| Capa | Tarea | 
|------|-------|
| Backend | Crear endpoint POST /api/incidentes/:id/evidencia | 
| Backend | Validar tipo y tamaño de archivo | 
| Backend | Almacenar archivo de forma segura | 
| Base de datos | Crear tabla evidencia: id, id_incidente, ruta_archivo, tipo, fecha_subida | 
| Frontend | Componente de carga de archivos (drag & drop) |
| Frontend | Validación de tipo y tamaño en cliente | 
| Frontend | Mostrar listado de evidencias adjuntas | 
| QA | CP-B03: Subir PDF válido como evidencia | 
| QA | CP-B04: Intentar subir archivo con formato no permitido | 

## Notas técnicas

- **Tamaño máximo recomendado:**  5 MB por archivo.
- Validación antivirus en backend si el entorno lo permite.

---

# HU-B03

## Cambio de estado de incidente
| Campo | Valor | 
|------|-------|
| ID | HU-B03 | 
| Épica | Seguridad y Control | 
| RF cubierto |RF-001.4 | 
| Prioridad | Alta | 
| Versión | 1.0 |

## Historia de usuario

Yo como personal administrativo quiero cambiar el estado de un incidente para reflejar su avance dentro del proceso de seguimiento.

## Criterios de aceptación

- **CA-01:** El sistema permite cambiar el estado entre: Abierto, En seguimiento, Cerrado.
- **CA-02:** Solo usuarios autorizados pueden cerrar un incidente.
- **CA-03:** El sistema registra cada cambio de estado con fecha y usuario.

## Tareas técnicas
| Capa | Tarea | 
|------|-------|
| Backend | Crear endpoint PATCH /api/incidentes/:id/estado | 
| Backend | Validar permisos según rol para cierre | 
| Backend| Registrar cambio en log de auditoría | 
| Base de datos | Crear tabla historial_incidente: id, id_incidente, estado_anterior, estado_nuevo, usuario, fecha | 
| Frontend | Selector de estado en vista de detalle del incidente | 
| Frontend | Confirmación antes de cerrar | 
| Frontend | Mostrar historial de estados | 
| QA | CP-B05: Cambiar estado a En seguimiento | 
| QA | CP-B06: Intentar cerrar incidente sin permisos |  

## Notas técnicas

Flujo de estados permitido: Abierto → En seguimiento → Cerrado únicamente.
