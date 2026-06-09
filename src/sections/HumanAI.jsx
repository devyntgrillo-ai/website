import RevealSection, { RevealItem } from '../components/RevealSection'
import GlowCard from '../components/GlowCard'

export default function HumanAI() {
  return (
    <section className="relative bg-ink py-24">
      <div className="container-c">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">Human + AI</p>
          <h2 className="mt-4 font-display text-section font-bold text-white">You are never left to figure it out alone</h2>
        </RevealSection>
        <RevealSection stagger className="mt-12 grid gap-5 md:grid-cols-2">
          <RevealItem>
            <GlowCard border className="h-full p-7">
              <h3 className="font-display text-xl font-bold text-white">Monthly 1-on-1 strategy call</h3>
              <p className="mt-3 text-[15px] leading-relaxed text-slate-400">
                Every month you sit down one on one with a coordinator who has 20 years in the chair and has personally closed seven figures in cases.
                Real coaching on your real patients and your real pipeline. Not a canned webinar.
              </p>
            </GlowCard>
          </RevealItem>
          <RevealItem>
            <GlowCard border className="h-full p-7">
              <h3 className="font-display text-xl font-bold text-white">Live human support</h3>
              <p className="mt-3 text-[15px] leading-relaxed text-slate-400">
                Real people on live chat every business day. A question, a tweak, a tricky patient reply, we are right there with you in minutes.
              </p>
            </GlowCard>
          </RevealItem>
        </RevealSection>
      </div>
    </section>
  )
}
