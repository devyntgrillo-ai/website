import { useState } from 'react'
import RevealSection from '../components/RevealSection'

const LOGOS = [
  { name: 'Dentrix', domain: 'dentrix.com' },
  { name: 'Open Dental', domain: 'opendental.com' },
  { name: 'Eaglesoft', domain: 'eaglesoft.net' },
  { name: 'Curve Dental', domain: 'curvedental.com' },
  { name: 'Carestream', domain: 'carestreamdental.com' },
  { name: 'Denticon', domain: 'planetdds.com' },
  { name: 'CareStack', domain: 'carestack.com' },
  { name: 'NexHealth', domain: 'nexhealth.com' },
  { name: 'Weave', domain: 'getweave.com' },
  { name: 'tab32', domain: 'tab32.com' },
]

function LogoChip({ name, domain, i }) {
  const [failed, setFailed] = useState(false)
  return (
    <div
      className="group flex h-20 items-center justify-center rounded-xl border border-line bg-white/95 px-4 shadow-sm transition duration-300 hover:-translate-y-1 hover:border-electric/50 hover:shadow-glow motion-safe:animate-breathe"
      style={{ animationDelay: `${(i % 5) * 0.4}s` }}
    >
      {failed ? (
        <span className="text-sm font-bold text-ink">{name}</span>
      ) : (
        <img
          src={`https://logo.clearbit.com/${domain}`}
          alt={name}
          loading="lazy"
          width="120" height="40"
          onError={() => setFailed(true)}
          className="max-h-9 w-auto max-w-[120px] object-contain opacity-80 transition group-hover:opacity-100"
        />
      )}
    </div>
  )
}

export default function Integrations() {
  return (
    <section className="relative bg-paper py-24">
      <div className="container-c">
        <RevealSection className="max-w-2xl">
          <p className="eyebrow">Integrations</p>
          <h2 className="mt-4 font-display text-section font-bold text-headline">It runs on top of the software you already use</h2>
          <p className="mt-5 text-lg text-muted">
            CaseLift plugs into your practice management system and syncs patients automatically. No rip and replace, no new logins for your front desk.
          </p>
        </RevealSection>
        <RevealSection stagger className="mt-12 grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-5">
          {LOGOS.map((l, i) => (
            <LogoChip key={l.name} name={l.name} domain={l.domain} i={i} />
          ))}
        </RevealSection>
        <p className="mt-8 text-center text-sm text-faint">And 20+ more, synced automatically through our universal integration engine.</p>
      </div>
    </section>
  )
}
