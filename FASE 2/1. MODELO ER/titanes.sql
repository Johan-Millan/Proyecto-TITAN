CREATE DATABASE titan;
USE titan;
CREATE TABLE roles(
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_identificacion(
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL
);
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    tipo_registro ENUM('empresa', 'trabajador', 'usuario') NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    apellido VARCHAR(150),
    id_tipo INT,
    numero_identificacion BIGINT,
    nit BIGINT,
    direccion VARCHAR(200),
    telefono BIGINT,
    correo VARCHAR(100),
    password_hash VARCHAR(255),
    estado_activo BOOLEAN DEFAULT TRUE,
    id_empresa INT,
    id_rol INT,
    FOREIGN KEY (id_tipo) REFERENCES tipo_identificacion(id_tipo),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol),
    FOREIGN KEY (id_empresa) REFERENCES usuarios(id_usuario)
);
CREATE TABLE cursos(
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre_curso VARCHAR(100),
    intensidad_horaria INT
);

CREATE TABLE certificados(
    id_certificado INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20),
    fecha_emision DATE,
    fecha_vencimiento DATE,
    id_trabajador INT,
    id_curso INT,
    id_usuario INT,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);
CREATE TABLE indumentaria(
    id_indumentaria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion VARCHAR(200)
);

CREATE TABLE inspecciones_equipos(
    id_inspeccion INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    id_indumentaria INT,
    id_usuario INT,
    observaciones VARCHAR(200),
    FOREIGN KEY (id_indumentaria) REFERENCES indumentaria(id_indumentaria),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE metodo_pago(
    id_metodo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
);

CREATE TABLE facturas(
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    id_empresa INT,
    FOREIGN KEY (id_empresa) REFERENCES usuarios(id_usuario)
);

CREATE TABLE detalle_factura(
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_factura INT,
    descripcion VARCHAR(100),
    valor DECIMAL(10,2),
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura) ON DELETE CASCADE
);

CREATE TABLE pagos(
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    monto DECIMAL(10,2),
    id_factura INT,
    id_metodo INT,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura) ON DELETE RESTRICT,
    FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo)
);
CREATE TABLE documentos(
    id_documento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
    ruta_archivo VARCHAR(255) NOT NULL, -- ¡Importante para saber dónde está el PDF!
    id_usuario INT NULL, -- Será nulo si el documento es de un trabajador
	FOREIGN KEY (id_usuario)    REFERENCES usuarios(id_usuario)       ON DELETE SET NULL
);
CREATE TABLE salud(
    id_salud INT PRIMARY KEY AUTO_INCREMENT,
    apto ENUM('SI','NO'),
    restricciones VARCHAR(300),
    observaciones VARCHAR(500),
    fecha_examen DATE,
    fecha_vencimiento DATE,
    id_trabajador INT,
    FOREIGN KEY (id_trabajador) REFERENCES usuarios(id_usuario) ON DELETE RESTRICT
);
CREATE TABLE disponibilidad(
    id_disponibilidad INT PRIMARY KEY AUTO_INCREMENT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    disponible ENUM('SI','NO'),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE evaluaciones(
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE preguntas(
    id_pregunta INT PRIMARY KEY AUTO_INCREMENT,
    pregunta TEXT,
    id_evaluacion INT,
    FOREIGN KEY (id_evaluacion) REFERENCES evaluaciones(id_evaluacion)
);

CREATE TABLE respuestas(
    id_respuesta INT PRIMARY KEY AUTO_INCREMENT,
    respuesta TEXT,
    es_correcta BOOLEAN,
    id_pregunta INT,
    FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta) ON DELETE CASCADE
);

CREATE TABLE evaluaciones_presentadas(
    id_presentada INT PRIMARY KEY AUTO_INCREMENT,
    id_trabajador INT,
    id_evaluacion INT,
    fecha DATE,
    FOREIGN KEY (id_trabajador) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_evaluacion) REFERENCES evaluaciones(id_evaluacion)
);

