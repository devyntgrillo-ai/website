import NodeField from '../components/NodeField'
import RevealSection from '../components/RevealSection'
import StatCounter from '../components/StatCounter'

const STATS = [
  { v: 12, suffix: '', label: '5 to 12 touchpoints most high-value cases need before they close. Most practices manage two.' },
  { v: 44, suffix: '%', label: 'of coordinators quit after a single follow-up attempt.' },
  { v: 92, suffix: '%', label: 'stop entirely by the fourth, right when the big cases are getting warm.' },
]

export default function HiddenLeak() {
  return (
    <section className="relative overflow-hidden bg-ink py-24 sm:py-32">
      <NodeField density="low" intensity={0.35} greenBias={0.1} className="opacity-40" />
      <div className="container-c relative">
        <RevealSection className="max-w-3xl">
          <p className="eyebrow">The Hidden Leak</p>
          <h2 className="mt-4 font-display text-section font-bold text-white">
            Your practice already earned these patients. <span className="text-slate-500">Then it let them walk.</span>
          </h2>
          <p className="mt-6 text-lg leading-relaxed text-slate-400">
            You spent the marketing dollars. You spent the chair time. The patient heard a five-figure treatment plan and said
            {' '}<span className="text-slate-200">"let me think about it."</span> Your coordinator followed up once, maybe twice, then moved on.
            That case did not say no. It just never got the nudge it needed. Multiply that by every week of the year.
          </p>
        </RevealSection>

        <RevealSection stagger className="mt-14 grid gap-5 sm:grid-cols-3">
          {STATS.map((s, i) => (
            <div key={i} className="rounded-2xl border border-white/10 bg-space-800/50 p-6">
              <div className="font-display text-5xl font-extrabold text-electric-300">
                {s.v === 12 ? <span>5 to <StatCounter value={12} /></span> : <StatCounter value={s.v} suffix={s.suffix} />}
              </div>
              <p className="mt-3 text-sm leading-relaxed text-slate-400">{s.label}</p>
            </div>
          ))}
        </RevealSection>

        <RevealSection className="mt-12">
          <p className="text-xl font-semibold text-white">
            That is six and seven figures slipping out the door every year. <span className="text-grad">CaseLift plugs the leak.</span>
          </p>
          <p className="mt-3 text-xs text-slate-600">Source: Salesforce</p>
        </RevealSection>
      </div>
    </section>
  )
}
