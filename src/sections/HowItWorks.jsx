import { useEffect, useState } from 'react'
import RevealSection from '../components/RevealSection'
import GlowCard from '../components/GlowCard'
import EnergyBeam from '../components/EnergyBeam'

function fmt(s) { return `${String(Math.floor(s / 60)).padStart(2, '0')}:${String(s % 60).padStart(2, '0')}` }

function RecordingMock() {
  const [s, setS] = useState(0)
  useEffect(() => { const id = setInterval(() => setS((x) => x + 1), 1000); return () => clearInterval(id) }, [])
  const steps = ['Transcribing live', 'De-identifying', 'Extracting objections', 'Estimating case value']
  return (
    <div className="rounded-xl border border-white/10 bg-space-800/60 p-5">
      <div className="flex items-center justify-between">
        <span className="flex items-center gap-2 text-xs font-semibold text-electric-300">
          <span className="relative flex h-2.5 w-2.5"><span className="absolute inline-flex h-full w-full motion-safe:animate-ping rounded-full bg-rose-500/60" /><span className="relative inline-flex h-2.5 w-2.5 rounded-full bg-rose-500" /></span>
          Recording consult
        </span>
        <span className="font-mono text-sm tabular-nums text-white">{fmt(s)}</span>
      </div>
      <div className="mt-4 flex h-10 items-center gap-[3px]">
        {Array.from({ length: 38 }).map((_, i) => (
          <span key={i} className="w-[3px] rounded-full bg-electric/70 motion-safe:animate-breathe" style={{ height: `${20 + ((i * 37) % 70)}%`, animationDelay: `${(i % 8) * 0.12}s` }} />
        ))}
      </div>
      <div className="mt-4 space-y-2">
        {steps.map((t, i) => (
          <div key={t} className="flex items-center gap-2 text-[13px] text-slate-400">
            <span className={`flex h-4 w-4 items-center justify-center rounded-full text-[9px] ${i <= (s % 5) ? 'bg-money text-white' : 'bg-space-600 text-slate-500'}`}>{i <= (s % 5) ? '✓' : ''}</span>
            {t}
          </div>
        ))}
      </div>
    </div>
  )
}

function SequenceMock() {
  return (
    <div className="rounded-xl border border-white/10 bg-space-800/60 p-5">
      <div className="flex items-center justify-between text-xs"><span className="font-semibold text-white">Follow-up sequence · Margaret C.</span><span className="text-money-300">self-optimizing</span></div>
      {[
        { d: 'Day 0', c: 'SMS', t: 'Loved meeting you today, Margaret.', now: false },
        { d: 'Day 2', c: 'SMS', t: 'Quick joint call with your husband?', now: true },
        { d: 'Day 5', c: 'Email', t: 'The financing option we discussed', now: false },
      ].map((m, i) => (
        <div key={i} className={`mt-2 flex items-center gap-3 rounded-lg border px-3 py-2 text-[13px] ${m.now ? 'border-electric/40 bg-electric/5' : 'border-white/10 bg-space-700/40'}`}>
          <span className="w-12 shrink-0 text-xs text-slate-500">{m.d}</span>
          <span className="shrink-0 rounded bg-space-600 px-1.5 py-0.5 text-[10px] text-slate-300">{m.c}</span>
          <span className="min-w-0 flex-1 truncate text-slate-300">{m.t}</span>
          {m.now && <span className="flex items-center gap-1 text-[10px] font-semibold text-electric-300"><span className="h-1.5 w-1.5 rounded-full bg-electric motion-safe:animate-ping" />sending</span>}
        </div>
      ))}
      <div className="mt-3 flex items-center gap-2 rounded-lg border border-money/20 bg-money/5 px-3 py-2 text-[12px] text-money-300">
        ★ Leading with the highest-replying message across every CaseLift practice.
      </div>
    </div>
  )
}

function ConversationsMock() {
  return (
    <div className="rounded-xl border border-white/10 bg-space-800/60 p-5">
      <div className="flex items-center justify-between border-b border-white/10 pb-3">
        <span className="text-sm font-semibold text-white">Robert M.</span>
        <span className="rounded-full bg-money/15 px-2 py-0.5 text-[11px] font-semibold text-money-300">$41,000 · financing</span>
      </div>
      <div className="mt-3 space-y-2">
        <div className="ml-auto max-w-[80%] rounded-2xl rounded-tr-sm bg-electric/15 px-3 py-2 text-[13px] text-slate-100">Hi Robert, were you able to look at the monthly option we set up?</div>
        <div className="max-w-[80%] rounded-2xl rounded-tl-sm bg-space-700 px-3 py-2 text-[13px] text-slate-200">Yeah that actually works. Can I come in next week?</div>
      </div>
      <div className="mt-3 rounded-lg border border-white/10 bg-space-700/40 px-3 py-2 text-[12px] text-slate-400">Rebooked for Tuesday 2:00 PM</div>
    </div>
  )
}

