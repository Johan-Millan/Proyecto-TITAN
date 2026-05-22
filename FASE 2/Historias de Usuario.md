# 1. HISTORIA DE USUARIO - Registro de Participantes

## Información General

**ID:** HU-002  
**Título:** Registro de participantes en el centro de entrenamiento  
**Épica/Módulo:** RF-001: Gestión de Usuarios y Roles  
**Prioridad:** MUST (Crítico)  
**Puntos de Historia:** 5  
**Sprint/Iteración:** Sprint 1

---

## Historia de Usuario

**Como** personal administrativo del centro de entrenamiento  
**Quiero** registrar nuevos participantes en el sistema  
**Para** mantener organizada y segura la información de los asistentes a los cursos

---

## Descripción Detallada

Esta historia permite al personal administrativo registrar participantes en el sistema mediante un formulario digital. El sistema debe validar la información ingresada, evitar registros duplicados y almacenar de forma segura los datos personales.

La identificación principal del participante será el número de documento, el cual permitirá búsquedas rápidas y trazabilidad histórica dentro de la plataforma.

---

## Criterios de Aceptación

### Escenario 1: Registro exitoso de participante


Dado que el administrativo accede al módulo de registro
Cuando ingresa todos los datos obligatorios del participante
Y el número de documento no existe previamente
Entonces el sistema almacena la información correctamente
Y muestra un mensaje de confirmación exitoso


### Escenario 2: Participante duplicado


Dado que ya existe un participante registrado
Cuando el administrativo intenta registrar el mismo número de documento
Entonces el sistema muestra un mensaje indicando que el participante ya existe
Y no permite duplicar el registro

### Escenario 3: Campos obligatorios incompletos


Dado que el administrativo está diligenciando el formulario
Cuando deja campos obligatorios vacíos
Entonces el sistema resalta los campos faltantes
Y no permite guardar el registro


---

## Reglas de Negocio

- **RN-002.1:** El número de documento debe ser único.
- **RN-002.2:** Todos los campos obligatorios deben validarse.
- **RN-002.3:** El sistema debe almacenar los datos de manera segura.
- **RN-002.4:** Solo usuarios administrativos pueden registrar participantes.

# 2. HISTORIA DE USUARIO - Búsqueda de Participantes

## Información General

**ID:** HU-003  
**Título:** Búsqueda rápida de participantes por documento  
**Épica/Módulo:** RF-001: Gestión de Usuarios y Roles  
**Prioridad:** MUST (Crítico)  
**Puntos de Historia:** 3  
**Sprint/Iteración:** Sprint 1

---

## Historia de Usuario

**Como** administrativo o participante  
**Quiero** buscar información de participantes usando el número de documento  
**Para** acceder rápidamente a la información requerida

---

## Descripción Detallada

La historia permite localizar participantes de forma ágil utilizando el número de documento como criterio principal de búsqueda. El objetivo es optimizar tiempos operativos y facilitar el acceso inmediato a la información.

---

## Criterios de Aceptación

### Escenario 1: Participante encontrado


Dado que el participante existe en el sistema
Cuando el usuario ingresa el número de documento
Entonces el sistema muestra la información correspondiente
Y la búsqueda se completa en menos de 6 segundos


### Escenario 2: Participante no encontrado


Dado que el documento ingresado no existe
Cuando el usuario realiza la búsqueda
Entonces el sistema muestra el mensaje "Participante no encontrado"


---

## Reglas de Negocio

- **RN-003.1:** La búsqueda principal será por número de documento.
- **RN-003.2:** El tiempo máximo de respuesta será de 6 segundos.
- **RN-003.3:** El sistema debe mostrar solo información autorizada según el rol.


# 3. HISTORIA DE USUARIO - Historial Integral del Participante

## Información General

**ID:** HU-004  
**Título:** Consulta histórica integral de participantes  
**Épica/Módulo:** RF-001: Gestión de Usuarios y Roles  
**Prioridad:** MUST (Crítico)  
**Puntos de Historia:** 8  
**Sprint/Iteración:** Sprint 2

---

## Historia de Usuario

**Como** personal administrativo  
**Quiero** visualizar todo el historial de un participante  
**Para** consultar cursos, certificados, asistencias e incidentes asociados

---

## Descripción Detallada

El sistema consolidará toda la información relacionada con un participante en un único perfil histórico. Esto permitirá agilizar procesos administrativos, auditorías y seguimiento académico.

---

## Criterios de Aceptación

### Escenario 1: Consulta completa del historial


Dado que el participante existe en el sistema
Cuando el administrativo accede a su perfil
Entonces el sistema muestra cursos, certificados, asistencias e incidentes
Y la información aparece en orden cronológico


### Escenario 2: Exportación de información


Dado que el administrativo consulta el historial
Cuando selecciona exportar información
Entonces el sistema genera un archivo PDF o Excel descargable


---

## Reglas de Negocio

- **RN-004.1:** La información debe mostrarse cronológicamente.
- **RN-004.2:** Debe permitirse exportación PDF/Excel.
- **RN-004.3:** El tiempo máximo de carga será de 5 segundos.

---

# 3. HISTORIA DE USUARIO - Registro de Incidentes

## Información General

**ID:** HU-005  
**Título:** Registro formal de incidentes en entrenamientos  
**Épica/Módulo:** RF-001: Gestión de Usuarios y Roles  
**Prioridad:** SHOULD (Importante)  
**Puntos de Historia:** 5  
**Sprint/Iteración:** Sprint 2

---

## Historia de Usuario

**Como** personal administrativo  
**Quiero** registrar incidentes ocurridos en el centro de entrenamiento  
**Para** mantener control y trazabilidad de eventos importantes

---

## Descripción Detallada

