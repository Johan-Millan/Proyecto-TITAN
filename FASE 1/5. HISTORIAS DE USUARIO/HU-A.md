# HU-A01
## Registro de participantes
| Campo | Valor | 
|-------|-------|
| ID | HU-A01 |
| Épica | Gestión de Personas | 
| RF cubierto | RF-001.1 |
| Prioridad | Alta | 
| Versión | 1.0 |

## Historia de usuario

Yo como personal administrativo quiero registrar un nuevo participante en el sistema para tener su información almacenada y disponible.

## Criterios de aceptación

- **CA-01:** El sistema permite ingresar nombre, documento, contacto y rol.
- **CA-02:** El sistema guarda el registro y muestra confirmación.
- **CA-03:** El sistema impide registrar un participante con documento ya existente.

## Tareas técnicas
| Capa | Tarea |
|------|-------|
| Backend| Crear endpoint POST /api/participantes |
| Backend | Validar campos obligatorios en el servidor |
| Backend | Retornar respuesta de éxito o error |
| Base de datos | Crear tabla participante con sus columnas y restricciones |
| Base de datos | Definir índice único sobre número de documento |
| Frontend | Crear formulario de registro con validaciones |
| Frontend | Mostrar mensaje de confirmación o error según respuesta | 
| QA | CP-A01: Registrar participante con datos completos | 
| QA | CP-A02: Intentar duplicar documento|

## Notas técnicas

- Si se usa ORM, crear el modelo Participante y modificar el controlador.
- Validar formato del teléfono en frontend y backend.

**Small:** Sí, cubre un proceso compacto

**Testable:** Totalmente

---

# HU-A02
## Registro de instructores
| Campo | Valor |
|------|-------|
| ID | HU-A02 |
| Épica | Gestión de Personas |
| RF cubierto | RF-001.1 |
| Prioridad | Alta | 
| Versión | 1.0 |

## Historia de usuario

Yo como personal administrativo quiero registrar un instructor con sus datos y certificaciones para asignarlo a cursos del centro.

## Criterios de aceptación

- **CA-01:** El sistema permite ingresar datos personales y al menos una certificación vigente.
- **CA-02:** El sistema guarda el registro y muestra confirmación.
- **CA-03:** El sistema rechaza el registro si no se ingresa ninguna certificación.

## Tareas técnicas
| Capa | Tarea |
|------|-------|
| Backend | Crear endpoint POST /api/instructores | 
| Backend |  Validar existencia de certificación vigente | 
| Backend |Retornar respuesta de éxito o error | 
| Base de datos | Crear tabla instructor | 
| Base de datos | Crear tabla certificacion con relación a instructor | 
| Base de datos | Índice único sobre documento del instructor | 
| Frontend | Formulario de registro con sección de certificaciones | 
| Frontend | Validación de campos obligatorios | 
| Frontend | Mensaje de confirmación o error | 
| QA | CP-A03: Registrar instructor con certificación | 
| QA | CP-A04: Intentar registrar instructor sin certificación | 

## Notas técnicas

Si se usa ORM, crear modelos Instructor y Certificacion.

---

# HU-A03
## Búsqueda de personas
| Campo | Valor| 
|------|-------|
| ID | HU-A03 | 
| Épica | Gestión de Personas| 
| RF cubierto| RF-001.2| 
| Prioridad | Alta| 
| Versión | 1.0 |

## Historia de usuario

Yo como personal administrativo quiero buscar participantes o instructores por múltiples criterios para localizar rápidamente su información.

## Criterios de aceptación

- **CA-01:** El sistema permite buscar por nombre, documento y rol.
- **CA-02:** Los resultados se muestran en menos de 3 segundos.
- **CA-03:** Si no hay coincidencias, muestra mensaje informativo.

## Tareas técnicas
| Capa | Tarea | 
|------|-------|
| Backend | Crear endpoint GET /api/personas con parámetros de búsqueda | 
| Backend | Implementar consulta con filtros dinámicos | 
| Backend | Paginar resultados | 
| Base de datos | Agregar índices en campos de búsqueda frecuente (nombre, documento) |
| Frontend | Barra de búsqueda con filtros por criterio |
| Frontend | Tabla de resultados paginada | 
| Frontend | Mensaje cuando no hay resultados | 
| QA | CP-A05: Buscar por nombre existente | 
| QA | CP-A06: Buscar con criterio sin resultados |

## Notas técnicas

Evaluar uso de búsqueda full-text según motor de base de datos.

---

# HU-A04
## Actualización de datos de personas
| Campo | Valor | 
|------|-------|
| ID | HU-A04 | 
| Épica | Gestión de Personas | 
| RF cubierto | RF-001.3 | 
| Prioridad | Alta | 
| Versión | 1.0 |

## Historia de usuario

Yo como personal administrativo quiero editar los datos de un participante o instructor para corregir información incorrecta o desactualizada.

## Criterios de aceptación

- **CA-01:** El sistema permite modificar campos editables del registro.
- **CA-02:** El sistema guarda los cambios y muestra confirmación.
- **CA-03:**  El sistema registra quién, cuándo y qué campo fue modificado.

## Tareas técnicas
| Capa | Tarea | 
|------|-------|
| Backend | Crear endpoint PUT /api/personas/:id | 
| Backend | Registrar log de auditoría con usuario, fecha y campos modificados | 
| Backend| Validar datos antes de actualizar| 
| Base de datos | Crear tabla auditoria_personas: id_persona, campo, valor_anterior, valor_nuevo, usuario, fecha | 
| Frontend | Formulario de edición prellenado con datos actuales | 
| Frontend | Confirmación antes de guardar | 
| Frontend | Mostrar historial de cambios | 
| QA | CP-A07: Editar nombre de un participante | 
| QA | CP-A08: Verificar que el log registra el cambio |

## Notas técnicas

- Solo usuarios con rol administrativo pueden editar.
- Las modificaciones no deben requerir reingreso completo del formulario.
