import { motion, useReducedMotion } from 'framer-motion'

/** A vertical light beam between sections; a bright pulse fires down it on view. */
export default function EnergyBeam({ height = 90, className = '' }) {
  const reduce = useReducedMotion()
  return (
    <div className={`relative flex justify-center ${className}`} aria-hidden="true" style={{ height }}>
      <svg width="4" height={height} viewBox={`0 0 4 ${height}`} className="overflow-visible">
        <defs>
          <linearGradient id={`beam-${height}`} x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stopColor="#0EA5E9" stopOpacity="0" />
            <stop offset="50%" stopColor="#0EA5E9" stopOpacity="0.5" />
            <stop offset="100%" stopColor="#10B981" stopOpacity="0" />
          </linearGradient>
        </defs>
        <line x1="2" y1="0" x2="2" y2={height} stroke={`url(#beam-${height})`} strokeWidth="2" />
        {!reduce && (
          <motion.circle
            cx="2" r="2.6" fill="#38BDF8"
            initial={{ cy: 0, opacity: 0 }}
            whileInView={{ cy: [0, height], opacity: [0, 1, 1, 0] }}
            viewport={{ once: true, margin: '-40px' }}
            transition={{ duration: 1.1, ease: 'easeInOut' }}
            style={{ filter: 'drop-shadow(0 0 6px #38BDF8)' }}
          />
        )}
      </svg>
    </div>
  )
}