CREATE TABLE resultados(
    id_resultado INT PRIMARY KEY AUTO_INCREMENT,
    id_presentada INT,
    puntaje DECIMAL(5,2),
    FOREIGN KEY (id_presentada) REFERENCES evaluaciones_presentadas(id_presentada)
);
CREATE TABLE tipos_accidente(
    id_tipo_accidente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE accidentes(
    id_accidente INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    lugar VARCHAR(200),
    id_trabajador INT,
    id_tipo_accidente INT,
    descripcion TEXT,
    FOREIGN KEY (id_trabajador) REFERENCES usuarios(id_usuario) ON DELETE RESTRICT,
    FOREIGN KEY (id_tipo_accidente) REFERENCES tipos_accidente(id_tipo_accidente)
);
CREATE TABLE tipos_alerta(
    id_tipo_alerta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE alertas(
    id_alerta INT PRIMARY KEY AUTO_INCREMENT,
    id_tipo_alerta INT,
    fecha_vencimiento DATE,
    estado ENUM('pendiente','enviada','vencida'),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL,
    FOREIGN KEY (id_tipo_alerta) REFERENCES tipos_alerta(id_tipo_alerta)
);
CREATE TABLE programacion_cursos(
    id_programacion INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT,
    fecha DATE,
    hora TIME,
    cupos INT,
    id_usuario INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
CREATE TABLE inscripciones(
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_programacion INT,
    id_trabajador INT,
    estado ENUM('inscrito','cancelado'),
    FOREIGN KEY (id_programacion) REFERENCES programacion_cursos(id_programacion),
    FOREIGN KEY (id_trabajador) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);
CREATE TABLE asistencias(
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT,
    asistio BOOLEAN,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion) ON DELETE CASCADE
);

CREATE TABLE certificados_equipos(
    id_certificado_equipo INT PRIMARY KEY AUTO_INCREMENT,
    id_indumentaria INT,
    fecha_emision DATE,
    fecha_vencimiento DATE,
    estado ENUM('apto','no_apto'),
    FOREIGN KEY (id_indumentaria) REFERENCES indumentaria(id_indumentaria)
);

INSERT INTO roles (nombre_rol) VALUES
('Administrador'),
('Usuario'),
('Instructor');

INSERT INTO tipo_identificacion (nombre) VALUES
('CC'),
('TI'),
('CE'),
('Pasaporte'),
('RC'),
('NIT'),
('NUIP'),
('PE'),
('DNI'),
('PPT');

INSERT INTO usuarios 
(tipo_registro, nombre, apellido, id_tipo, numero_identificacion, nit, direccion, telefono, correo, password_hash, id_rol, id_empresa)
VALUES
('empresa', 'Tech Solutions SAS', NULL, NULL, NULL, 900123456, 'Calle 123 #45-67', 3001234567, 'info@techsolutions.com', NULL, NULL, NULL),
('empresa', 'Innovatech Ltda', NULL, NULL, NULL, 901987654, 'Carrera 10 #20-30', 3109876543, 'contacto@innovatech.com', NULL, NULL, NULL),
('trabajador', 'Carlos', 'Perez', 1, 1234567890, NULL, NULL, 3001112233, 'carlos.perez@gmail.com', NULL, NULL, 1),
('trabajador', 'Laura', 'Gomez', 1, 1098765432, NULL, NULL, 3012223344, 'laura.gomez@gmail.com', NULL, NULL, 2),
('trabajador', 'Andres', 'Lopez', 1, 1122334455, NULL, NULL, 3023334455, 'andres.lopez@gmail.com', NULL, NULL, 1),
('usuario', 'Admin', 'Principal', 1, 1000000001, NULL, NULL, 3201111111, 'admin@techsolutions.com', 'hash123', 1, 1),
('usuario', 'Maria', 'Rodriguez', 1, 1000000002, NULL, NULL, 3202222222, 'maria@innovatech.com', 'hash456', 2, 2),
('usuario', 'Juan', 'Martinez', 1, 1000000003, NULL, NULL, 3203333333, 'juan@gmail.com', 'hash789', 2, 1),
('usuario', 'Sofia', 'Ramirez', 1, 1000000004, NULL, NULL, 3204444444, 'sofia@gmail.com', 'hash321', 3, 2),
('usuario', 'Luis', 'Fernandez', 1, 1000000005, NULL, NULL, 3205555555, 'luis@gmail.com', 'hash654', 2, 1);

INSERT INTO cursos (nombre_curso, intensidad_horaria) VALUES
('Trabajador autorizado', 32),
('Reentrenamiento en alturas', 8),
('Coordinador de trabajo en alturas', 80);

INSERT INTO certificados (codigo, fecha_emision, fecha_vencimiento, id_trabajador, id_curso, id_empresa) VALUES
('CERT-001', '2025-01-15', '2026-01-15', 1, 1, 1),
('CERT-002', '2025-02-10', '2026-02-10', 2, 2, 2),
('CERT-003', '2025-03-05', '2026-03-05', 3, 3, 3),
('CERT-004', '2025-01-20', '2026-01-20', 4, 3, 4),
('CERT-005', '2025-02-25', '2026-02-25', 5, 1, 5),
('CERT-006', '2025-03-12', '2026-03-12', 6, 2, 6),
('CERT-007', '2025-01-30', '2026-01-30', 7, 3, 7),
('CERT-008', '2025-02-18', '2026-02-18', 8, 1, 8),
('CERT-009', '2025-03-22', '2026-03-22', 9, 1, 9),
('CERT-010', '2025-04-01', '2026-04-01', 10, 2, 10);

INSERT INTO indumentaria (nombre, descripcion) VALUES
('Casco de seguridad', 'Protección para la cabeza contra impactos y caídas de objetos'),
('Arnés de cuerpo completo', 'Equipo de protección para trabajos en alturas'),
('Línea de vida', 'Sistema de seguridad para evitar caídas'),
('Guantes de seguridad', 'Protección para manos contra riesgos mecánicos'),
('Botas de seguridad', 'Calzado con puntera reforzada y suela antideslizante'),
('Gafas de protección', 'Protección ocular contra partículas y polvo'),
('Chaleco reflectivo', 'Prenda de alta visibilidad para zonas de trabajo'),
('Protector auditivo', 'Dispositivo para reducir el ruido en ambientes industriales'),
('Mascarilla respiratoria', 'Protección contra partículas y contaminantes en el aire'),
('Cinturón de posicionamiento', 'Equipo para mantener estabilidad en trabajos en altura');

INSERT INTO inspecciones_indumentaria (fecha, id_indumentaria, id_usuario, observaciones) VALUES
('2025-03-01', 1, 1, 'Casco en buen estado'),
('2025-03-02', 2, 2, 'Arnés con desgaste leve'),
('2025-03-03', 3, 3, 'Línea de vida apta para uso'),
('2025-03-04', 4, 4, 'Guantes con signos de uso'),
('2025-03-05', 5, 5, 'Botas en excelente estado'),
('2025-03-06', 6, 6, 'Gafas rayadas, revisar'),
('2025-03-07', 7, 7, 'Chaleco en buen estado'),
('2025-03-08', 8, 8, 'Protector auditivo funcional'),
('2025-03-09', 9, 9, 'Mascarilla requiere cambio'),
('2025-03-10', 10, 10, 'Cinturón en condiciones óptimas');

INSERT INTO metodo_pago (nombre) VALUES
('Efectivo'),
('Tarjeta de crédito'),
('Tarjeta de débito'),
('Transferencia bancaria'),
('PSE'),
('Nequi'),
('Daviplata'),
('Consignación bancaria');

INSERT INTO facturas (fecha, id_empresa) VALUES
('2025-03-01', 1),
('2025-03-02', 2),
('2025-03-03', 3),
('2025-03-04', 4),
('2025-03-05', 5),
('2025-03-06', 6),
('2025-03-07', 7),
('2025-03-08', 8),
('2025-03-09', 9),
('2025-03-10', 10);

INSERT INTO detalle_factura (id_factura, descripcion, valor) VALUES
(1, 'Curso trabajo en alturas básico', 350000.00),
(2, 'Curso trabajo en alturas avanzado', 500000.00),
(3, 'Reentrenamiento en alturas', 200000.00),
(4, 'Coordinador de alturas', 800000.00),
(5, 'Curso rescate en alturas', 450000.00),
(6, 'Espacios confinados', 300000.00),
(7, 'Primeros auxilios', 150000.00),
(8, 'Manejo de extintores', 120000.00),
(9, 'Seguridad industrial básica', 180000.00),
(10, 'Riesgo eléctrico', 250000.00);

INSERT INTO pagos (fecha, monto, id_factura, id_metodo) VALUES
('2025-03-01', 350000.00, 1, 1),
('2025-03-02', 500000.00, 2, 2),
('2025-03-03', 200000.00, 3, 3),
('2025-03-04', 800000.00, 4, 4),
('2025-03-05', 450000.00, 5, 5),
('2025-03-06', 300000.00, 6, 6),
('2025-03-07', 150000.00, 7, 7),
('2025-03-08', 120000.00, 8, 8),
('2025-03-09', 180000.00, 9, 9),
('2025-03-10', 250000.00, 10, 10);


INSERT INTO tipos_accidente (nombre) VALUES
('Caída de altura'),
('Golpe por objeto'),
('Electrocución'),
('Atrapamiento'),
('Incendio'),
('Explosión'),
('Corte o laceración'),
('Exposición a sustancias químicas'),
('Sobreesfuerzo'),
('Resbalón o tropiezo');

INSERT INTO accidentes (fecha, lugar, id_trabajador, id_tipo_accidente, descripcion) VALUES
('2025-02-01', 'Obra Bogotá', 1, 1, 'Caída desde andamio'),
('2025-02-05', 'Planta Medellín', 2, 2, 'Golpe con herramienta'),
('2025-02-10', 'Obra Cali', 3, 3, 'Contacto con cable eléctrico'),
('2025-02-12', 'Fábrica Barranquilla', 4, 4, 'Atrapamiento en máquina'),
('2025-02-15', 'Obra Cartagena', 5, 5, 'Incendio menor controlado'),
('2025-02-18', 'Planta Bucaramanga', 6, 6, 'Explosión leve en equipo'),
('2025-02-20', 'Obra Pereira', 7, 7, 'Corte con herramienta'),
('2025-02-22', 'Fábrica Manizales', 8, 8, 'Inhalación de químicos'),
('2025-02-25', 'Obra Cúcuta', 9, 9, 'Lesión por sobreesfuerzo'),
('2025-02-28', 'Planta Santa Marta', 10, 10, 'Resbalón en superficie húmeda');

INSERT INTO tipos_alerta (nombre) VALUES
('Alerta por accidente'),
('Alerta de inspección'),
('Alerta de vencimiento certificado'),
('Alerta de salud ocupacional'),
('Alerta de capacitación'),
('Alerta de mantenimiento'),
('Alerta de seguridad'),
('Alerta de riesgo eléctrico'),
('Alerta de equipo defectuoso'),
('Alerta general');


INSERT INTO documentos (nombre, descripcion, ruta_archivo, id_usuario, id_trabajador) VALUES
('Certificado Alturas Carlos', 'Certificado curso alturas básico', '/docs/cert_carlos.pdf', NULL, 1),
('Hoja de vida Laura', 'Documento hoja de vida', '/docs/hv_laura.pdf', 2, NULL),
('Certificado Andres', 'Certificado reentrenamiento', '/docs/cert_andres.pdf', NULL, 3),
('Contrato Diana', 'Contrato laboral firmado', '/docs/contrato_diana.pdf', 4, NULL),
('Certificado Jorge', 'Curso avanzado alturas', '/docs/cert_jorge.pdf', NULL, 5),
('Documento Camila', 'Identificación escaneada', '/docs/doc_camila.pdf', 6, NULL),
('Certificado Felipe', 'Rescate en alturas', '/docs/cert_felipe.pdf', NULL, 7),
('Hoja de vida Valentina', 'HV actualizada', '/docs/hv_valentina.pdf', 8, NULL),
('Certificado Santiago', 'Seguridad industrial', '/docs/cert_santiago.pdf', NULL, 9),
('Documento Natalia', 'Contrato y anexos', '/docs/doc_natalia.pdf', 10, NULL);

INSERT INTO salud (apto, restricciones, observaciones, fecha_examen, fecha_vencimiento, id_trabajador) VALUES
('SI', 'Ninguna', 'Apto para trabajo en alturas', '2025-01-10', '2026-01-10', 1),
('SI', 'Uso obligatorio de gafas', 'Visión reducida', '2025-01-15', '2026-01-15', 2),
('NO', 'Problemas de vértigo', 'No apto para alturas', '2025-01-20', '2025-07-20', 3),
('SI', 'Evitar sobreesfuerzos', 'Condición física moderada', '2025-02-01', '2026-02-01', 4),
('SI', 'Ninguna', 'Buen estado general', '2025-02-05', '2026-02-05', 5),
('SI', 'Uso de rodillera', 'Molestia en rodilla', '2025-02-10', '2026-02-10', 6),
('NO', 'Hipertensión', 'No apto temporalmente', '2025-02-15', '2025-08-15', 7),
('SI', 'Ninguna', 'Apto sin restricciones', '2025-02-20', '2026-02-20', 8),
('SI', 'Evitar alturas extremas', 'Recomendación médica', '2025-03-01', '2026-03-01', 9),
('SI', 'Ninguna', 'Condiciones óptimas', '2025-03-05', '2026-03-05', 10);

INSERT INTO disponibilidad (fecha_inicio, fecha_fin, disponible, id_usuario) VALUES
('2025-04-01 08:00:00', '2025-04-01 17:00:00', 'SI', 1),
('2025-04-02 08:00:00', '2025-04-02 17:00:00', 'SI', 2),
('2025-04-03 08:00:00', '2025-04-03 12:00:00', 'NO', 3),
('2025-04-04 10:00:00', '2025-04-04 18:00:00', 'SI', 4),
('2025-04-05 08:00:00', '2025-04-05 17:00:00', 'SI', 5),
('2025-04-06 08:00:00', '2025-04-06 14:00:00', 'NO', 6),
('2025-04-07 09:00:00', '2025-04-07 17:00:00', 'SI', 7),
('2025-04-08 08:00:00', '2025-04-08 17:00:00', 'SI', 8),
('2025-04-09 13:00:00', '2025-04-09 18:00:00', 'SI', 9),
('2025-04-10 08:00:00', '2025-04-10 17:00:00', 'NO', 10);

INSERT INTO evaluaciones (nombre) VALUES
('Evaluación teórica trabajo en alturas'),
('Evaluación práctica trabajo en alturas'),
('Evaluación reentrenamiento'),
('Evaluación coordinador de alturas');

INSERT INTO preguntas (pregunta, id_evaluacion) VALUES
('¿Cuál es el objetivo principal del trabajo en alturas?', 1),
('¿Qué elemento es obligatorio para trabajos en alturas?', 1),
('¿Cada cuánto se debe realizar el reentrenamiento?', 3),
('¿Quién supervisa el trabajo en alturas?', 4),
('¿Qué se debe hacer en caso de caída?', 5),
('¿Qué es un espacio confinado?', 6),
('¿Cuál es el primer paso en primeros auxilios?', 7),
('¿Para qué sirve un extintor?', 8),
('¿Qué es seguridad industrial?', 9),
('¿Qué riesgo implica la electricidad?', 10);

INSERT INTO respuestas (respuesta, es_correcta, id_pregunta) VALUES
-- Pregunta 1
('Evitar accidentes laborales', TRUE, 1),
('Aumentar la velocidad de trabajo', FALSE, 1),
('Reducir costos', FALSE, 1),
('Mejorar la estética', FALSE, 1),

-- Pregunta 2
('Arnés de seguridad', TRUE, 2),
('Guantes de tela', FALSE, 2),
('Casco de bicicleta', FALSE, 2),
('Zapatos normales', FALSE, 2),

-- Pregunta 3
('Cada año', TRUE, 3),
('Cada 5 años', FALSE, 3),
('Nunca', FALSE, 3),
('Solo al inicio', FALSE, 3),

-- Pregunta 4
('Coordinador de alturas', TRUE, 4),
('Cualquier trabajador', FALSE, 4),
('Visitantes', FALSE, 4),
('Clientes', FALSE, 4),

-- Pregunta 5
('Activar plan de rescate', TRUE, 5),
('Ignorar el evento', FALSE, 5),
('Salir corriendo', FALSE, 5),
('Apagar equipos', FALSE, 5),

-- Pregunta 6
('Área con ventilación limitada', TRUE, 6),
('Oficina abierta', FALSE, 6),
('Parque', FALSE, 6),
('Zona libre', FALSE, 6),

-- Pregunta 7
('Evaluar la escena', TRUE, 7),
('Salir corriendo', FALSE, 7),
('Ignorar', FALSE, 7),
('Dormir', FALSE, 7),

-- Pregunta 8
('Apagar incendios', TRUE, 8),
('Cortar madera', FALSE, 8),
('Medir temperatura', FALSE, 8),
('Transportar objetos', FALSE, 8),

-- Pregunta 9
('Prevenir riesgos laborales', TRUE, 9),
('Generar ventas', FALSE, 9),
('Hacer publicidad', FALSE, 9),
('Reducir personal', FALSE, 9),

-- Pregunta 10
('Electrocución', TRUE, 10),
('Caídas leves', FALSE, 10),
('Ruido', FALSE, 10),
('Fatiga', FALSE, 10);

INSERT INTO evaluaciones_presentadas (id_trabajador, id_evaluacion, fecha) VALUES
(1, 1, '2025-03-01'),
(2, 2, '2025-03-02'),
(3, 3, '2025-03-03'),
(4, 4, '2025-03-04'),
(5, 5, '2025-03-05'),
(6, 6, '2025-03-06'),
(7, 7, '2025-03-07'),
(8, 8, '2025-03-08'),
(9, 9, '2025-03-09'),
(10, 10, '2025-03-10');
INSERT INTO resultados (id_presentada, puntaje) VALUES
(1, 95.00),
(2, 88.50),
(3, 70.00),
(4, 92.00),
(5, 85.00),
(6, 60.00),
(7, 78.00),
(8, 90.00),
(9, 82.50),
(10, 68.00);
INSERT INTO alertas (id_tipo_alerta, fecha_vencimiento, estado, id_usuario) VALUES
(1, '2025-04-15', 'pendiente', 1),
(2, '2025-04-16', 'enviada', 2),
(3, '2025-04-17', 'pendiente', 3),
(4, '2025-04-18', 'vencida', 4),
(5, '2025-04-19', 'pendiente', 5),
(6, '2025-04-20', 'enviada', 6),
(7, '2025-04-21', 'pendiente', 7),
(8, '2025-04-22', 'vencida', 8),
(9, '2025-04-23', 'pendiente', 9),
(10, '2025-04-24', 'enviada', 10);

INSERT INTO programacion_cursos (id_curso, fecha, hora, cupos, id_usuario) VALUES
(1, '2025-04-10', '08:00:00', 20, 1),
(2, '2025-04-11', '09:00:00', 15, 2),
(3, '2025-04-12', '10:00:00', 25, 3),
(3, '2025-04-13', '08:00:00', 20, 4),
(2, '2025-04-14', '09:00:00', 18, 5),
(2, '2025-04-15', '10:00:00', 22, 6),
(3, '2025-04-16', '08:00:00', 30, 7),
(1, '2025-04-17', '09:00:00', 16, 8),
(1, '2025-04-18', '10:00:00', 20, 9),
(2, '2025-04-19', '08:00:00', 25, 10);

INSERT INTO inscripciones (id_programacion, id_trabajador, estado) VALUES
(1, 1, 'inscrito'),
(2, 2, 'inscrito'),
(3, 3, 'cancelado'),
(4, 4, 'inscrito'),
(5, 5, 'inscrito'),
(6, 6, 'cancelado'),
(7, 7, 'inscrito'),
(8, 8, 'inscrito'),
(9, 9, 'inscrito'),
(10, 10, 'cancelado');

INSERT INTO asistencias (id_inscripcion, asistio) VALUES
(1, TRUE),
(2, TRUE),
(3, FALSE),
(4, TRUE),
(5, TRUE),
(6, FALSE),
(7, TRUE),
(8, TRUE),
(9, TRUE),
(10, FALSE);

INSERT INTO certificados_equipos (id_indumentaria, fecha_emision, fecha_vencimiento, estado) VALUES
(1, '2025-01-01', '2026-01-01', 'apto'),
(2, '2025-01-05', '2026-01-05', 'apto'),
(3, '2025-01-10', '2026-01-10', 'no_apto'),
(4, '2025-01-15', '2026-01-15', 'apto'),
(5, '2025-01-20', '2026-01-20', 'apto'),
(6, '2025-01-25', '2026-01-25', 'no_apto'),
(7, '2025-02-01', '2026-02-01', 'apto'),
(8, '2025-02-05', '2026-02-05', 'apto'),
(9, '2025-02-10', '2026-02-10', 'apto'),
(10, '2025-02-15', '2026-02-15', 'no_apto');
