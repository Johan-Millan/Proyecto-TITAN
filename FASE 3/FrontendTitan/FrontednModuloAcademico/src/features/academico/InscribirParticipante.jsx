import { useState } from 'react'
import PageHeader from '../../components/UI/PageHeader'
import Field from '../../components/UI/Field'
import { COLORS, inputStyle } from '../../constants/color'

const API_BASE = '/api/cursos'

function InscribirParticipante({ onToast }) {
  const [form, setForm] = useState({ id_programacion: '', id_usuario: '' })
  const [loading, setLoading] = useState(false)
  const [errors, setErrors] = useState({})
  const [resultado, setResultado] = useState(null)

  const validate = () => {
    const e = {}
    if (!form.id_programacion) e.id_programacion = 'Ingresa el ID de la programación.'
    if (!form.id_usuario) e.id_usuario = 'Ingresa el ID del participante.'
    return e
  }

  const handleSubmit = async () => {
    const e = validate()
    if (Object.keys(e).length) { setErrors(e); return }
    setErrors({})
    setResultado(null)
    setLoading(true)
    try {
      const res = await fetch(`${API_BASE}/${form.id_programacion}/inscribir`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id_usuario: parseInt(form.id_usuario) })
      })
      const data = await res.json()
      if (!res.ok) throw new Error(data.detail || 'Error al inscribir al participante.')
      setResultado(data)
      onToast('Participante inscrito correctamente.', 'success')
      setForm({ id_programacion: '', id_usuario: '' })
    } catch (err) {
      onToast(err.message, 'error')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div>
      <PageHeader title="Inscribir participante" subtitle="Formaliza la matrícula de un participante en un curso programado." />
      <div style={{ display: 'flex', gap: 24, flexWrap: 'wrap', alignItems: 'flex-start' }}>
        <div style={{ background: COLORS.white, border: `1px solid ${COLORS.borderGray}`, borderRadius: 12, padding: '28px 32px', flex: '1 1 320px', maxWidth: 480 }}>
          <Field label="ID de la programación del curso" required error={errors.id_programacion}>
            <input type="number" placeholder="Ej: 17" value={form.id_programacion}
              onChange={e => setForm({ ...form, id_programacion: e.target.value })} style={inputStyle} />
          </Field>
          <Field label="ID del participante" required error={errors.id_usuario}>
            <input type="number" placeholder="Ej: 3" value={form.id_usuario}
              onChange={e => setForm({ ...form, id_usuario: e.target.value })} style={inputStyle} />
          </Field>
          <div style={{ borderTop: `1px solid ${COLORS.borderGray}`, paddingTop: 20, marginTop: 8 }}>
            <button onClick={handleSubmit} disabled={loading} style={{
              background: loading ? '#ccc' : COLORS.red, color: COLORS.white,
              border: 'none', borderRadius: 8, padding: '10px 28px',
              fontSize: 14, fontWeight: 600, cursor: loading ? 'not-allowed' : 'pointer'
            }}>
              {loading ? 'Inscribiendo...' : 'Inscribir participante'}
            </button>
          </div>
          <div style={{ marginTop: 20, padding: '14px 16px', background: '#FFF8F8', border: '1px solid #F7C1C1', borderRadius: 8, fontSize: 13, color: COLORS.textSecondary }}>
            <strong style={{ color: COLORS.textPrimary, display: 'block', marginBottom: 6 }}>Validaciones automáticas</strong>
            <ul style={{ margin: 0, paddingLeft: 18, lineHeight: 1.8 }}>
              <li>Cupos disponibles en el curso</li>
              <li>Inscripción duplicada</li>
              <li>Aptitud médica vigente</li>
              <li>Certificado previo (cursos de reentrenamiento)</li>
            </ul>
          </div>
        </div>
        {resultado && (
          <div style={{ background: COLORS.successBg, border: '1px solid #C0DD97', borderRadius: 12, padding: '24px 28px', flex: '0 0 220px' }}>
            <p style={{ fontWeight: 700, color: COLORS.successText, margin: '0 0 16px 0', fontSize: 15 }}>✔ Inscripción exitosa</p>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
              <div>
                <p style={{ fontSize: 11, color: '#639922', margin: '0 0 2px 0', fontWeight: 600, textTransform: 'uppercase', letterSpacing: 0.5 }}>N.° inscripción</p>
                <p style={{ fontSize: 24, fontWeight: 700, color: COLORS.successText, margin: 0 }}>#{resultado.id_inscripcion}</p>
              </div>
              <div>
                <p style={{ fontSize: 11, color: '#639922', margin: '0 0 2px 0', fontWeight: 600, textTransform: 'uppercase', letterSpacing: 0.5 }}>Cupos restantes</p>
                <p style={{ fontSize: 24, fontWeight: 700, color: COLORS.successText, margin: 0 }}>{resultado.cupos_restantes}</p>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

export default InscribirParticipante;
