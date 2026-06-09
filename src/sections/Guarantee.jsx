import { motion, useReducedMotion } from 'framer-motion'
import NodeField from '../components/NodeField'
import RevealSection from '../components/RevealSection'
import PulseButton from '../components/PulseButton'
import { APPLY_URL } from '../lib/links'

const R = 64
const C = 2 * Math.PI * R

// A glowing seal: the ring fills on scroll, stamping the 3X promise.
function Seal() {
  const reduce = useReducedMotion()
  return (
    <div className="relative mx-auto h-44 w-44">
      <div className="absolute inset-0 rounded-full bg-money/10 blur-2xl motion-safe:animate-pulseGlow" aria-hidden="true" />
      <svg viewBox="0 0 160 160" className="relative h-full w-full -rotate-90">
        <defs>
          <linearGradient id="seal-grad" x1="0" y1="0" x2="1" y2="1">
            <stop offset="0%" stopColor="#0EA5E9" />
            <stop offset="100%" stopColor="#10B981" />
          </linearGradient>
        </defs>
        <circle cx="80" cy="80" r={R} fill="none" stroke="rgba(255,255,255,0.08)" strokeWidth="6" />
        <motion.circle
          cx="80" cy="80" r={R} fill="none" stroke="url(#seal-grad)" strokeWidth="6" strokeLinecap="round"
          strokeDasharray={C}
          initial={{ strokeDashoffset: reduce ? 0 : C }}
          whileInView={{ strokeDashoffset: 0 }}
          viewport={{ once: true, margin: '-60px' }}
          transition={{ duration: 1.4, ease: [0.22, 1, 0.36, 1] }}
          style={{ filter: 'drop-shadow(0 0 8px rgba(16,185,129,0.6))' }}
        />
      </svg>
      <div className="absolute inset-0 flex flex-col items-center justify-center">
        <span className="font-display text-5xl font-extrabold text-money">3X</span>
        <span className="mt-1 text-[10px] font-bold uppercase tracking-[0.2em] text-money-300">in 90 days</span>
      </div>
    </div>
  )
}

export default function Guarantee() {
  return (
    <section className="relative overflow-hidden bg-ink py-28">
      <NodeField density="med" intensity={0.7} greenBias={0.85} className="opacity-60" />
      <div className="container-c relative text-center">
        <RevealSection>
          <Seal />
          <span className="mt-8 inline-flex items-center rounded-full border border-money/40 bg-money/10 px-4 py-1.5 text-xs font-bold uppercase tracking-[0.15em] text-money-300">
            3X ROI in 90 days or it's free
          </span>
          <h2 className="mx-auto mt-6 max-w-3xl font-display text-section font-bold text-white">
            Triple your investment in 90 days, <span className="text-money">or you don't pay.</span>
          </h2>
          <p className="mx-auto mt-6 max-w-2xl text-lg leading-relaxed text-slate-400">
            If CaseLift does not return at least 3X what you pay in your first 90 days, your membership is free until it does.
            We track recovery against your real production data, not our word for it. No fine print, no games.
          </p>
          <p className="mt-4 text-sm text-slate-500">Verified against your actual PMS production.</p>
          <div className="mt-9 flex justify-center">
            <PulseButton href={APPLY_URL}>Schedule A Demo</PulseButton>
          </div>
        </RevealSection>
      </div>
    </section>
  )
}