El sistema permitirá registrar incidentes relacionados con participantes o instructores, incluyendo fecha, hora, descripción y acciones tomadas.

---

## Criterios de Aceptación

### Escenario 1: Registro exitoso de incidente


Dado que ocurrió un incidente
Cuando el administrativo registra los detalles
Entonces el sistema almacena la información correctamente
Y vincula a los involucrados

---

## Reglas de Negocio

- **RN-005.1:** Todo incidente debe registrar fecha y hora.
- **RN-005.2:** Debe permitir descripción detallada.
- **RN-005.3:** Debe asociarse a participantes o instructores.

---

# 4. HISTORIA DE USUARIO - Generación de Certificados con Código QR

## Información General

**ID:** HU-006  
**Título:** Generación automática de certificados digitales con QR  
**Épica/Módulo:** RF-002: Reportería y Cumplimiento  
**Prioridad:** MUST (Crítico)  
**Puntos de Historia:** 8  
**Sprint/Iteración:** Sprint 3

---

## Historia de Usuario

**Como** sistema  
**Quiero** generar certificados digitales con código QR único  
**Para** permitir validación rápida y segura de certificados

---

## Descripción Detallada

El sistema debe generar certificados PDF con identificador único y código QR para validación pública. Los certificados deben estar asociados al historial del participante.

---

## Criterios de Aceptación

### Escenario 1: Generación exitosa de certificado


Dado que un participante aprobó un curso
Cuando el sistema genera el certificado
Entonces se crea un código QR único
Y el certificado puede descargarse en PDF


### Escenario 2: Validación pública del certificado


Dado que un usuario escanea el código QR
Cuando accede al enlace de validación
Entonces el sistema muestra el estado válido del certificado


---

## Reglas de Negocio

- **RN-006.1:** Cada certificado debe tener un identificador único.
- **RN-006.2:** El QR debe permitir validación pública.
- **RN-006.3:** El certificado debe descargarse en PDF.

---

# 5. HISTORIA DE USUARIO - Programación de Cursos

## Información General

**ID:** HU-007  
**Título:** Programación de cursos en calendario  
**Épica/Módulo:** RF-003: Gestión Académica  
**Prioridad:** SHOULD (Importante)  
**Puntos de Historia:** 5  
**Sprint/Iteración:** Sprint 2

---

## Historia de Usuario

**Como** personal administrativo  
**Quiero** programar cursos en un calendario  
**Para** organizar fechas, instructores y cupos disponibles

---

## Descripción Detallada

El sistema permitirá gestionar la programación académica de cursos de alturas, evitando conflictos de horarios y sobreasignación de instructores.

---

## Criterios de Aceptación

### Escenario 1: Programación exitosa


Dado que existen instructores disponibles
Cuando el administrativo programa un curso
Entonces el sistema guarda fecha, hora e instructor
Y muestra el curso en el calendario


### Escenario 2: Instructor ocupado


Dado que un instructor ya tiene un curso asignado
Cuando el administrativo intenta asignarlo nuevamente en el mismo horario
Entonces el sistema bloquea la asignación
Y muestra un mensaje de conflicto de horario


---

## Reglas de Negocio

- **RN-007.1:** No puede existir doble asignación de instructor.
- **RN-007.2:** Debe mostrarse disponibilidad de cupos.
- **RN-007.3:** El calendario debe actualizarse en tiempo real.

---

# HISTORIA DE USUARIO - Inscripción de Participantes a Cursos

## Información General

**ID:** HU-008  
**Título:** Inscripción de participantes a cursos programados  
**Épica/Módulo:** RF-003: Gestión Académica  
**Prioridad:** MUST (Crítico)  
**Puntos de Historia:** 5  
**Sprint/Iteración:** Sprint 2

---

## Historia de Usuario

**Como** personal administrativo  
**Quiero** inscribir participantes en cursos programados  
**Para** gestionar correctamente la asistencia académica

---

## Criterios de Aceptación

### Escenario 1: Inscripción exitosa


Dado que el curso tiene cupos disponibles
Cuando el administrativo agrega un participante
Entonces el sistema confirma la inscripción
Y actualiza la lista de inscritos


### Escenario 2: Curso sin cupos


Dado que el curso alcanzó su capacidad máxima
Cuando el administrativo intenta inscribir otro participante
Entonces el sistema bloquea la inscripción
Y muestra un mensaje indicando que no hay cupos disponibles


---

## Reglas de Negocio

- **RN-008.1:** No debe superarse la capacidad del curso.
- **RN-008.2:** El participante debe existir previamente.
- **RN-008.3:** La inscripción debe quedar asociada al curso.

---

# 6. HISTORIA DE USUARIO - Alertas de Vencimiento de Certificados

## Información General

**ID:** HU-009  
**Título:** Alertas automáticas de vencimiento de certificados  
**Épica/Módulo:** RF-003: Gestión Académica  
**Prioridad:** SHOULD (Importante)  
**Puntos de Historia:** 5  
**Sprint/Iteración:** Sprint 3

---

## Historia de Usuario

**Como** personal administrativo  
**Quiero** recibir alertas de certificados próximos a vencer  
**Para** contactar participantes y evitar vencimientos

---

## Criterios de Aceptación

### Escenario 1: Detección automática de vencimiento


Dado que existen certificados próximos a vencer
Cuando faltan 30 días para el vencimiento
Entonces el sistema genera una alerta automática
Y muestra los participantes afectados


### Escenario 2: Descarga de listado


Dado que existen certificados próximos a vencer
Cuando el administrativo solicita exportar la información
Entonces el sistema genera un listado descargable


---

## Reglas de Negocio

- **RN-009.1:** La alerta debe generarse automáticamente.
- **RN-009.2:** Debe indicar días restantes.
- **RN-009.3:** Debe permitir exportación de datos.
