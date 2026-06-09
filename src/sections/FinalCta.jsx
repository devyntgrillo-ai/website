import NodeField from '../components/NodeField'
import RevealSection from '../components/RevealSection'
import PulseButton from '../components/PulseButton'
import { APPLY_URL } from '../lib/links'

export default function FinalCta() {
  return (
    <section className="relative overflow-hidden bg-ink py-32">
      <NodeField density="high" intensity={1} greenBias={0.4} />
      <div className="absolute inset-0 bg-gradient-to-b from-ink/40 via-ink/20 to-ink" />
      <div className="container-c relative text-center">
        <RevealSection>
          <h2 className="mx-auto max-w-3xl font-display text-section font-bold text-white">
            Ready to recover the cases <span className="text-grad">you are losing?</span>
          </h2>
          <p className="mx-auto mt-6 max-w-2xl text-lg text-slate-300">
            Your coordinator records the consult. CaseLift handles everything after, backed by real humans and our 3X-in-90-days-or-it's-free guarantee.
          </p>
          <div className="mt-9 flex justify-center">
            <PulseButton href={APPLY_URL} className="!px-9 !py-4 !text-base">Schedule A Demo</PulseButton>
          </div>
          <p className="mt-6 text-sm text-slate-400">We onboard a limited number of practices each month. Cancel anytime, no contract.</p>
        </RevealSection>
      </div>
    </section>
  )
}
