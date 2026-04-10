# 🔍 SELECT con Filtros — Sistema Integrado TITAN
### Base de Datos: TITAN - ES SEGURIDAD EN ALTURAS SAS

---

## 🧠 ¿Qué es SELECT con filtros?

`SELECT` es la instrucción SQL para **consultar y leer datos**. Los filtros se usan en la cláusula `WHERE` para obtener solo los registros que necesitas.

```sql
SELECT columnas
FROM tabla
WHERE condicion;
```

---

## 🔤 LIKE — Búsqueda por patrones de texto

| Patrón | Significado |
|--------|-------------|
| `'C%'` | Empieza por C |
| `'%SAS%'` | Contiene SAS |
| `'%ez'` | Termina en ez |

```sql
-- Usuarios cuyo nombre empieza por "C"
SELECT nombre, correo
FROM usuarios
WHERE nombre LIKE 'C%';

-- Empresas que contienen "SAS"
SELECT nombre
FROM empresas
WHERE nombre LIKE '%SAS%';

-- Trabajadores con apellido terminado en "ez"
SELECT nombre, apellido
FROM trabajadores
WHERE apellido LIKE '%ez';

-- Cursos que contienen "alturas"
SELECT nombre_curso
FROM cursos
WHERE nombre_curso LIKE '%alturas%';

-- Documentos que contienen la palabra "Certificado"
SELECT nombre
FROM documentos
WHERE nombre LIKE '%Certificado%';
```

---

## 🔢 BETWEEN — Rangos de fechas y números

```sql
-- Certificados emitidos en 2025
SELECT codigo, fecha_emision
FROM certificados
WHERE fecha_emision BETWEEN '2025-01-01' AND '2025-12-31';

-- Pagos entre 200k y 500k
SELECT monto, id_factura
FROM pagos
WHERE monto BETWEEN 200000 AND 500000;

-- Cursos entre 20 y 60 horas
SELECT nombre_curso, intensidad_horaria
FROM cursos
WHERE intensidad_horaria BETWEEN 20 AND 60;

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

## 📋 IN — Lista de valores específicos

```sql
-- Usuarios con roles importantes
SELECT nombre, id_rol
FROM usuarios
WHERE id_rol IN (1, 2, 3);

-- Trabajadores de ciertas empresas
SELECT nombre, id_empresa
FROM trabajadores
WHERE id_empresa IN (1, 5, 10);

-- Alertas críticas
SELECT *
FROM alertas
WHERE estado IN ('pendiente', 'vencida');

-- Métodos de pago digitales
SELECT *
FROM metodo_pago
WHERE nombre IN ('Nequi', 'Daviplata', 'PSE');

-- Tipos de accidente peligrosos
SELECT *
FROM tipos_accidente
WHERE nombre IN ('Caída de altura', 'Electrocución');
```

---

## ⚠️ IS NULL — Registros sin valor

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

## 🔥 Combinaciones — Lo que piden en parciales

### LIKE + IN
```sql
SELECT nombre, id_rol
FROM usuarios
WHERE nombre LIKE 'C%'
AND id_rol IN (1, 2);
```

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

### IS NULL + LIKE
```sql
SELECT nombre
FROM documentos
WHERE id_usuario IS NULL
AND nombre LIKE '%Certificado%';
```

---

## 🧠 Resumen de filtros

| Filtro | Para qué sirve | Ejemplo |
|--------|---------------|---------|
| `LIKE` | Buscar por texto | `nombre LIKE 'C%'` |
| `BETWEEN` | Rangos de valores | `monto BETWEEN 100 AND 500` |
| `IN` | Lista de opciones | `id_rol IN (1,2,3)` |
| `IS NULL` | Sin valor asignado | `correo IS NULL` |

---

## 🔥 Regla de Oro

> ✅ `SELECT` nunca modifica datos — solo los **lee**  
> ✅ Combina filtros con `AND` / `OR` para consultas más precisas  
> ✅ Siempre prueba tus filtros con SELECT antes de hacer UPDATE o DELETE
