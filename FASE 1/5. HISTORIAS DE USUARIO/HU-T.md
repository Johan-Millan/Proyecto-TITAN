#Transversal

HU-T01
Componente de mensajes de confirmación y error
CampoValorIDHU-T01ÉpicaTransversalRF cubiertoTodos los módulosPrioridadAltaVersión1.0
Historia de usuario

Yo como usuario del sistema quiero ver mensajes claros de éxito o error después de cada operación para saber si la acción fue completada correctamente.

Criterios de aceptación

CA-01: El sistema muestra mensaje de éxito en verde al completar una operación.
CA-02: El sistema muestra mensaje de error en rojo con descripción del problema.
CA-03: Los mensajes desaparecen automáticamente o tienen botón de cierre.

Tareas técnicas
CapaTareaFrontendCrear componente reutilizable Toast/Alert (éxito, error, advertencia, info)FrontendIntegrar componente en todos los formularios del sistemaFrontendConfigurar tiempo de auto-cierreQACP-T01: Verificar que Toast de éxito aparece tras operación exitosaQACP-T02: Verificar que Toast de error aparece con mensaje descriptivo
Notas técnicas

Componente debe ser accesible (rol alert para lectores de pantalla).
Un solo componente reutilizable para toda la app, no duplicar por módulo.

HU-T02
Componente de modal de confirmación
CampoValorIDHU-T02ÉpicaTransversalRF cubiertoTodos los módulosPrioridadMediaVersión1.0
Historia de usuario

Yo como usuario quiero que el sistema me pida confirmación antes de ejecutar acciones destructivas o irreversibles para evitar errores accidentales.

Criterios de aceptación

CA-01: El modal muestra mensaje descriptivo de la acción a confirmar.
CA-02: El modal tiene botones Confirmar y Cancelar.
CA-03: Al cancelar, no se ejecuta ninguna acción.

Tareas técnicas
CapaTareaFrontendCrear componente Modal de confirmación reutilizableFrontendRecibir mensaje y callbacks por props/parámetrosFrontendIntegrar en: eliminaciones, cierre de mes, cambio de estado de incidente, cierre de calificacionesQACP-T03: Abrir modal y confirmar acciónQACP-T04: Abrir modal y cancelar, verificar que nada cambia
Notas técnicas

Un solo componente reutilizable para toda la app, no duplicar por módulo.
