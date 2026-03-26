#  TITAN - Sistema Integrado de Gestión para Entrenamiento en Alturas

##  Descripción del Proyecto

**TITAN** será un sistema de información diseñado para centralizar, automatizar y asegurar la trazabilidad de los procesos académicos y administrativos de un centro de entrenamiento para tareas de alto riesgo.

El sistema debe resuelver la dispersión de información y los procesos manuales, ofreciendo una plataforma robusta que garantiza el **cumplimiento normativo**, facilita las **auditorías anuales** (Ministerio de Trabajo) y agiliza la **emisión y verificación pública de certificados**.

---

## Características y Módulos Principales

* **Gestión B2B y Usuarios:** Arquitectura de datos separada para Actores del Sistema (Administradores, Instructores, Empresas) y Entidades Operativas (Trabajadores/Aprendices).
* **Control Académico:** Programación de cursos, gestión de cupos, toma de asistencia en pista y carga de calificaciones.
* **Auditoría y Gestión Documental:** Repositorio digital para hojas de vida, exámenes médicos (con alertas de vencimiento) e inspección de equipos de protección contra caídas (arneses, líneas de vida).
* **Certificación:** Generación automática de certificados y un portal público de verificación (sin login) para validación en tiempo real por parte de auditores o empleadores.
* **Facturación:** Emisión de cobros corporativos a empresas cliente y control de pagos.

---

## 🏛️ Arquitectura y Tecnologías

El proyecto está construido bajo una **Arquitectura Cliente-Servidor (Monolítica Modular)** implementando el patrón **MVC** a través de una **API REST**.

---

## Estructura del Repositorio

El repositorio está organizado por fases de entrega académica:

```text
 Proyecto-TITAN
│
├──  Fase1_Analisis_Requisitos/      # Historias de usuario iniciales, levantamiento de requerimientos.
└──  Fase2_Diseno_Arquitectura/      # Diagramas E-R, UML (Clases y Despliegue), Mockups UI.

```
