CREATE DATABASE titan;
USE titan;
CREATE TABLE roles(
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_identificacion(
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
);
CREATE TABLE empresas(
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    nit INT NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);
CREATE TABLE trabajadores (
    id_trabajador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
	apellido VARCHAR(150) NOT NULL,
    id_tipo INT, 
    numero_identificacion BIGINT NOT NULL UNIQUE,
    telefono BIGINT,
    correo VARCHAR(100), 
    id_empresa INT, 
    FOREIGN KEY (id_tipo) REFERENCES tipo_identificacion(id_tipo),
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);
CREATE TABLE usuarios(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100),
    telefono bigint,
    id_rol INT,
    id_tipo INT,
    numero_identificacion bigint NOT NULL,
    password_hash VARCHAR(255),
    estado_activo BOOLEAN DEFAULT TRUE,
    id_empresa INT,
	FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol),
    FOREIGN KEY (id_tipo) REFERENCES tipo_identificacion(id_tipo)
);
CREATE TABLE cursos(
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100),
    intensidad_horaria INT
);

CREATE TABLE certificados(
    id_certificado INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20),
    fecha_emision DATE,
    fecha_vencimiento DATE,
    id_trabajador INT,
    id_curso INT,
    id_empresa INT,
	FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa),
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);
CREATE TABLE indumentaria(
    id_indumentaria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(200)
);

CREATE TABLE inspecciones_equipos(
    id_inspeccion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    id_indumentaria INT,
    id_usuario INT,
    observaciones VARCHAR(200),
    FOREIGN KEY (id_indumentaria) REFERENCES indumentaria(id_indumentaria),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE metodo_pago(
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE facturas(
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa)
);

CREATE TABLE detalle_factura(
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    descripcion VARCHAR(100),
    valor DECIMAL(10,2),
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
);

CREATE TABLE pagos(
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    monto DECIMAL(10,2),
    id_factura INT,
    id_metodo INT,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo)
);
CREATE TABLE documentos(
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
    ruta_archivo VARCHAR(255) NOT NULL, -- ¡Importante para saber dónde está el PDF!
    id_usuario INT NULL, -- Será nulo si el documento es de un trabajador
    id_trabajador INT NULL, -- Será nulo si el documento es de un instructor/admin
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador)
);
CREATE TABLE salud(
    id_salud INT AUTO_INCREMENT PRIMARY KEY,
    apto ENUM('SI','NO'),
    restricciones VARCHAR(300),
    observaciones VARCHAR(500),
    fecha_examen DATE,
    fecha_vencimiento DATE,
    id_trabajador INT,
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador)
);
CREATE TABLE disponibilidad(
    id_disponibilidad INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    disponible ENUM('SI','NO'),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE evaluaciones(
    id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE preguntas(
    id_pregunta INT AUTO_INCREMENT PRIMARY KEY,
    pregunta TEXT,
    id_evaluacion INT,
    FOREIGN KEY (id_evaluacion) REFERENCES evaluaciones(id_evaluacion)
);

CREATE TABLE respuestas(
    id_respuesta INT AUTO_INCREMENT PRIMARY KEY,
    respuesta TEXT,
    es_correcta BOOLEAN,
    id_pregunta INT,
    FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta)
);

CREATE TABLE evaluaciones_presentadas(
    id_presentada INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    id_evaluacion INT,
    fecha DATE,
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador),
    FOREIGN KEY (id_evaluacion) REFERENCES evaluaciones(id_evaluacion)
);

CREATE TABLE resultados(
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    id_presentada INT,
    puntaje DECIMAL(5,2),
    FOREIGN KEY (id_presentada) REFERENCES evaluaciones_presentadas(id_presentada)
);
CREATE TABLE tipos_accidente(
    id_tipo_accidente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE accidentes(
    id_accidente INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    lugar VARCHAR(200),
    id_trabajador INT,
    id_tipo_accidente INT,
    descripcion TEXT,
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador),
    FOREIGN KEY (id_tipo_accidente) REFERENCES tipos_accidente(id_tipo_accidente)
);
CREATE TABLE tipos_alerta(
    id_tipo_alerta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE alertas(
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_alerta INT,
    fecha_vencimiento DATE,
    estado ENUM('pendiente','enviada','vencida'),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_tipo_alerta) REFERENCES tipos_alerta(id_tipo_alerta)
);
CREATE TABLE programacion_cursos(
    id_programacion INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    fecha DATE,
    hora TIME,
    cupos INT,
    id_usuario INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE inscripciones(
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_programacion INT,
    id_trabajador INT,
    estado ENUM('inscrito','cancelado'),
    FOREIGN KEY (id_programacion) REFERENCES programacion_cursos(id_programacion),
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador)
);
CREATE TABLE asistencias(
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_inscripcion INT,
    asistio BOOLEAN,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion)
);

CREATE TABLE certificados_equipos(
    id_certificado_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT,
    fecha_emision DATE,
    fecha_vencimiento DATE,
    estado ENUM('apto','no_apto'),
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);

SELECT 
    cert.codigo, 
    u.nombre,
    cert.fecha_vencimiento,
    DATEDIFF(cert.fecha_vencimiento, CURDATE()) AS dias_restantes
FROM certificados cert
JOIN usuarios u ON cert.id_usuario = u.id_usuario
WHERE cert.fecha_vencimiento BETWEEN CURDATE() AND CURDATE() + INTERVAL 60 DAY
ORDER BY dias_restantes ASC;
SELECT 
    e.nombre AS empresa, 
    COUNT(c.id_certificado) AS total_certificados,
    SUM(df.valor) AS total_facturado
FROM empresas e
JOIN usuarios u ON e.id_empresa = u.id_empresa
JOIN certificados c ON u.id_usuario = c.id_usuario
JOIN facturas f ON f.id_usuario = u.id_usuario
JOIN detalle_factura df ON df.id_factura = f.id_factura
GROUP BY e.id_empresa
ORDER BY total_facturado DESC;
SELECT 
    t.nombre, 
    c.nombre_curso, 
    cert.codigo, 
    cert.fecha_vencimiento
FROM trabajadores t
JOIN certificados cert ON t.id_trabajador = cert.id_trabajador
JOIN cursos c ON cert.id_curso = c.id_curso
WHERE t.numero_identificacion = 10203040; 
SELECT 
    pc.fecha,
    pc.hora,
    c.nombre_curso,
    u.nombre AS estudiante,
    e.nombre AS empresa_cliente,
    i.estado AS estado_inscripcion
FROM programacion_cursos pc
JOIN cursos c ON pc.id_curso = c.id_curso
JOIN inscripciones i ON pc.id_programacion = i.id_programacion
JOIN usuarios u ON i.id_usuario = u.id_usuario
JOIN empresas e ON u.id_empresa = e.id_empresa
WHERE pc.id_instructor = 1 -- Reemplazar con el ID del instructor que inicia sesión
AND pc.fecha = CURDATE(); -- Para ver las clases de "Hoy"
