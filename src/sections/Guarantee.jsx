import NodeField from '../components/NodeField'
import RevealSection from '../components/RevealSection'
import PulseButton from '../components/PulseButton'
import { APPLY_URL } from '../lib/links'

export default function Guarantee() {
  return (
    <section className="relative overflow-hidden bg-ink py-28">
      <NodeField density="med" intensity={0.6} greenBias={0.85} className="opacity-50" />
      <div className="container-c relative text-center">
        <RevealSection>
          <span className="inline-flex items-center rounded-full border border-money/40 bg-money/10 px-4 py-1.5 text-xs font-bold uppercase tracking-[0.15em] text-money-300">
            3X ROI in 90 days or it's free
          </span>
          <h2 className="mx-auto mt-8 max-w-3xl font-display text-section font-bold text-white">
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
