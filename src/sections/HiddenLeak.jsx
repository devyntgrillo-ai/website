import { motion, useReducedMotion } from 'framer-motion'
import NodeField from '../components/NodeField'
import RevealSection from '../components/RevealSection'
import StatCounter from '../components/StatCounter'

const STATS = [
  { v: 12, prefix: '5 to ', suffix: '', label: 'Touchpoints most high-value cases need before they close. Most practices manage two.' },
  { v: 44, suffix: '%', label: 'of coordinators quit after a single follow-up attempt.' },
  { v: 92, suffix: '%', label: 'stop following up entirely by the fourth attempt, right when the big cases are getting warm.' },
]

// A small cluster where edges go dark and a pulse leaks off-screen: cases
// the practice earned, then let walk out.
function LeakViz() {
  const reduce = useReducedMotion()
  const NODES = [
    { x: 70, y: 70 }, { x: 150, y: 40 }, { x: 130, y: 130 }, { x: 60, y: 160 }, { x: 200, y: 110 },
  ]
  const EDGES = [[0, 1], [0, 2], [1, 4], [2, 4], [0, 3], [2, 3]]
  return (
    <div className="relative mx-auto h-[280px] w-full max-w-md overflow-hidden">
      <svg viewBox="0 0 360 280" className="h-full w-full" aria-hidden="true">
        {EDGES.map(([a, b], i) => (
          <motion.line
            key={i} x1={NODES[a].x} y1={NODES[a].y} x2={NODES[b].x} y2={NODES[b].y}
            stroke="#60A5FA" strokeWidth="1"
            animate={reduce ? { strokeOpacity: i % 2 ? 0.08 : 0.3 } : { strokeOpacity: i % 2 ? [0.3, 0.04, 0.3] : [0.3, 0.18, 0.3] }}
            transition={reduce ? {} : { duration: 4 + i, repeat: Infinity }}
          />
        ))}
        {NODES.map((n, i) => (
          <motion.circle
            key={i} cx={n.x} cy={n.y} r="3.5" fill="#38BDF8"
            animate={reduce ? { opacity: 0.7 } : { opacity: [0.35, 0.9, 0.35] }}
            transition={reduce ? {} : { duration: 3 + i * 0.5, repeat: Infinity }}
          />
        ))}
        {/* cases leaking off the right edge */}
        {!reduce && [0, 1, 2].map((i) => (
          <motion.circle
            key={`p-${i}`} r="3.5" fill="#38BDF8" cy={70 + i * 50}
            animate={{ cx: [150, 380], opacity: [0, 0.9, 0] }}
            transition={{ duration: 3.4, repeat: Infinity, delay: i * 1.1, ease: 'easeIn' }}
            style={{ filter: 'drop-shadow(0 0 6px #38BDF8)' }}
          />
        ))}
      </svg>
      <div className="pointer-events-none absolute bottom-1 right-2 text-[11px] font-medium uppercase tracking-wide text-faint2">
        cases walking out
      </div>
    </div>
  )
}

export default function HiddenLeak() {
  return (
    <section className="relative overflow-hidden bg-paper py-24 sm:py-32">
      <NodeField density="low" intensity={0.45} greenBias={0.1} className="opacity-50" />
      <div className="container-c relative">
        <div className="grid items-center gap-10 lg:grid-cols-[1.15fr_0.85fr]">
          <RevealSection className="max-w-2xl">
            <p className="eyebrow">The Hidden Leak</p>
            <h2 className="mt-4 font-display text-section font-bold text-headline">
              Your practice already earned these patients. <span className="text-faint">Then it let them walk.</span>
            </h2>
            <p className="mt-6 text-lg leading-relaxed text-muted">
              You spent the marketing dollars. You spent the chair time. The patient heard a five-figure treatment plan and said
              {' '}<span className="text-headline">"let me think about it."</span> Your coordinator followed up once, maybe twice, then moved on.
              That case did not say no. It just never got the nudge it needed. Multiply that by every week of the year.
            </p>
          </RevealSection>
          <RevealSection delay={0.15}>
            <LeakViz />
          </RevealSection>
        </div>

        <RevealSection stagger className="mt-14 grid gap-5 sm:grid-cols-3">
          {STATS.map((s, i) => (
            <div key={i} className="rounded-2xl border border-line bg-panel p-6 transition hover:border-electric/30">
              <div className="font-display text-5xl font-extrabold text-accent">
                {s.prefix}<StatCounter value={s.v} suffix={s.suffix} />
              </div>
              <p className="mt-3 text-sm leading-relaxed text-muted">{s.label}</p>
            </div>
          ))}
        </RevealSection>

        <RevealSection className="mt-12">
          <p className="text-xl font-semibold text-headline">
            That is six and seven figures slipping out the door every year. <span className="text-grad">CaseLift plugs the leak.</span>
          </p>
          <p className="mt-3 text-xs text-faint2">Source: Salesforce</p>
        </RevealSection>
      </div>
    </section>
  )
}
