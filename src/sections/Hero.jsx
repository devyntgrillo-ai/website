import NodeField from '../components/NodeField'
import HeroPipeline from '../components/HeroPipeline'
import GlowCard from '../components/GlowCard'
import PulseButton from '../components/PulseButton'
import RevealSection from '../components/RevealSection'
import { APPLY_URL } from '../lib/links'

export default function Hero() {
  return (
    <section id="top" className="relative isolate overflow-hidden bg-ink pt-28 pb-20 sm:pt-36 sm:pb-28">
      <NodeField density="high" intensity={1} greenBias={0.3} />
      <div className="absolute inset-0 -z-0 bg-gradient-to-b from-ink/30 via-transparent to-ink" />

      <div className="container-c relative grid items-center gap-12 lg:grid-cols-[1.05fr_0.95fr]">
        <div>
          <RevealSection>
            <p className="eyebrow">For practices doing implants, full arch, Invisalign &amp; cosmetic</p>
            <h1 className="mt-5 font-display text-hero font-extrabold text-white">
              Close more big cases <span className="text-grad">without chasing a single patient</span> yourself
            </h1>
            <p className="mt-6 max-w-xl text-lg leading-relaxed text-slate-300">
              CaseLift records every consult, pinpoints exactly why each patient hesitated, and follows up automatically by text and email until they book or say no. Your coordinator just closes the ones who reply.
            </p>
            <div className="mt-8 flex flex-wrap items-center gap-4">
              <PulseButton href={APPLY_URL}>Schedule A Demo</PulseButton>
              <PulseButton href="#how" variant="ghost">See how it works</PulseButton>
            </div>
            <p className="mt-6 text-sm text-slate-400">
              <span className="text-money">★★★★★</span> 4.8/5 from 150+ practices
              <span className="mx-2 text-slate-600">·</span>
              <span className="text-money-300 font-semibold">3X ROI in 90 days or it's free</span>
            </p>
          </RevealSection>
        </div>

        <RevealSection delay={0.15} className="space-y-6">
          {/* The pipeline tells the story before they read a word. */}
          <GlowCard border className="p-5">
            <HeroPipeline />
          </GlowCard>

          {/* Live "Consult Analysis" card. */}
          <GlowCard border glow="cyan" className="p-5">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2 text-xs font-semibold text-electric-300">
                <span className="relative flex h-2 w-2"><span className="absolute inline-flex h-full w-full motion-safe:animate-ping rounded-full bg-electric/60" /><span className="relative inline-flex h-2 w-2 rounded-full bg-electric" /></span>
                Consult Analysis
              </div>
              <span className="text-[11px] text-slate-500">just now</span>
            </div>
            <div className="mt-3 flex items-center justify-between">
              <div className="text-sm font-semibold text-white">Margaret C.</div>
              <div className="text-sm font-bold text-money">$28,500 case</div>
            </div>
            <div className="mt-3 space-y-2 text-[13px]">
              <div className="flex items-center gap-2 rounded-lg border border-white/10 bg-space-800/60 px-3 py-2">
                <span className="text-slate-500">Objection</span>
                <span className="font-medium text-slate-200">Needs to talk to her husband first</span>
              </div>
              <div className="flex items-start gap-2 rounded-lg border border-electric/20 bg-electric/5 px-3 py-2">
                <span className="text-electric-300">Coaching</span>
                <span className="text-slate-300">Offer a quick joint call so both decision makers hear the plan together.</span>
              </div>
              <div className="rounded-lg border border-white/10 bg-space-800/60 px-3 py-2">
                <div className="text-[11px] uppercase tracking-wide text-slate-500">Next message, sending in 2 days</div>
                <div className="mt-1 text-slate-300">"Hi Margaret, would Thursday work for a quick 10 minute call with you and your husband? Happy to walk you both through the financing."</div>
              </div>
            </div>
          </GlowCard>
        </RevealSection>
      </div>
    </section>
  )
}
