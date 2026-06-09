import RevealSection, { RevealItem } from '../components/RevealSection'
import GlowCard from '../components/GlowCard'
import PulseButton from '../components/PulseButton'
import { APPLY_URL } from '../lib/links'

const STACK = [
  'AI consult recording and objection analysis on every high-value case',
  'A custom follow-up sequence written for each patient’s exact objection',
  'Unlimited personalized touches until they book or say no',
  'Two-way text and email, every reply delivered with full context',
  'TC Certification library built by a seven-figure coordinator',
  'A monthly 1-on-1 strategy call with a 20-year veteran coordinator',
  'Live human support every business day, real people not bots',
  'Done-for-you PMS integration and automatic patient sync',
  'Production recovery and ROI attribution tracked to the dollar',
  'The 3X-in-90-days-or-it’s-free guarantee',
]

export default function Pricing() {
  return (
    <section id="pricing" className="relative bg-ink py-24 sm:py-32">
      <div className="container-c">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">What You Get</p>
          <h2 className="mt-4 font-display text-section font-bold text-white">Everything that recovers cases, in one membership</h2>
          <p className="mt-5 text-lg text-slate-400">
            Your price is built around the production CaseLift recovers for you. Every feature included. No setup fees. No contracts.
          </p>
        </RevealSection>

        <RevealSection stagger className="mt-12 grid gap-3 sm:grid-cols-2">
          {STACK.map((item, i) => (
            <RevealItem key={i}>
              <GlowCard className="flex items-start gap-3 p-4">
                <svg className="mt-0.5 h-5 w-5 shrink-0 text-money" viewBox="0 0 20 20" fill="currentColor"><path fillRule="evenodd" d="M16.7 5.3a1 1 0 010 1.4l-7.5 7.5a1 1 0 01-1.4 0L3.3 9.7a1 1 0 011.4-1.4l3.1 3.1 6.8-6.8a1 1 0 011.4 0z" clipRule="evenodd" /></svg>
                <span className="text-[15px] text-slate-300">{item}</span>
              </GlowCard>
            </RevealItem>
          ))}
        </RevealSection>

        <RevealSection className="mt-12">
          <GlowCard border glow="cyan" className="p-8 text-center">
            <p className="mx-auto max-w-2xl text-lg text-slate-300">
              Pricing is based on your case volume, so you only pay in proportion to what we recover. We build your exact number live on the call.
            </p>
            <div className="mt-7 flex justify-center">
              <PulseButton href={APPLY_URL}>Get My Custom Price</PulseButton>
            </div>
            <p className="mt-5 text-sm text-slate-500">Cancel anytime · No long-term contract · Month to month</p>
          </GlowCard>
        </RevealSection>
      </div>
    </section>
  )
}
