# 🗑️ DELETE — Sistema Integrado TITAN
### Base de Datos: TITAN - ES SEGURIDAD EN ALTURAS SAS
 
---
 
## 🧠 ¿Qué es ON DELETE?
 
Define qué le pasa a los registros **hijos** cuando se **elimina** un registro **padre** en una relación de clave foránea.
 
```sql
FOREIGN KEY (id_columna) REFERENCES tabla_padre(id_columna) ON DELETE [COMPORTAMIENTO];
```
 
---
 
## 🔴 Relaciones críticas — NO perder datos
 
### 👷 `trabajadores` → `empresas`
**RECOMENDADO: RESTRICT**
```sql
FOREIGN KEY (id_empresa) REFERENCES empresas(id_empresa) ON DELETE RESTRICT
```
**¿Por qué?**
- No quieres borrar una empresa y perder trabajadores
- Primero debes reubicar o eliminar trabajadores manualmente
 
---
 
### 👤 `usuarios` → `roles` / `tipo_identificacion`
**RECOMENDADO: RESTRICT**
 
**¿Por qué?**
- Son tablas base del sistema
- No deberían eliminarse si están en uso
 
---
 
### 💰 `pagos` → `facturas`
**RECOMENDADO: RESTRICT** ⚠️
```sql
FOREIGN KEY (id_factura) REFERENCES facturas(id_factura) ON DELETE RESTRICT
```
**¿Por qué?**
- No deberías borrar facturas con pagos
- Tema contable y legal — MUY importante en sistemas reales
 
---
 
### 🏥 `salud` → `trabajadores`
**RECOMENDADO: RESTRICT** ⚠️
```sql
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE RESTRICT
```
**¿Por qué?**
- Son datos médicos (historial importante)
- No deberían borrarse automáticamente
 
---
 
### ⚠️ `accidentes` → `trabajadores`
**RECOMENDADO: RESTRICT** ⚠️
```sql
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE RESTRICT
```
**¿Por qué?**
- Información legal
- Nunca se debería borrar por cascada
 
---
 
## 🟡 Datos opcionales / historial — SET NULL
 
### 📄 `documentos` → `usuarios` / `trabajadores`
**RECOMENDADO: SET NULL**
```sql
FOREIGN KEY (id_usuario)    REFERENCES usuarios(id_usuario)       ON DELETE SET NULL
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE SET NULL
```
**¿Por qué?**
- El documento puede seguir existiendo aunque el usuario ya no exista
- Mantienes historial — muy importante en sistemas reales
 
---
 
### 🚨 `alertas` → `usuarios`
**RECOMENDADO: SET NULL**
```sql
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL
```
**¿Por qué?**
- Puedes querer mantener la alerta aunque el usuario ya no exista
 
---
 
## 🟢 Datos dependientes — CASCADE
 
### 🎓 `inscripciones` → `trabajadores`
**RECOMENDADO: CASCADE**
```sql
FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE CASCADE
```
**¿Por qué?**
- Si eliminas un trabajador, sus inscripciones ya no sirven
- Limpieza automática
 
---
 
### 📅 `asistencias` → `inscripciones`
**RECOMENDADO: CASCADE**
```sql
FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion) ON DELETE CASCADE
```
**¿Por qué?**
- La asistencia depende totalmente de la inscripción
 
---
 
### 🧪 `respuestas` → `preguntas`
**RECOMENDADO: CASCADE**
```sql
FOREIGN KEY (id_pregunta) REFERENCES preguntas(id_pregunta) ON DELETE CASCADE
```
**¿Por qué?**
- Si borras una pregunta, sus respuestas no tienen sentido
 
---
 
### 🧾 `detalle_factura` → `facturas`
**RECOMENDADO: CASCADE**
```sql
FOREIGN KEY (id_factura) REFERENCES facturas(id_factura) ON DELETE CASCADE
```
**¿Por qué?**
- Clásico: si borras la factura → borras sus detalles
 
---
 
## 🧠 Resumen fácil
 
| Tipo de dato | Qué usar |
|---|---|
| Datos críticos (legal, historial) | 🔴 RESTRICT |
| Datos dependientes (hijos claros) | 🟢 CASCADE |
| Datos opcionales / historial | 🟡 SET NULL |
 
---
 
## 🔥 Regla de Oro
 
> ❌ Nunca uses CASCADE en datos financieros o legales  
> ❌ Nunca borres historial importante automáticamente  
> ✅ Usa CASCADE solo en datos "desechables"  
> ✅ Usa RESTRICT cuando tengas duda  
 
---
 
## 🚀 Conclusión — Sistema TITAN
 
| Comportamiento | Tablas |
|---|---|
| 🟢 CASCADE | `inscripciones`, `respuestas`, `detalle_factura`, `asistencias` |
| 🟡 SET NULL | `documentos`, `alertas` |
| 🔴 RESTRICT | `empresas`, `trabajadores`, `pagos`, `accidentes`, `salud` |
