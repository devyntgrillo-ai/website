import RevealSection from '../components/RevealSection'

const LOGOS = ['Dentrix', 'Open Dental', 'Eaglesoft', 'Curve', 'Carestream', 'Denticon', 'CareStack', 'NexHealth', 'Weave', 'tab32']

export default function Integrations() {
  return (
    <section className="relative bg-ink py-24">
      <div className="container-c">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">Integrations</p>
          <h2 className="mt-4 font-display text-section font-bold text-white">It runs on top of the software you already use</h2>
          <p className="mt-5 text-lg text-slate-400">
            CaseLift plugs into your practice management system and syncs patients automatically. No rip and replace, no new logins for your front desk.
          </p>
        </RevealSection>
        <RevealSection stagger className="mt-12 grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-5">
          {LOGOS.map((name) => (
            <div key={name} className="flex h-20 items-center justify-center rounded-xl border border-white/10 bg-space-800/40 text-sm font-semibold text-slate-300 transition hover:border-electric/40 hover:text-white motion-safe:animate-breathe" style={{ animationDelay: `${Math.random() * 2}s` }}>
              {name}
            </div>
          ))}
        </RevealSection>
        <p className="mt-8 text-center text-sm text-slate-500">And 20+ more, synced automatically through our universal integration engine.</p>
      </div>
    </section>
  )
}
