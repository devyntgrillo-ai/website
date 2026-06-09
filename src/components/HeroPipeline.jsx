import { motion, useReducedMotion } from 'framer-motion'

// A lost patient (cyan pulse) enters left, flows through Listen → Analyze →
// Follow Up, and lands right as a green "Booked" node bursting with a dollar
// figure. Loops. This explains the product before a word is read.
const STAGES = [
  { x: 60, label: 'Listen' },
  { x: 175, label: 'Analyze' },
  { x: 290, label: 'Follow Up' },
]
const END_X = 410
const Y = 70
const LOOP = 5.2

export default function HeroPipeline() {
  const reduce = useReducedMotion()
  return (
    <div className="relative w-full">
      <svg viewBox="0 0 470 140" className="w-full" role="img" aria-label="A patient flows through CaseLift: listen, analyze, follow up, then books and pays.">
        <defs>
          <linearGradient id="hp-line" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0%" stopColor="#0EA5E9" />
            <stop offset="70%" stopColor="#0EA5E9" />
            <stop offset="100%" stopColor="#10B981" />
          </linearGradient>
        </defs>

        {/* track */}
        <line x1="60" y1={Y} x2={END_X} y2={Y} stroke="url(#hp-line)" strokeWidth="2" strokeOpacity="0.35" />

        {/* processing stages */}
        {STAGES.map((s, i) => (
          <g key={s.label}>
            <motion.circle
              cx={s.x} cy={Y} r="9" fill="#0B0F19" stroke="#0EA5E9" strokeWidth="2"
              animate={reduce ? {} : { stroke: ['#1A2235', '#0EA5E9', '#1A2235'] }}
              transition={reduce ? {} : { duration: LOOP, times: [0, (i + 1) * 0.18, 1], repeat: Infinity }}
            />
            <circle cx={s.x} cy={Y} r="3" fill="#38BDF8" />
            <text x={s.x} y={Y + 28} textAnchor="middle" fill="#94A3B8" fontSize="11" fontWeight="600">{s.label}</text>
          </g>
        ))}

        {/* destination: booked + paid */}
        <motion.circle
          cx={END_X} cy={Y} r="12" fill="#10B981"
          animate={reduce ? { opacity: 1 } : { scale: [1, 1, 1.5, 1], opacity: [0.5, 0.5, 1, 0.85] }}
          transition={reduce ? {} : { duration: LOOP, times: [0, 0.72, 0.82, 1], repeat: Infinity }}
          style={{ transformOrigin: `${END_X}px ${Y}px`, filter: 'drop-shadow(0 0 10px #10B981)' }}
        />
        <text x={END_X} y={Y + 28} textAnchor="middle" fill="#6EE7B7" fontSize="11" fontWeight="700">Booked</text>
        <motion.text
          x={END_X} y={Y - 22} textAnchor="middle" fill="#10B981" fontSize="18" fontWeight="800"
          animate={reduce ? { opacity: 1 } : { opacity: [0, 0, 1, 1, 0], y: [Y - 14, Y - 14, Y - 26, Y - 30, Y - 30] }}
          transition={reduce ? {} : { duration: LOOP, times: [0, 0.72, 0.82, 0.95, 1], repeat: Infinity }}
        >+$32,400</motion.text>

        {/* the traveling case */}
        {!reduce && (
          <motion.circle
            r="5" cy={Y}
            animate={{ cx: [50, END_X], fill: ['#38BDF8', '#38BDF8', '#10B981'] }}
            transition={{ duration: LOOP, times: [0, 0.72, 0.82], repeat: Infinity, ease: 'easeInOut' }}
            style={{ filter: 'drop-shadow(0 0 8px currentColor)' }}
          />
        )}
        {/* the lost patient entering */}
        <text x="12" y={Y + 4} fill="#64748B" fontSize="10" fontWeight="600">Lost</text>
      </svg>
    </div>
  )
}
