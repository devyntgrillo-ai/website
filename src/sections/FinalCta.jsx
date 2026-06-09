import NodeField from '../components/NodeField'
import RevealSection from '../components/RevealSection'
import PulseButton from '../components/PulseButton'
import { APPLY_URL } from '../lib/links'

export default function FinalCta() {
  return (
    <section className="relative overflow-hidden bg-paper py-32">
      <NodeField density="med" intensity={0.7} greenBias={0.4} className="opacity-70" />
      <div className="container-c relative text-center">
        <RevealSection>
          <h2 className="mx-auto max-w-3xl font-display text-section font-bold text-headline">
            Ready to recover the cases <span className="text-grad">you are losing?</span>
          </h2>
          <p className="mx-auto mt-6 max-w-2xl text-lg text-body">
            Your coordinator records the consult. CaseLift handles everything after, backed by real humans and our 3X-in-90-days-or-it's-free guarantee.
          </p>
          <div className="mt-9 flex justify-center">
            <PulseButton href={APPLY_URL} className="!px-9 !py-4 !text-base">Schedule A Demo</PulseButton>
          </div>
          <p className="mt-6 text-sm text-muted">We onboard a limited number of practices each month. Cancel anytime, no contract.</p>
        </RevealSection>
      </div>
    </section>
  )
}
