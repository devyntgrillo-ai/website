import { motion, useReducedMotion } from 'framer-motion'
import HeroPipeline from '../components/HeroPipeline'
import GlowCard from '../components/GlowCard'
import PulseButton from '../components/PulseButton'
import RevealSection from '../components/RevealSection'
import NodeField from '../components/NodeField'
import { APPLY_URL } from '../lib/links'

// Headline words rise in with a quick stagger on load.
function Headline() {
  const reduce = useReducedMotion()
  const line1 = ['Close', 'more', 'big', 'cases.']
  const line2 = ['Chase', 'zero', 'patients.']
  const word = {
    hidden: { opacity: 0, y: 24 },
    show: { opacity: 1, y: 0, transition: { duration: 0.55, ease: [0.22, 1, 0.36, 1] } },
  }
  const Wrap = reduce ? 'h1' : motion.h1
  const props = reduce
    ? {}
    : { initial: 'hidden', animate: 'show', variants: { show: { transition: { staggerChildren: 0.07 } } } }
  const Word = reduce ? 'span' : motion.span
  return (
    <Wrap {...props} className="font-display text-[clamp(2.5rem,5vw,4.25rem)] font-extrabold leading-[1.04] tracking-tight text-headline">
      <span className="block">
        {line1.map((w, i) => (
          <Word key={i} variants={reduce ? undefined : word} className="mr-[0.28em] inline-block">{w}</Word>
        ))}
      </span>
      <span className="block text-grad">
        {line2.map((w, i) => (
          <Word key={i} variants={reduce ? undefined : word} className="mr-[0.28em] inline-block">{w}</Word>
        ))}
      </span>
    </Wrap>
  )
}

export default function Hero() {
  return (
    <section id="top" className="relative isolate overflow-hidden bg-paper pt-28 pb-20 sm:pt-36 sm:pb-28">
      {/* Faint blueprint + soft pale wash. One calm focal visual. */}
      <NodeField density="med" intensity={0.7} greenBias={0.25} className="opacity-70" />
      <div className="hero-glow" aria-hidden="true" />

      <div className="container-c relative grid items-center gap-12 lg:grid-cols-[1.02fr_0.98fr] lg:gap-16">
        <div>
          <RevealSection>
            <p className="eyebrow">For practices doing implants, full arch, Invisalign &amp; cosmetic</p>
          </RevealSection>
          <div className="mt-5">
            <Headline />
          </div>
          <RevealSection delay={0.1}>
            <p className="mt-6 max-w-xl text-lg leading-relaxed text-body">
              CaseLift records every consult, finds the real objection, and follows up automatically until the patient books. Your coordinator just closes.
            </p>
            <div className="mt-8 flex flex-wrap items-center gap-4">
              <PulseButton href={APPLY_URL}>Schedule A Demo</PulseButton>
              <PulseButton href="#how" variant="ghost">See how it works</PulseButton>
            </div>
            <p className="mt-6 text-sm text-muted">
              <span className="text-money-700">★★★★★</span> 4.8/5 from 150+ practices
              <span className="mx-2 text-faint2">·</span>
              <span className="font-semibold text-money-700">3X ROI in 90 days or it's free</span>
            </p>
          </RevealSection>
        </div>

        {/* The single focal visual: the living pipeline. */}
        <RevealSection delay={0.2}>
          <GlowCard className="grad-hairline p-6 sm:p-7">
            <div className="mb-1 flex items-center justify-between">
              <span className="eyebrow">The Living Pipeline</span>
              <span className="inline-flex items-center gap-1.5 text-[11px] font-medium text-money-700">
                <span className="h-1.5 w-1.5 rounded-full bg-money" /> live
              </span>
            </div>
            <p className="mb-3 text-sm text-body">Watch a walked consult become a booked, paid case.</p>
            <HeroPipeline />
          </GlowCard>
        </RevealSection>
      </div>
    </section>
  )
}
