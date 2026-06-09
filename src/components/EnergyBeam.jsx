import { useId } from 'react'
import { motion, useReducedMotion } from 'framer-motion'

/**
 * A vertical light beam connecting one section into the next. A faint current
 * flows down it continuously; a bright pulse "fires" down the path once when it
 * scrolls into view. Static gradient line when prefers-reduced-motion.
 */
export default function EnergyBeam({ height = 120, className = '' }) {
  const reduce = useReducedMotion()
  const uid = useId().replace(/:/g, '')
  return (
    <div className={`relative flex justify-center ${className}`} aria-hidden="true" style={{ height }}>
      <svg width="6" height={height} viewBox={`0 0 6 ${height}`} className="overflow-visible">
        <defs>
          <linearGradient id={`beam-${uid}`} x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stopColor="#0EA5E9" stopOpacity="0" />
            <stop offset="45%" stopColor="#0EA5E9" stopOpacity="0.65" />
            <stop offset="100%" stopColor="#10B981" stopOpacity="0" />
          </linearGradient>
        </defs>

        {/* the conduit */}
        <line x1="3" y1="0" x2="3" y2={height} stroke={`url(#beam-${uid})`} strokeWidth="1.5" />

        {!reduce && (
          <>
            {/* continuous faint current so the path always feels live */}
            <motion.circle
              cx="3" r="1.6" fill="#38BDF8" fillOpacity="0.6"
              animate={{ cy: [0, height], opacity: [0, 0.7, 0.7, 0] }}
              transition={{ duration: 2.6, repeat: Infinity, ease: 'linear', repeatDelay: 0.6 }}
              style={{ filter: 'drop-shadow(0 0 4px #38BDF8)' }}
            />
            {/* bright pulse that fires once as the next section arrives */}
            <motion.circle
              cx="3" r="3.4" fill="#7DD3FC"
              initial={{ cy: 0, opacity: 0 }}
              whileInView={{ cy: [0, height], opacity: [0, 1, 1, 0] }}
              viewport={{ once: true, margin: '-30px' }}
              transition={{ duration: 1, ease: [0.22, 1, 0.36, 1] }}
              style={{ filter: 'drop-shadow(0 0 9px #38BDF8)' }}
            />
          </>
        )}
      </svg>
    </div>
  )
}
