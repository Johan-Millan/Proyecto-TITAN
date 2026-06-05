# HU-T01

## Componente de mensajes de confirmación y error

| Campo       | Valor             |
| ----------- | ----------------- |
| ID          | HU-T01            |
| Épica       | Transversal       |
| RF cubierto | Todos los módulos |
| Prioridad   | Alta              |
| Versión     | 1.0               |

### Historia de usuario

Yo como usuario del sistema quiero ver mensajes claros de éxito o error después de cada operación para saber si la acción fue completada correctamente.

### Criterios de aceptación

* CA-01: El sistema muestra un mensaje de éxito en color verde al completar una operación correctamente.
* CA-02: El sistema muestra un mensaje de error en color rojo con una descripción clara del problema.
* CA-03: Los mensajes desaparecen automáticamente después de un tiempo o pueden cerrarse manualmente.

### Tareas técnicas

| Capa     | Tarea                                                                               |
| -------- | ----------------------------------------------------------------------------------- |
| Frontend | Crear componente reutilizable Toast/Alert (éxito, error, advertencia e información) |
| Frontend | Integrar el componente en todos los formularios y procesos del sistema              |
| Frontend | Configurar tiempo de auto-cierre y opción de cierre manual                          |
| QA       | CP-T01: Verificar que el Toast de éxito aparece tras una operación exitosa          |
| QA       | CP-T02: Verificar que el Toast de error aparece con un mensaje descriptivo          |

### Notas técnicas

* El componente debe cumplir criterios de accesibilidad utilizando el rol **alert** para lectores de pantalla.
* Debe existir un único componente reutilizable para toda la aplicación.
* Evitar implementaciones duplicadas en módulos específicos.

### Small

Sí, se centra en un único componente transversal reutilizable.

### Testable

Totalmente.
# HU-T02

## Componente de modal de confirmación

| Campo       | Valor             |
| ----------- | ----------------- |
| ID          | HU-T02            |
| Épica       | Transversal       |
| RF cubierto | Todos los módulos |
| Prioridad   | Media             |
| Versión     | 1.0               |

### Historia de usuario

Yo como usuario quiero que el sistema me solicite confirmación antes de ejecutar acciones destructivas o irreversibles para evitar errores accidentales.

### Criterios de aceptación

* CA-01: El modal muestra un mensaje descriptivo de la acción que se va a ejecutar.
* CA-02: El modal dispone de los botones "Confirmar" y "Cancelar".
* CA-03: Si el usuario cancela, la acción no se ejecuta y el sistema mantiene su estado actual.

### Tareas técnicas

| Capa     | Tarea                                                                                                        |
| -------- | ------------------------------------------------------------------------------------------------------------ |
| Frontend | Crear componente reutilizable de modal de confirmación                                                       |
| Frontend | Permitir recibir mensajes y funciones de confirmación/cancelación mediante props o parámetros                |
| Frontend | Integrar el modal en eliminaciones, cierre de mes, cambio de estado de incidentes y cierre de calificaciones |
| QA       | CP-T03: Abrir modal y confirmar la acción                                                                    |
| QA       | CP-T04: Abrir modal y cancelar, verificando que no se realiza ningún cambio                                  |

### Notas técnicas

* Debe existir un único componente reutilizable para toda la aplicación.
* El componente debe ser configurable para distintos escenarios sin duplicar código.
* Se recomienda mantener consistencia visual y de comportamiento en todos los módulos.

### Small

Sí, aborda una única funcionalidad transversal de confirmación de acciones.

### Testable

Totalmente.

