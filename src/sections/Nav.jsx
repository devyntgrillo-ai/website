import { useEffect, useState } from 'react'
import PulseButton from '../components/PulseButton'
import { APPLY_URL, APP_URL } from '../lib/links'

const LINKS = [
  { label: 'How It Works', href: '#how' },
  { label: 'Results', href: '#results' },
  { label: 'Pricing', href: '#pricing' },
  { label: 'FAQ', href: '#faq' },
]

export default function Nav() {
  const [scrolled, setScrolled] = useState(false)
  const [open, setOpen] = useState(false)
  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 24)
    onScroll(); window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])
  return (
    <header className={`fixed inset-x-0 top-0 z-50 transition-colors duration-300 ${scrolled ? 'border-b border-white/10 bg-ink/80 backdrop-blur-xl' : ''}`}>
      <nav className="container-c flex h-16 items-center justify-between">
        <a href="#top" className="flex items-center gap-2 font-display text-lg font-extrabold tracking-tight text-white">
          <span className="relative flex h-2.5 w-2.5">
            <span className="absolute inline-flex h-full w-full motion-safe:animate-ping rounded-full bg-electric/70" />
            <span className="relative inline-flex h-2.5 w-2.5 rounded-full bg-electric" />
          </span>
          CaseLift
          <span className="rounded-full border border-electric/40 px-1.5 py-0.5 text-[10px] font-semibold text-electric-300">Beta</span>
        </a>
        <div className="hidden items-center gap-8 md:flex">
          {LINKS.map((l) => (
            <a key={l.href} href={l.href} className="nav-link text-sm font-medium text-slate-300 transition hover:text-white">{l.label}</a>
          ))}
        </div>
        <div className="flex items-center gap-3">
          <a href={APP_URL} className="hidden text-sm font-semibold text-slate-300 transition hover:text-white sm:inline">Log In</a>
          <PulseButton href={APPLY_URL} className="!px-5 !py-2.5 text-[13px]">Schedule A Demo</PulseButton>
          <button onClick={() => setOpen(!open)} aria-label="Menu" className="md:hidden text-slate-200">
            <svg width="24" height="24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 7h16M4 12h16M4 17h16" /></svg>
          </button>
        </div>
      </nav>
      {open && (
        <div className="border-t border-white/10 bg-ink/95 backdrop-blur-xl md:hidden">
          <div className="container-c flex flex-col gap-1 py-3">
            {LINKS.map((l) => (
              <a key={l.href} href={l.href} onClick={() => setOpen(false)} className="rounded-lg px-2 py-2.5 text-sm font-medium text-slate-300 hover:bg-white/5">{l.label}</a>
            ))}
            <a href={APP_URL} className="rounded-lg px-2 py-2.5 text-sm font-medium text-slate-300 hover:bg-white/5">Log In</a>
          </div>
        </div>
      )}
    </header>
  )
}
