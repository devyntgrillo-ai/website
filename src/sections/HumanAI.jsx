import { motion, useReducedMotion } from 'framer-motion'
import RevealSection, { RevealItem } from '../components/RevealSection'
import GlowCard from '../components/GlowCard'

// Human and AI shown as one connected system: two nodes, a pulse flowing between.
function HumanAINode() {
  const reduce = useReducedMotion()
  const AX = 78, BX = 282, Y = 96
  return (
    <div className="relative w-full">
      <svg viewBox="0 0 360 200" className="w-full" role="img" aria-label="A human coordinator and CaseLift AI wired together as one system.">
        <defs>
          <linearGradient id="ha-line" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0%" stopColor="#0EA5E9" /><stop offset="100%" stopColor="#10B981" />
          </linearGradient>
        </defs>

        <line x1={AX} y1={Y} x2={BX} y2={Y} stroke="url(#ha-line)" strokeWidth="2" strokeOpacity="0.45" />

        {/* pulse flowing between the two (back and forth) */}
        {!reduce && (
          <motion.circle
            r="5" cy={Y}
            animate={{ cx: [AX, BX, AX], fill: ['#0EA5E9', '#10B981', '#0EA5E9'] }}
            transition={{ duration: 3.4, repeat: Infinity, ease: 'easeInOut' }}
          />
        )}

        {/* Human node */}
        <circle cx={AX} cy={Y} r="30" fill="#E0F2FE" stroke="#0EA5E9" strokeWidth="2" />
        <g transform={`translate(${AX - 11}, ${Y - 13})`} fill="none" stroke="#0369A1" strokeWidth="2" strokeLinecap="round">
          <circle cx="11" cy="8" r="5.5" /><path d="M2 24c0-5 4-8.5 9-8.5s9 3.5 9 8.5" />
        </g>
        <text x={AX} y={Y + 52} textAnchor="middle" fill="#0F172A" fontSize="13" fontWeight="700">Your coordinator</text>

        {/* AI node */}
        <circle cx={BX} cy={Y} r="30" fill="#ECFDF5" stroke="#10B981" strokeWidth="2" />
        <g transform={`translate(${BX - 11}, ${Y - 11})`} fill="none" stroke="#047857" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <rect x="3" y="4" width="16" height="14" rx="3" /><path d="M11 4V1M7 9h0M15 9h0M8 14h6" />
        </g>
        <text x={BX} y={Y + 52} textAnchor="middle" fill="#0F172A" fontSize="13" fontWeight="700">CaseLift AI</text>
      </svg>
    </div>
  )
}

export default function HumanAI() {
  return (
    <section className="relative bg-paper py-16 sm:py-20">
      <div className="container-c">
        <RevealSection className="max-w-3xl">
          <p className="eyebrow">Human + AI</p>
          <h2 className="mt-4 font-display text-section font-bold text-headline">
            Most AI tools hand you a login and vanish. <span className="text-grad">CaseLift hands you a team.</span>
          </h2>
          <p className="mt-5 max-w-2xl text-lg leading-relaxed text-body">
            Every membership comes with real people who close cases for a living, not a chatbot and a help doc.
          </p>
        </RevealSection>

        <div className="mt-12 grid items-center gap-6 lg:grid-cols-[0.9fr_1.1fr]">
          <RevealSection delay={0.1}>
            <GlowCard className="p-7">
              <HumanAINode />
            </GlowCard>
          </RevealSection>

          <RevealSection stagger className="grid gap-5 sm:grid-cols-2">
            <RevealItem>
              <GlowCard className="h-full p-7">
                <h3 className="font-display text-xl font-bold text-headline">Monthly 1-on-1 strategy call</h3>
                <p className="mt-3 text-[15px] leading-relaxed text-body">
                  Sit down every month with a coordinator who has 20 years in the chair and seven figures in closed cases.
                  Real coaching on your real pipeline. Not a webinar.
                </p>
              </GlowCard>
            </RevealItem>
            <RevealItem>
              <GlowCard className="h-full p-7">
                <h3 className="font-display text-xl font-bold text-headline">Live human support</h3>
                <p className="mt-3 text-[15px] leading-relaxed text-body">
                  Real people on chat every business day. A tricky reply, a tweak, a question, answered in minutes.
                </p>
              </GlowCard>
            </RevealItem>
          </RevealSection>
        </div>
      </div>
    </section>
  )
}
