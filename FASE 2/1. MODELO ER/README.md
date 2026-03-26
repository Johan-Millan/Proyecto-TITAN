# Base de Datos: Sistema Integrado TITAN.

Esta carpeta contiene el script de creación y la documentación del modelo relacional de la base de datos diseñada para **TITAN - ES SEGURIDAD EN ALTURAS S.A.S.**

## Arquitectura y Motor
- **Motor de Base de Datos:** MySQL 8.x
- **Patrón de Diseño:** Modelo Entidad-Relación (Relacional) altamente normalizado.
- **Total de Tablas:** 23 tablas conectadas mediante restricciones de integridad referencial (Foreign Keys).

## Decisiones Arquitectónicas Clave (Dominio del Proyecto)

Durante la fase de diseño, se tomó una decisión arquitectónica crucial para la seguridad y escalabilidad del sistema: **La separación entre `Usuarios` y `Trabajadores`.**

1. **Tabla `usuarios` (Actores del Sistema):** Contiene únicamente al personal administrativo, instructores y clientes empresariales que requieren **acceso mediante Login** (credenciales, contraseñas encriptadas y roles).
2. **Tabla `trabajadores` (Entidades de Negocio):** Contiene a los aprendices/estudiantes. Ellos **no inician sesión** en el sistema, sino que interactúan únicamente a través del portal público mediante su número de identificación para descargar sus certificados. Esto evita el sobrepoblamiento de la tabla de usuarios con datos de autenticación nulos y previene vulnerabilidades de seguridad.

---

## Módulos y Estructura de Tablas (Diccionario de Datos)

El sistema se divide lógicamente en los siguientes módulos transaccionales:

### 1. Módulo de Seguridad y Accesos
Gestiona quién entra al sistema y con qué nivel de permisos.
*   **`roles`**: Define los niveles de acceso (Admin, Instructor, Empresa).
*   **`tipo_identificacion`**: Catálogo paramétrico (CC, CE, NIT, Pasaporte).
*   **`usuarios`**: Almacena credenciales, correo único (`VARCHAR(100)`), y contraseña (`password_hash VARCHAR(255)`). Relacionado con `roles` (N:1).

### 2. Módulo de Gestión B2B y Operativa
Controla a los clientes (Empresas) y la "materia prima" del negocio (Trabajadores).
*   **`empresas`**: Almacena clientes corporativos. Atributos tipados como `nit VARCHAR(20)` para incluir dígito de verificación.
*   **`trabajadores`**: Datos del aprendiz. Llave foránea `id_empresa` indicando a qué cliente pertenecen (N:1). El campo `numero_identificacion` es `BIGINT UNIQUE` para evitar duplicidad de registros.

### 3. Módulo Académico (Core Business)
Traza el ciclo de vida de la capacitación.
*   **`cursos`**: Catálogo de formaciones disponibles y su intensidad horaria (`INT`).
*   **`programacion_cursos`**: Entidad para la apertura de clases. Relaciona a un Instructor (`id_usuario`) con un `Curso` en una `fecha` y `hora` específica.
*   **`inscripciones`**: Tabla asociativa (N:M resuelta) entre `trabajadores` y `programacion_cursos`. Maneja estados mediante `ENUM('inscrito', 'cancelado')`.
*   **`asistencias`**: Derivada de la inscripción, usa un `BOOLEAN` para determinar si el trabajador asistió a la pista.

### 4. Módulo de Evaluación y Certificación
*   **`evaluaciones`, `preguntas`, `respuestas`**: Estructura de composición (1:N) para crear exámenes dinámicos.
*   **`evaluaciones_presentadas` y `resultados`**: Registra la fecha y el puntaje decimal (`DECIMAL(5,2)`) obtenido por el trabajador.
*   **`certificados`**: Entidad final. Se genera automáticamente si hay aprobación. Contiene `fecha_emision` y `fecha_vencimiento` (`DATE`), relacionando directamente al `Trabajador`, el `Curso` y la `Empresa`.

### 5. Módulo de Auditoría, Salud y Seguridad
Fundamental para responder ante los entes de control (Ministerio de Trabajo).
*   **`documentos`**: Repositorio digital. Contiene `ruta_archivo VARCHAR(255)` para enlazar PDFs (Cédulas, Exámenes Médicos, Hojas de Vida). Puede pertenecer a un usuario o a un trabajador.
*   **`salud`**: Registra la aptitud médica. Es vital para las inscripciones preventivas.
*   **`accidentes` y `tipos_accidente`**: Bitácora de seguridad en pista.
*   **`equipos` y `inspecciones_equipos`**: Control de inventario de pista (Arneses, cuerdas).
*   **`certificados_equipos`**: Traza la vida útil de los equipos de protección, permitiendo estados `ENUM('apto', 'no_apto')`.

### 6. Módulo de Facturación B2B
*   **`facturas`**: Cabecera de cobro, ligada directamente a la `Empresa` (1:N).
*   **`detalle_factura`**: Conceptos cobrados, con valores tipados en `DECIMAL(10,2)` para cálculos financieros exactos.
*   **`pagos` y `metodo_pago`**: Trazabilidad de ingresos económicos.

---

##  Resumen de Cardinalidades (Modelo E-R)
*   **1 a Muchos (1:N):** `Empresa` emplea a `N` `Trabajadores`.
*   **1 a Muchos (1:N):** `Curso` tiene `N` `Programacion de Cursos`.
*   **Muchos a Muchos (N:M):** Resuelta en la tabla `Inscripciones`. Un `Trabajador` puede estar en `N` `Cursos`, y un `Curso` tiene `M` `Trabajadores`.
*   **Composición Fuerte:** `Facturas` contiene `Detalles de Factura`. (Si se elimina la factura, los detalles carecen de sentido E-R).
