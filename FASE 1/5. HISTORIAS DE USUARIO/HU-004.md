### HU-D – Autoconsulta e impresión de certificados por participantes

Requisito cubierto: RF-002.4

==========================================
## 🔹 Metadatos

ID: HU-D

Epic: Servicios al Participante

Prioridad: Alta

Versión: 1.0
---
## 🔹 Historia de abducción

Como participante, quiero consultar e imprimir mi certificado de alturas, para tener acceso inmediato a mi comprobante sin depender del personal administrativo.

## 🔹 Descripción detallada

El sistema debe permitir:

Ingreso del documento o autenticación.

Validar identidad del participante.

Mostrar la lista de certificados disponibles.

Permitir descarga en PDF.

Permitir impresión directa.

## 🔹 Criterios de aceptación

CA-01: Validar identidad correctamente.

CA-02: Mostrar certificados asociados al participante.

CA-03: Permitir descarga en PDF.

CA-04: Permitir impresión desde el navegador.

Escenarios (Gherkin)
## ✔ Escenario 1 – Happy Path: Certificado descargado con éxito

Dado que el participante ingresa su documento
Cuando el sistema valida su identidad
Entonces muestra sus certificados disponibles
Y permite descargarlos en PDF.

## ✔ Escenario 2 – Flujo alternativo: No tiene certificados aún

Dado que el participante consulta
Cuando no tiene certificados generados
Entonces el sistema muestra “Aún no tienes certificados disponibles”.

## ✔ Escenario 3 – Manejo de errores: Documento inválido

Dado que el participante ingresa un documento no válido
Cuando intenta consultar
Entonces el sistema muestra el mensaje “Documento no encontrado”.

## Reglas de negocio

RN-01: Solo certificados vigentes son descargables.

RN-02: Certificados vencidos deben aparecer marcados como “Expirado”.

RN-03: El participante solo puede ver sus propios certificados.

## Definición de Terminado (DoD)

Validación de identidad implementada.

PDF descargable.

Módulo probado y aprobado.

Manual de usuario actualizado.

Seguridad validada.

## Notas Técnicas

Verificación de identidad basada en documento + fecha de nacimiento (opcional).

Renderizado PDF en backend.

Frontend responsivo.

## Wireframe (descriptivo)

Pantalla “Mis Certificados”:

Campo para ingresar documento.

Botón “Consultar”.

Lista con tarjetas de certificados.

Botón “Descargar PDF”.

## Tareas Técnicas

Endpoint para consulta de certificados.

Validar identidad.

Generar interfaz de listado.

Implementar descarga PDF.

Mensajes de error con UX clara.

## Casos de Prueba

CP-D01: Consultar certificado existente.

CP-D02: Intentar consulta con documento inválido.

CP-D03: Descargar certificado.

CP-D04: Participante sin certificados.

## Validación INVEST

Cumple completamente.
