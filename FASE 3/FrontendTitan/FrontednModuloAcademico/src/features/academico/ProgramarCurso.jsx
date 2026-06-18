import { useState } from 'react'
import PageHeader from '../../components/UI/PageHeader'
import Field from '../../components/UI/Field'
import { COLORS, inputStyle } from '../../constants/color'

const API_BASE = '/api/cursos'

function ProgramarCurso({ onToast }) {
  const [form, setForm] = useState({ id_curso: '', id_usuario: '', fecha: '', hora: '', cupos: '' })
  const [loading, setLoading] = useState(false)
  const [errors, setErrors] = useState({})

  const validate = () => {
    const e = {}
    if (!form.id_curso) e.id_curso = 'Selecciona un tipo de curso.'
    if (!form.id_usuario) e.id_usuario = 'Ingresa el ID del instructor.'
    if (!form.fecha) e.fecha = 'Selecciona una fecha.'
    if (!form.hora) e.hora = 'Selecciona una hora.'
    if (!form.cupos || parseInt(form.cupos) < 1) e.cupos = 'El cupo debe ser mayor a 0.'
    return e
  }

  const handleSubmit = async () => {
    const e = validate()
    if (Object.keys(e).length) { setErrors(e); return }
    setErrors({})
    setLoading(true)
    try {
      const res = await fetch(`${API_BASE}/`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          id_curso: parseInt(form.id_curso),
          id_usuario: parseInt(form.id_usuario),
          fecha: form.fecha,
          hora: form.hora,
          cupos: parseInt(form.cupos)
        })
      })
      const data = await res.json()
      if (!res.ok) throw new Error(data.detail || 'Error al programar el curso.')
      onToast(`Curso programado correctamente (ID: ${data.id_programacion})`, 'success')
      setForm({ id_curso: '', id_usuario: '', fecha: '', hora: '', cupos: '' })
    } catch (err) {
      onToast(err.message, 'error')
    } finally {
      setLoading(false)
    }
  }

  const tiposCurso = [
    { value: '1', label: 'Trabajo en alturas — Autorizado' },
    { value: '2', label: 'Trabajo en alturas — Reentrenamiento' },
    { value: '3', label: 'Coordinador de alturas' },
  ]

  return (
    <div>
      <PageHeader title="Programar curso" subtitle="Crea una nueva sesión de formación asignando instructor, fecha, horario y cupos." />
      <div style={{ background: COLORS.white, border: `1px solid ${COLORS.borderGray}`, borderRadius: 12, padding: '28px 32px', maxWidth: 560 }}>
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0 20px' }}>
          <div style={{ gridColumn: '1 / -1' }}>
            <Field label="Tipo de curso" required error={errors.id_curso}>
              <select value={form.id_curso} onChange={e => setForm({ ...form, id_curso: e.target.value })}
                style={{ ...inputStyle, appearance: 'none' }}>
                <option value="">Seleccionar...</option>
                {tiposCurso.map(t => <option key={t.value} value={t.value}>{t.label}</option>)}
              </select>
            </Field>
          </div>
          <div style={{ gridColumn: '1 / -1' }}>
            <Field label="ID del instructor" required error={errors.id_usuario}>
              <input type="number" placeholder="Ej: 5" value={form.id_usuario}
                onChange={e => setForm({ ...form, id_usuario: e.target.value })} style={inputStyle} />
            </Field>
          </div>
          <Field label="Fecha" required error={errors.fecha}>
            <input type="date" value={form.fecha}
              onChange={e => setForm({ ...form, fecha: e.target.value })} style={inputStyle} />
          </Field>
          <Field label="Hora de inicio" required error={errors.hora}>
            <input type="time" value={form.hora}
              onChange={e => setForm({ ...form, hora: e.target.value })} style={inputStyle} />
          </Field>
          <div style={{ gridColumn: '1 / -1' }}>
            <Field label="Cupo máximo" required error={errors.cupos}>
              <input type="number" min="1" placeholder="Ej: 15" value={form.cupos}
                onChange={e => setForm({ ...form, cupos: e.target.value })} style={inputStyle} />
            </Field>
          </div>
        </div>
        <div style={{ borderTop: `1px solid ${COLORS.borderGray}`, paddingTop: 20, marginTop: 8 }}>
          <button onClick={handleSubmit} disabled={loading} style={{
            background: loading ? '#ccc' : COLORS.red, color: COLORS.white,
            border: 'none', borderRadius: 8, padding: '10px 28px',
            fontSize: 14, fontWeight: 600, cursor: loading ? 'not-allowed' : 'pointer'
          }}>
            {loading ? 'Guardando...' : 'Programar curso'}
          </button>
        </div>
      </div>
    </div>
  )
}
export default ProgramarCurso;