function CertMock() {
  const courses = [{ n: 'Handling the price objection', p: 100 }, { n: 'The spouse conversation', p: 72 }, { n: 'Creating urgency without pressure', p: 40 }]
  return (
    <div className="rounded-xl border border-white/10 bg-space-800/60 p-5">
      <div className="text-sm font-semibold text-white">TC Certification</div>
      <div className="mt-4 space-y-3">
        {courses.map((c) => (
          <div key={c.n}>
            <div className="flex items-center justify-between text-[13px] text-slate-300"><span>{c.n}</span><span className="text-slate-500">{c.p}%</span></div>
            <div className="mt-1 h-1.5 overflow-hidden rounded-full bg-space-600"><div className="h-full rounded-full bg-gradient-to-r from-electric to-money" style={{ width: `${c.p}%` }} /></div>
          </div>
        ))}
      </div>
    </div>
  )
}

const STEPS = [
  { n: 1, title: 'It listens to the consult', body: 'Hit record at the start of any high-value consult. CaseLift transcribes in real time and analyzes the conversation the second it ends. No hardware, no manual notes, nothing to install.', bullets: ['Records right in the browser', 'Live transcription, auto de-identified', 'Objections and case value extracted instantly'], Mock: RecordingMock },
  { n: 2, title: 'It builds a follow-up sequence around each patient', body: 'CaseLift does not blast a template. It writes a sequence around each patient’s exact objection and how ready they were to say yes. Text and email, as many touches as the case needs, timed to the moment they are most likely to book. And it gets smarter every day: it learns which messages earn replies across every practice on CaseLift and leads with the winners.', bullets: ['Written for each patient’s specific objection', 'As many personalized touches as the case needs', 'Self-optimizing toward what actually converts'], Mock: SequenceMock },
  { n: 3, title: 'Every reply lands with full context', body: 'When a patient replies, it hits your coordinator with the whole story attached: the case, the objection, the dollar amount. No scrambling, no cold reintroductions. Your coordinator always knows exactly what to say next.', bullets: ['Two-way text and email in one thread', 'Case value and objection pinned to every conversation', 'Your coordinator walks in already knowing the patient'], Mock: ConversationsMock },
  { n: 4, title: 'Your coordinator gets better every week', body: 'Every membership includes the TC Certification library: guided courses and objection-handling playbooks built by a coordinator who has personally closed seven figures in cases. Your software closes cases and your team levels up at the same time.', bullets: ['Guided video courses, self-paced', 'Real objection scripts that close', 'Track every team member’s progress'], Mock: CertMock },
]

export default function HowItWorks() {
  return (
    <section id="how" className="relative bg-ink py-24 sm:py-32">
      <div className="container-c">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">How It Works</p>
          <h2 className="mt-4 font-display text-section font-bold text-white">From consult to closed case, on autopilot</h2>
          <p className="mt-5 text-lg text-slate-400">
            CaseLift sits between your coordinator and every patient who walked without scheduling. It turns unfinished consults into booked, paid cases while your team sleeps.
          </p>
        </RevealSection>

        <div className="mt-16 space-y-2">
          {STEPS.map((step, i) => (
            <div key={step.n}>
              <RevealSection className={`grid items-center gap-8 lg:grid-cols-2 ${i % 2 ? 'lg:[&>*:first-child]:order-2' : ''}`}>
                <div>
                  <div className="flex items-center gap-3">
                    <span className="flex h-9 w-9 items-center justify-center rounded-xl bg-electric/15 font-display text-lg font-bold text-electric-300">{step.n}</span>
                    <span className="eyebrow">Step {step.n}</span>
                  </div>
                  <h3 className="mt-4 font-display text-2xl font-bold text-white sm:text-3xl">{step.title}</h3>
                  <p className="mt-4 text-[15px] leading-relaxed text-slate-400">{step.body}</p>
                  <ul className="mt-5 space-y-2">
                    {step.bullets.map((b) => (
                      <li key={b} className="flex items-center gap-2.5 text-[15px] text-slate-300">
                        <svg className="h-4 w-4 shrink-0 text-money" viewBox="0 0 20 20" fill="currentColor"><path fillRule="evenodd" d="M16.7 5.3a1 1 0 010 1.4l-7.5 7.5a1 1 0 01-1.4 0L3.3 9.7a1 1 0 011.4-1.4l3.1 3.1 6.8-6.8a1 1 0 011.4 0z" clipRule="evenodd" /></svg>
                        {b}
                      </li>
                    ))}
                  </ul>
                </div>
                <GlowCard border glow="cyan" className="p-4"><step.Mock /></GlowCard>
              </RevealSection>
              {i < STEPS.length - 1 && <EnergyBeam height={70} />}
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
