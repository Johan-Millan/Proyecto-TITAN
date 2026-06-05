### HU-B – Registro y Gestión de Incidentes

Requisito cubierto: RF-001.4

==========================================
## 🔹 Metadatos

ID: HU-B

Epic: Seguridad y Control

Prioridad: Alta

Versión: 1.0
---
## 🔹 Historia de abducción

Como personal administrativo, quiero registrar y gestionar incidentes ocurridos en el centro de entrenamiento, para mantener un control formal, ordenado y rastreable de los eventos que afectan la seguridad.

## 🔹 Descripción detallada

El sistema permitirá:

Registrar incidente con datos obligatorios (fecha, descripción, responsables, gravedad).

Adjuntar evidencia (imágenes, PDFs).

Editar detalles del incidente.

Cambiar estado (abierto / en seguimiento / cerrado).

Consultar historial completo del incidente para auditoría.

## 🔹 Criterios de aceptación

CA-01: Debe registrar incidentes con campos obligatorios.

CA-02: Permitir adjuntar archivos como evidencia.

CA-03: Permitir editar y actualizar datos del incidente.

CA-04: Mantener historial de cambios y estados.

CA-05: Permitir búsqueda y filtrado por tipo, fecha, gravedad y estado.

Escenarios (Gherkin)
## ✔ Escenario 1 – Happy Path: Registro exitoso de incidente

Dado que el administrativo está en el formulario de incidentes
Cuando ingresa todos los datos obligatorios y guarda
Entonces el sistema registra el incidente
Y muestra el mensaje “Incidente registrado exitosamente”.

## ✔ Escenario 2 – Flujo alternativo: Registro sin evidencia

Dado que el administrativo registra un incidente
Cuando no adjunta ninguna evidencia
Entonces el sistema registra igualmente el incidente
Y permite adjuntar evidencia más adelante.

## ✔ Escenario 3 – Manejo de errores: Archivo de evidencia no válido

Dado que el usuario intenta subir un archivo corrupto o no permitido
Cuando adjunta la evidencia
Entonces el sistema rechaza el archivo
Y muestra el mensaje “Formato o tamaño de archivo no permitido”.

## Reglas de negocio

RN-01: Todo incidente debe tener un estado.

RN-02: Solo usuarios autorizados pueden cerrar incidentes.

RN-03: Debe existir trazabilidad completa del incidente.

RN-04: Los incidentes de gravedad alta generan notificación inmediata.

## Definición de Terminado (DoD)

Flujo completo implementado (crear/ver/editar/cerrar).

Pruebas unitarias > 80%.

Carga de archivos validada.

Documentación actualizada.

Revisión de UX aprobada.

Seguridad revisada y validada.

## Notas Técnicas

Manejo de archivos con almacenamiento seguro.

Validación antivirus al subir archivos.

Logs de auditoría.

API RESTful para gestión de incidentes.

## Wireframe (descriptivo)

Pantalla “Incidentes”:

Botón “Registrar Incidente”.

Tabla filtrable: fecha, gravedad, responsable, estado.

Detalle del incidente con pestaña “Evidencia”.

## Tareas Técnicas

Crear modelo de datos (incidente + evidencia).

Endpoints REST (POST, GET, PUT).

Componente de carga de archivos.

Vista de tabla + filtros.

Control de permisos según rol.

## Casos de Prueba

CP-B01: Registrar incidente con todos los datos.

CP-B02: Registrar incidente sin evidencia.

CP-B03: Subir archivo no permitido (error).

CP-B04: Cambiar estado del incidente.

## Validación INVEST

Cumple con todos los criterios: Independiente, negociable, valiosa, estimable, pequeña y testeable.
