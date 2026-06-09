import { useRef, useState } from 'react'
import NodeField from '../components/NodeField'
import RevealSection from '../components/RevealSection'
import PulseButton from '../components/PulseButton'
import { APPLY_URL } from '../lib/links'

const fmt$ = (n) => '$' + Math.round(n).toLocaleString()

function Slider({ label, min, max, step, value, onChange, format }) {
  const pct = ((value - min) / (max - min)) * 100
  return (
    <div>
      <div className="flex items-center justify-between text-sm">
        <label className="font-medium text-body">{label}</label>
        <span className="font-display text-lg font-bold text-headline">{format(value)}</span>
      </div>
      <input
        type="range" className="cl-range mt-3 w-full" min={min} max={max} step={step} value={value}
        onChange={(e) => onChange(Number(e.target.value))}
        style={{ '--pct': `${pct}%` }}
        aria-label={label}
      />
    </div>
  )
}

export default function RoiCalculator() {
  const [consults, setConsults] = useState(20)
  const [caseValue, setCaseValue] = useState(15000)
  const [noShowPct, setNoShowPct] = useState(60)
  const [boost, setBoost] = useState(false)
  const boostTimer = useRef(0)

  // Dragging any slider briefly charges up the surrounding node energy.
  const bump = () => {
    setBoost(true)
    clearTimeout(boostTimer.current)
    boostTimer.current = setTimeout(() => setBoost(false), 700)
  }
  const set = (fn) => (v) => { fn(v); bump() }

  const walkPerYear = Math.round(consults * (noShowPct / 100) * 12)
  const lostProduction = walkPerYear * caseValue
  const recoverable = lostProduction * 0.15
  const intensity = Math.min(1, 0.4 + (noShowPct / 100) * 0.6 + (boost ? 0.35 : 0))

  return (
    <section className="relative overflow-hidden bg-paper py-24 sm:py-32">
      <NodeField density="med" intensity={intensity} greenBias={0.3} className="opacity-50" />
      <div className="container-c relative">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">The Cost Of Doing Nothing</p>
          <h2 className="mt-4 font-display text-section font-bold text-headline">See exactly what walks out your door every year</h2>
          <p className="mt-5 text-lg text-muted">
            Drag the sliders to match your practice. Watch how much production leaves without a single structured follow-up.
          </p>
        </RevealSection>

        <RevealSection className="mt-12 grid gap-8 lg:grid-cols-2">
          <div className="space-y-8 rounded-2xl border border-line bg-panel p-7">
            <Slider label="High-value consults per month" min={5} max={120} step={1} value={consults} onChange={set(setConsults)} format={(v) => v} />
            <Slider label="Average case value" min={3000} max={60000} step={500} value={caseValue} onChange={set(setCaseValue)} format={fmt$} />
            <Slider label="Percent that don't schedule same day" min={20} max={90} step={1} value={noShowPct} onChange={set(setNoShowPct)} format={(v) => v + '%'} />
          </div>

          <div className="flex flex-col gap-4">
            <div className="rounded-2xl border border-line bg-panel p-6">
              <div className="font-display text-4xl font-extrabold text-headline">{walkPerYear.toLocaleString()}</div>
              <p className="mt-1 text-sm text-muted">patients walk out every year without scheduling, and most never get a single real follow-up.</p>
            </div>
            <div className="rounded-2xl border border-rose-500/25 bg-rose-500/5 p-6">
              <div className="font-display text-4xl font-extrabold text-rose-600">{fmt$(lostProduction)}</div>
              <p className="mt-1 text-sm text-muted">in production leaving every year.</p>
            </div>
            <div className="rounded-2xl border border-money/40 bg-money/10 p-6 shadow-glow-green">
              <div className={`font-display text-5xl font-extrabold text-money ${boost ? 'flare' : ''}`}>{fmt$(recoverable)}</div>
              <p className="mt-1 text-sm text-money-600">recoverable per year at a conservative 15% recovery rate.</p>
            </div>
          </div>
        </RevealSection>

        <RevealSection className="mt-10 text-center">
          <p className="mx-auto max-w-2xl text-lg text-body">
            CaseLift follows up with every one of those patients automatically, until they schedule or clearly say no.
          </p>
          <div className="mt-7 flex justify-center"><PulseButton href={APPLY_URL}>Schedule A Demo</PulseButton></div>
        </RevealSection>
      </div>
    </section>
  )
}
