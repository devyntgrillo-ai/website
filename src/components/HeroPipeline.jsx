import { useEffect, useState } from 'react'
import { motion, useReducedMotion } from 'framer-motion'

// A lost patient (cyan pulse) enters left, flows through Listen → Analyze →
// Follow Up, and lands right as a green "Booked" node bursting with a dollar
// figure. Loops, cycling realistic case values. This explains the product
// before a word is read.
const STAGES = [
  { x: 120, label: 'Listen' },
  { x: 220, label: 'Analyze' },
  { x: 320, label: 'Follow Up' },
]
const START_X = 56
const END_X = 420
const Y = 96
const LOOP = 5.2
const VALUES = ['+$28,500', '+$41,000', '+$26,400', '+$32,400']

// Faint ambient nodes that tie the pipeline into the background mesh.
const AMBIENT = [
  { x: 90, y: 34, to: 0 }, { x: 250, y: 30, to: 1 },
  { x: 180, y: 162, to: 0 }, { x: 360, y: 158, to: 2 }, { x: 400, y: 40, to: 2 },
]

export default function HeroPipeline() {
  const reduce = useReducedMotion()
  const [vi, setVi] = useState(0)

  useEffect(() => {
    if (reduce) return
    const id = setInterval(() => setVi((v) => (v + 1) % VALUES.length), LOOP * 1000)
    return () => clearInterval(id)
  }, [reduce])

  return (
    <div className="relative w-full">
      <svg viewBox="0 0 480 200" className="w-full" role="img" aria-label="A patient flows through CaseLift: listen, analyze, follow up, then books and pays.">
        <defs>
          <linearGradient id="hp-line" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0%" stopColor="#0EA5E9" />
            <stop offset="68%" stopColor="#0EA5E9" />
            <stop offset="100%" stopColor="#10B981" />
          </linearGradient>
        </defs>

        {/* ambient mesh wiring the pipeline into the background field */}
        {AMBIENT.map((a, i) => {
          const t = STAGES[a.to]
          return (
            <g key={i}>
              <line x1={a.x} y1={a.y} x2={t.x} y2={Y} stroke="#60A5FA" strokeWidth="1" strokeOpacity="0.14" />
              <motion.circle
                cx={a.x} cy={a.y} r="2.4" fill="#38BDF8"
                animate={reduce ? { opacity: 0.4 } : { opacity: [0.2, 0.6, 0.2] }}
                transition={reduce ? {} : { duration: 3 + i * 0.6, repeat: Infinity }}
              />
            </g>
          )
        })}

        {/* main track */}
        <line x1={START_X} y1={Y} x2={END_X} y2={Y} stroke="url(#hp-line)" strokeWidth="2.5" strokeOpacity="0.4" />

        {/* processing stages */}
        {STAGES.map((s, i) => (
          <g key={s.label}>
            <motion.circle
              cx={s.x} cy={Y} r="12" fill="#0B0F19" stroke="#0EA5E9" strokeWidth="2.5"
              animate={reduce ? {} : { stroke: ['#1A2235', '#38BDF8', '#1A2235'], filter: ['drop-shadow(0 0 0px #0EA5E9)', 'drop-shadow(0 0 9px #0EA5E9)', 'drop-shadow(0 0 0px #0EA5E9)'] }}
              transition={reduce ? {} : { duration: LOOP, times: [0, (i + 1) * 0.2, 1], repeat: Infinity }}
            />
            <circle cx={s.x} cy={Y} r="4" fill="#38BDF8" />
            <text x={s.x} y={Y + 34} textAnchor="middle" fill="#94A3B8" fontSize="13" fontWeight="600">{s.label}</text>
          </g>
        ))}

        {/* destination: booked + paid */}
        <motion.circle
          cx={END_X} cy={Y} r="16" fill="#10B981"
          animate={reduce ? { opacity: 1 } : { scale: [1, 1, 1.55, 1], opacity: [0.45, 0.45, 1, 0.85] }}
          transition={reduce ? {} : { duration: LOOP, times: [0, 0.74, 0.84, 1], repeat: Infinity }}
          style={{ transformOrigin: `${END_X}px ${Y}px`, filter: 'drop-shadow(0 0 14px #10B981)' }}
        />
        <text x={END_X} y={Y + 34} textAnchor="middle" fill="#6EE7B7" fontSize="13" fontWeight="700">Booked</text>
        <motion.text
          key={vi}
          x={END_X} y={Y - 26} textAnchor="middle" fill="#34D399" fontSize="24" fontWeight="800"
          animate={reduce ? { opacity: 1 } : { opacity: [0, 0, 1, 1, 0], y: [Y - 16, Y - 16, Y - 32, Y - 38, Y - 38] }}
          transition={reduce ? {} : { duration: LOOP, times: [0, 0.74, 0.84, 0.96, 1], repeat: Infinity }}
          style={{ filter: 'drop-shadow(0 0 10px rgba(16,185,129,0.7))' }}
        >{VALUES[vi]}</motion.text>

        {/* the traveling case: dim at Lost, brightening to green at Booked */}
        {!reduce && (
          <motion.circle
            r="6" cy={Y}
            animate={{ cx: [START_X - 6, END_X], fill: ['#1E6FA0', '#38BDF8', '#10B981'], scale: [0.7, 1, 1.2] }}
            transition={{ duration: LOOP, times: [0, 0.74, 0.84], repeat: Infinity, ease: 'easeInOut' }}
            style={{ filter: 'drop-shadow(0 0 9px currentColor)' }}
          />
        )}
        {/* the lost patient entering */}
        <text x="12" y={Y + 4} fill="#64748B" fontSize="12" fontWeight="600">Lost</text>
      </svg>
    </div>
  )
}
