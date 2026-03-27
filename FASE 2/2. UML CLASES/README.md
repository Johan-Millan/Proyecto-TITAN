# Diagrama de Clases UML - Proyecto TITAN

## Descripción general

El diagrama de clases UML del Proyecto TITAN representa la estructura del sistema desde una perspectiva orientada a objetos, organizando los diferentes módulos según las funciones y roles de los usuarios, la gestión académica y operativa, así como la seguridad y auditoría.

El diseño refleja la relación entre los distintos actores del sistema (administradores, instructores y trabajadores), los procesos de certificación, cursos, inscripciones, documentos y equipos, así como las funcionalidades principales de cada clase.

---

## Módulos y clases principales

### 1. Módulo de Acceso

Incluye las clases relacionadas con el login y la gestión de usuarios del sistema:

* **Usuario (abstracta)**: Clase base para los perfiles que interactúan con el sistema.
  **Atributos:** idUsuario, nombreUsuario, correo, passwordHash, estadoActivo
  **Métodos:** login(), restablecerPassword()

* **Administrador**: Hereda de Usuario.
  **Métodos:** programarCurso(), generarFactura()

* **Instructor**: Hereda de Usuario.
  **Métodos:** registrarAsistencia(), evaluarTrabajador(), inspeccionarEquipo()

---

### 2. Módulo Operativo

Gestiona a los trabajadores y empresas que participan en los procesos de certificación:

* **Trabajador**
  **Atributos:** idTrabajador, numeroIdentificacion, nombreCompleto, telefono, correo
  **Métodos:** consultarEstadoSalud(), descargarCertificado()

* **Empresa**
  **Atributos:** idEmpresa, nit, nombre, correo
  **Métodos:** matricularTrabajadores(), pagarFactura()

---

### 3. Módulo Académico

Administra cursos, programación y certificaciones:

* **Curso**: Información básica de cada curso (idCurso, nombreCurso, intensidadHoraria)
* **ProgramacionCurso**: Representa la programación de un curso en fecha y hora específicas.
  **Métodos:** verificarCupoDisponible()
* **Inscripcion**: Clase asociativa entre Trabajador y ProgramacionCurso.
  **Métodos:** registrarAsistencia()
* **Certificado**: Representa la certificación obtenida por un trabajador.
  **Métodos:** generarPDF(), validarVigencia()

---

### 4. Módulo Auditoría y Seguridad

Gestiona equipos, documentos y certificaciones de equipos:

* **Documento**: Archivos asociados a usuarios o trabajadores.
  **Métodos:** subirArchivo(), descargar()
* **Equipo**: Equipos utilizados en prácticas y evaluaciones.
* **CertificadoEquipo**: Certificación de equipos, con fecha de vencimiento y estado.
  **Métodos:** alertarVencimiento()

---

## Relaciones principales

### Herencia

* Usuario <|-- Administrador
* Usuario <|-- Instructor

### Agregación y Composición

* Empresa o-- Trabajador : "emplea >" (una empresa puede tener muchos trabajadores)
* ProgramacionCurso o-- Curso : "pertenece a >"
* Equipo *-- CertificadoEquipo : "tiene >" (composición, un certificado depende del equipo)

### Asociaciones

* Instructor "1" -- "*" ProgramacionCurso : dicta cursos
* Usuario "1" -- "*" Documento : posee documentos
* Trabajador "1" -- "*" Certificado : obtiene certificados
* Trabajador "1" -- "*" Documento : posee documentos de identidad o salud
* Trabajador "1" -- "*" Inscripcion : se inscribe en cursos
* ProgramacionCurso "1" -- "*" Inscripcion : tiene inscripciones



