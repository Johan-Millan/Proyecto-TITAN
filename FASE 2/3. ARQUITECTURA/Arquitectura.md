## 1. Definición de Arquitectura de Software

La arquitectura de software se define como la estructura organizativa fundamental de un sistema. Comprende los componentes de software, sus propiedades visibles externamente y las relaciones entre ellos. Su propósito es establecer una base sólida que guíe el desarrollo, garantice el cumplimiento de los atributos de calidad (escalabilidad, seguridad, rendimiento) y facilite el mantenimiento a lo largo del ciclo de vida del proyecto TITAN.

## 2. Selección y Justificación del Patrón Arquitectónico

Para el desarrollo del Sistema de Información de TITAN - ES SEGURIDAD EN ALTURAS S.A.S., se ha seleccionado una Arquitectura Cliente-Servidor basada en servicios, implementando una API RESTful y una organización en capas (Controller, Service, Repository), alineada con principios de Clean Architecture.

**Justificación técnica de la selección:**

- **Prevención de sobreingeniería:**
Dado que el sistema presenta un modelo de datos altamente relacional y un volumen de usuarios moderado, se descarta el uso de microservicios. Una arquitectura monolítica modular permite mantener la simplicidad, garantizar la integridad transaccional y reducir la complejidad operativa.
- **Separación de responsabilidades:**
La división entre frontend y backend permite escalar cada componente de forma independiente, facilitando la integración futura de aplicaciones móviles o nuevos clientes sin modificar la lógica de negocio.
- **Escalabilidad y mantenibilidad:**
El uso de una arquitectura por capas desacopla la lógica del sistema, facilitando pruebas, mantenimiento y evolución del software.

## 3. Definición del Stack Tecnológico

De acuerdo con las necesidades del proyecto y las competencias del equipo de desarrollo, el stack tecnológico seleccionado es el siguiente:

**Backend (Lógica de Negocio y API):**

- **Lenguaje:** Java.
- **Framework Principal:** Spring Boot y Spring WebFlux.

**Módulos de Spring:**
  
- Spring Web (Para crear la API REST).
- Spring Data JPA / Hibernate (Para mapear las clases de Java a las tablas de MySQL mediante ORM, evitando escribir consultas SQL manuales para los CRUD básicos).
- Spring Security (Para proteger las rutas y encriptar contraseñas).

**Frontend (Interfaz de Usuario):**

- **Lenguajes:** Typescript, React
- **Librerías/Herramientas:** Consumo de la API mediante Axios, Tailwind CSS para un diseño responsivo y profesional que funcione bien en computadoras y tablets (indispensable para el trabajo en pista de los instructores).

**Base de Datos (Persistencia):**

- **Motor:** MySQL (Relacional). Ideal para garantizar la integridad de las relaciones entre cursos, trabajadores, certificaciones y auditorías.

**Herramientas de Desarrollo (DevTools):**

- **Control de Versiones:** Git y GitHub.
- **Gestor de Dependencias:** Maven o Gradle (integrado en Spring Boot).
- **Pruebas de API:** Postman o Swagger/OpenAPI.
