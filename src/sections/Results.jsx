import RevealSection, { RevealItem } from '../components/RevealSection'
import GlowCard from '../components/GlowCard'
import StatCounter from '../components/StatCounter'

const TESTIMONIALS = [
  { name: 'Dr. Sarah M.', role: 'Implant & Full Arch Practice', quote: `CaseLift recovered $47,000 in treatment we had completely written off. Patients I assumed were gone booked surgery dates after the follow-up sequence did its thing.`, stat: '$47,000', statLabel: 'recovered', green: true },
  { name: 'Dr. James P.', role: 'Cosmetic & Invisalign', quote: `Our consult close rate went from 31% to 58%. The follow-ups sound exactly like my coordinator wrote them, except they actually go out every single time.`, stat: '31% to 58%', statLabel: 'close rate' },
  { name: 'Dr. Linda K.', role: 'General & Restorative', quote: `It feels like my best coordinator wrote every message, and she never forgets to send one. The patients reply like they are talking to a real person, because it reads like one.`, stat: '5.0', statLabel: 'would recommend' },
]

export default function Results() {
  return (
    <section id="results" className="relative bg-paper py-24 sm:py-32">
      <div className="container-c">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">Results</p>
          <h2 className="mt-4 font-display text-section font-bold text-headline">Practices are pulling back production they had written off</h2>
        </RevealSection>
        <RevealSection stagger className="mt-12 grid gap-5 lg:grid-cols-3">
          {TESTIMONIALS.map((t) => (
            <RevealItem key={t.name}>
              <GlowCard border className="h-full p-6">
                <div className="flex gap-0.5 text-money-700">{'★★★★★'}</div>
                <p className="mt-4 text-[15px] leading-relaxed text-body">{t.quote}</p>
                <div className="mt-6 border-t border-line pt-4">
                  <div className={`font-display text-3xl font-extrabold ${t.green ? 'text-money-700' : 'text-headline'}`}>{t.stat}</div>
                  <div className="text-xs uppercase tracking-wide text-faint">{t.statLabel}</div>
                  <div className="mt-3 text-sm font-semibold text-headline">{t.name}</div>
                  <div className="text-xs text-faint">{t.role}</div>
                </div>
              </GlowCard>
            </RevealItem>
          ))}
        </RevealSection>
        <RevealSection className="mt-12 flex flex-wrap items-center justify-center gap-x-8 gap-y-3 rounded-2xl border border-line bg-panel px-6 py-5 text-center text-sm text-muted">
          {['4.8/5 average', '200+ practices', '$2.3M in recovered production', '6+ treatment types', 'avg 15% recovery rate', '$30k+ recovered per practice in the first 90 days'].map((s, i) => (
            <span key={i} className="font-medium"><span className="text-money-700">{s.split(' ')[0]}</span> {s.split(' ').slice(1).join(' ')}</span>
          ))}
        </RevealSection>
      </div>
    </section>
  )
}
