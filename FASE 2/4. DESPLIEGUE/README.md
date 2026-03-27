# Diagrama de Despliegue - Proyecto TITAN

## Descripción general

El diagrama de despliegue del Proyecto TITAN muestra cómo se distribuirán físicamente los componentes del sistema en los distintos nodos de hardware y software, y cómo se comunicarán entre ellos.

El sistema estará diseñado bajo una arquitectura cliente-servidor con un backend desarrollado en Spring Boot y un frontend web accesible desde cualquier dispositivo con navegador. La base de datos se encuentra en un servidor independiente, permitiendo escalabilidad, seguridad y mantenibilidad.

---

## Nodos principales

### 1. Dispositivo Cliente

* Representa cualquier equipo desde el cual los usuarios acceden al sistema: PC, tablet o smartphone.
* Incluye un navegador web que carga la aplicación frontend (HTML, CSS, JavaScript).

**Componentes:**

* **Frontend APP**: Interfaz de usuario que consume los servicios REST del backend.

---

### 2. Servidor de Aplicaciones

* Servidor encargado de ejecutar la lógica de negocio del sistema. Puede estar en un VPS o en hosting cloud.
* Contiene un contenedor web (Apache Tomcat embebido) que ejecuta la aplicación Spring Boot.

**Componentes internos:**

* **Controladores REST**: Gestionan las peticiones HTTP provenientes del frontend.
* **Servicios (Business Logic)**: Implementan la lógica del sistema, coordinando operaciones entre el frontend y la base de datos.
* **DAO / Acceso a Datos (JPA/Hibernate)**: Encapsula la comunicación con la base de datos, ejecutando consultas y persistiendo información.

**Flujo principal:**
Frontend → Controladores REST → Servicios → DAO → Base de Datos

---

### 3. Servidor de Base de Datos

* Servidor independiente que aloja MySQL Server.
* Contiene la base de datos TITAN con sus 23 tablas, donde se almacena toda la información de usuarios, trabajadores, cursos, certificados, equipos, documentos, facturación y alertas.

**Comunicación:**

* DAO se conecta a MySQL mediante JDBC / TCP-IP (puerto 3306).

---

## Relaciones de comunicación

* El **Frontend** interactúa con el **Backend** mediante peticiones HTTP/JSON, utilizando la API REST.
* El **Backend** accede a la **Base de Datos** mediante JDBC, garantizando transacciones seguras y consistentes.




