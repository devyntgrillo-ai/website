import RevealSection, { RevealItem } from '../components/RevealSection'
import GlowCard from '../components/GlowCard'

export default function HumanAI() {
  return (
    <section className="relative bg-paper py-16 sm:py-20">
      <div className="container-c">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">Human + AI</p>
          <h2 className="mt-4 font-display text-section font-bold text-headline">You are never left to figure it out alone</h2>
        </RevealSection>
        <RevealSection stagger className="mt-10 grid gap-5 md:grid-cols-2">
          <RevealItem>
            <GlowCard border className="h-full p-7">
              <h3 className="font-display text-xl font-bold text-headline">Monthly 1-on-1 strategy call</h3>
              <p className="mt-3 text-[15px] leading-relaxed text-muted">
                Every month you sit down one on one with a coordinator who has 20 years in the chair and has personally closed seven figures in cases.
                Real coaching on your real patients and your real pipeline. Not a canned webinar.
              </p>
            </GlowCard>
          </RevealItem>
          <RevealItem>
            <GlowCard border className="h-full p-7">
              <h3 className="font-display text-xl font-bold text-headline">Live human support</h3>
              <p className="mt-3 text-[15px] leading-relaxed text-muted">
                Real people on live chat every business day. A question, a tweak, a tricky patient reply, we are right there with you in minutes.
              </p>
            </GlowCard>
          </RevealItem>
        </RevealSection>
      </div>
    </section>
  )
}
