# CONSULTAS, UPDATE Y DELETE

## BETWEEN — Rangos de fechas y números

```sql
-- Certificados emitidos en 2025
SELECT codigo, fecha_emision
FROM certificados
WHERE fecha_emision BETWEEN '2025-01-01' AND '2025-12-31';

-- Certificados que vencen entre el 1 de marzo y el 30 de marzo de 2026
SELECT *
FROM certificados
WHERE fecha_vencimiento BETWEEN '2026-03-01' AND '2026-03-30';

-- Accidentes en febrero 2025
SELECT lugar, fecha
FROM accidentes
WHERE fecha BETWEEN '2025-02-01' AND '2025-02-28';

-- Evaluaciones presentadas en marzo
SELECT *
FROM evaluaciones_presentadas
WHERE fecha BETWEEN '2025-03-01' AND '2025-03-31';
```

---

## IN — Lista de valores específicos

```sql
-- Trabajadores de ciertas empresas
SELECT nombre, id_empresa
FROM trabajadores
WHERE id_empresa IN (1, 5, 10);

-- Alertas críticas
SELECT *
FROM alertas
WHERE estado IN ('pendiente', 'vencida');

-- Tipos de accidente peligrosos
SELECT *
FROM tipos_accidente
WHERE nombre IN ('Caída de altura', 'Electrocución');
```

---

## IS NULL — Registros sin valor

```sql
-- Documentos de trabajadores (sin usuario asignado)
SELECT nombre, ruta_archivo
FROM documentos
WHERE id_usuario IS NULL;

-- Documentos de usuarios (sin trabajador asignado)
SELECT nombre
FROM documentos
WHERE id_trabajador IS NULL;

-- Usuarios sin empresa
SELECT nombre
FROM usuarios
WHERE id_empresa IS NULL;

-- Trabajadores sin correo
SELECT nombre, apellido
FROM trabajadores
WHERE correo IS NULL;
```

---

## Combinaciones — Lo que piden en parciales


### BETWEEN + IN
```sql
SELECT monto, id_metodo
FROM pagos
WHERE monto BETWEEN 100000 AND 500000
AND id_metodo IN (1, 2, 3);
```

### LIKE + BETWEEN
```sql
SELECT codigo, fecha_emision
FROM certificados
WHERE codigo LIKE 'CERT%'
AND fecha_emision BETWEEN '2025-01-01' AND '2025-06-30';
```

 ```
### `trabajadores` → `empresas`
**RESTRICT**
```sql
FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa) ON DELETE RESTRICT
```
**¿Por qué?**
- No quieres borrar una empresa y perder trabajadores
- Primero debes reubicar o eliminar trabajadores manualmente
 
---
 
### `usuarios` → `roles` / `tipo_identificacion`
**RESTRICT**
 
**¿Por qué?**
- Son tablas base del sistema
- No deberían eliminarse si están en uso
 
---
 
### `pagos` → `facturas`
**RESTRICT** 
```sql
FOREIGN KEY (id_factura) REFERENCES facturas(id_factura) ON DELETE RESTRICT
```
**¿Por qué?**
- No deberías borrar facturas con pagos
- Tema contable y legal — MUY importante en sistemas reales
 
---
 
### `salud` → `trabajadores`
**RESTRICT** 
```sql
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE RESTRICT
```
**¿Por qué?**
- Son datos médicos (historial importante)
- No deberían borrarse automáticamente
 
---
 
### `accidentes` → `trabajadores`
**RESTRICT** 
```sql
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE RESTRICT
```
**¿Por qué?**
- Información legal
- Nunca se debería borrar por cascada
 
---
 
### `documentos` → `usuarios` / `trabajadores`
**SET NULL**
```sql
FOREIGN KEY (id_usuario)    REFERENCES usuarios(id_usuario)       ON DELETE SET NULL
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE SET NULL
```
**¿Por qué?**
- El documento puede seguir existiendo aunque el usuario ya no exista
- Mantienes historial — muy importante en sistemas reales
 
---
 
### `alertas` → `usuarios`
**SET NULL**
```sql
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL
```
**¿Por qué?**
- Puedes querer mantener la alerta aunque el usuario ya no exista
 
---
 
### `inscripciones` → `trabajadores`
**CASCADE**
```sql
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE CASCADE
```
**¿Por qué?**
- Si eliminas un trabajador, sus inscripciones ya no sirven
- Limpieza automática
 
---
 
### `asistencias` → `inscripciones`
**CASCADE**
```sql
FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion) ON DELETE CASCADE
```
**¿Por qué?**
- La asistencia depende totalmente de la inscripción
 
---
 
### `respuestas` → `preguntas`
**CASCADE**
```sql
FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta) ON DELETE CASCADE
```
**¿Por qué?**
- Si borras una pregunta, sus respuestas no tienen sentido
 
---
 
### `detalle_factura` → `facturas`
**CASCADE**
```sql
FOREIGN KEY (id_factura) REFERENCES facturas(id_factura) ON DELETE CASCADE
```
**¿Por qué?**
- Clásico: si borras la factura → borras sus detalles
 
---
