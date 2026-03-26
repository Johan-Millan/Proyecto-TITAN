## 1. Definición de Arquitectura de Software

La arquitectura de software se define como la estructura organizativa fundamental de un sistema. Comprende los componentes de software, sus propiedades visibles externamente y las relaciones entre ellos. Su propósito es establecer una base sólida que guíe el desarrollo, garantice el cumplimiento de los atributos de calidad (escalabilidad, seguridad, rendimiento) y facilite el mantenimiento a lo largo del ciclo de vida del proyecto TITAN.

## 2. Selección y Justificación del Patrón Arquitectónico

Para el desarrollo del Sistema de Información de TITAN - ES SEGURIDAD EN ALTURAS S.A.S., se ha seleccionado una Arquitectura Cliente-Servidor distribuida, implementando el patrón MVC (Modelo-Vista-Controlador) en el backend mediante la construcción de una API RESTful.

**Justificación técnica de la selección:**
Descarte de Microservicios (Prevención de Overengineering): Dado que el sistema posee un modelo de datos altamente relacional (23 tablas fuertemente acopladas con llaves foráneas para garantizar auditorías y trazabilidad) y un tráfico de usuarios moderado/predecible, una arquitectura de microservicios aportaría una complejidad innecesaria en infraestructura y transaccionalidad.
Separación de Responsabilidades (Cliente-Servidor): Al separar el Frontend (interfaz de usuario) del Backend (lógica de negocio), el sistema se vuelve altamente escalable. Esto permitirá en el futuro desarrollar, por ejemplo, una aplicación móvil exclusiva para que los instructores suban notas en la pista de entrenamiento, consumiendo la misma API sin necesidad de reescribir código.

Patrón MVC adaptado a API REST:

- **Modelo:** Representado por las entidades de la base de datos (Java/JPA).
- **Controlador:** Los REST Controllers de Spring Boot que gestionan las peticiones HTTP (GET, POST, PUT, DELETE).
- **Vista:** Delegada completamente al Frontend (HTML, CSS y JavaScript), que consume los datos en formato JSON enviados por el servidor.

## 3. Definición del Stack Tecnológico

De acuerdo con las necesidades del proyecto y las competencias del equipo de desarrollo, el stack tecnológico seleccionado es el siguiente:

**Backend (Lógica de Negocio y API):**

- **Lenguaje:** Java.
- **Framework Principal:** Spring Boot. Es ideal para aplicaciones empresariales, ya que incluye un servidor web embebido (Apache Tomcat) y facilita la configuración de seguridad y servicios REST.

**Módulos de Spring:**
  
- Spring Web (Para crear la API REST).
- Spring Data JPA / Hibernate (Para mapear las clases de Java a las tablas de MySQL mediante ORM, evitando escribir consultas SQL manuales para los CRUD básicos).
- Spring Security (Para proteger las rutas y encriptar contraseñas).

**Frontend (Interfaz de Usuario):**

- **Lenguajes:** JavaScript (ES6+), HTML5 y CSS3.
- **Librerías/Herramientas:** Consumo de la API mediante Fetch API (o Axios). Se puede integrar Bootstrap o Tailwind CSS para un diseño responsivo y profesional que funcione bien en computadoras y tablets (indispensable para el trabajo en pista de los instructores).

**Base de Datos (Persistencia):**

- **Motor:** MySQL (Relacional). Ideal para garantizar la integridad de las relaciones entre cursos, trabajadores, certificaciones y auditorías.

**Herramientas de Desarrollo (DevTools):**

- **Control de Versiones:** Git y GitHub.
- **Gestor de Dependencias:** Maven o Gradle (integrado en Spring Boot).
- **Pruebas de API:** Postman o Swagger/OpenAPI.
