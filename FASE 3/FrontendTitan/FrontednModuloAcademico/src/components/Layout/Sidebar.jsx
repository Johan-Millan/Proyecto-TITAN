import { NavLink } from 'react-router-dom'
import { COLORS } from '../../constants/color'

const items = [
  { to: '/calendario',  label: 'Calendario',            icon: '📅' },
  { to: '/programar',   label: 'Programar curso',        icon: '➕' },
  { to: '/inscribir',   label: 'Inscribir participante', icon: '📋' },
]

function Sidebar() {
  return (
    <aside style={{
      width: 230, background: COLORS.blue, minHeight: '100vh',
      display: 'flex', flexDirection: 'column', padding: '0 0 24px 0', flexShrink: 0
    }}>
      <div style={{
        padding: '28px 20px 20px 20px',
        borderBottom: '1px solid rgba(255,255,255,0.12)', marginBottom: 12
      }}>
        <div style={{
          background: COLORS.white, borderRadius: 8, padding: '10px 12px',
          display: 'flex', alignItems: 'center', justifyContent: 'center'
        }}>
          <span style={{
            fontWeight: 900, fontSize: 17, color: COLORS.red,
            letterSpacing: 1, fontFamily: 'Impact, Arial Black, sans-serif'
          }}>TITAN-ES</span>
        </div>
        <p style={{
          color: 'rgba(255,255,255,0.55)', fontSize: 11,
          margin: '8px 0 0 0', textAlign: 'center', letterSpacing: 0.5
        }}>SEGURIDAD EN ALTURAS</p>
      </div>

      <nav style={{ padding: '0 12px' }}>
        <p style={{
          color: 'rgba(255,255,255,0.4)', fontSize: 10, fontWeight: 600,
          letterSpacing: 1.2, margin: '8px 8px 8px 8px', textTransform: 'uppercase'
        }}>Módulo académico</p>

        {items.map(item => (
          <NavLink key={item.to} to={item.to} style={({ isActive }) => ({
            display: 'flex', alignItems: 'center', gap: 10, width: '100%',
            background: isActive ? COLORS.red : 'transparent',
            color: COLORS.white, borderRadius: 8,
            padding: '10px 14px', fontSize: 14,
            fontWeight: isActive ? 600 : 400,
            marginBottom: 2, textDecoration: 'none',
            transition: 'background 0.15s'
          })}>
            <span style={{ fontSize: 16 }}>{item.icon}</span>
            {item.label}
          </NavLink>
        ))}
      </nav>
    </aside>
  )
}

export default Sidebar;