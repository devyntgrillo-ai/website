/** Primary CTA: electric glow + slow pulse + sheen sweep on hover. */
export default function PulseButton({ children, href = '#', variant = 'primary', className = '', onClick }) {
  if (variant === 'ghost') {
    return (
      <a href={href} onClick={onClick}
        className={`inline-flex items-center justify-center gap-2 rounded-xl border border-white/15 px-6 py-3.5 text-sm font-semibold text-slate-100 transition hover:border-white/30 hover:bg-white/5 ${className}`}>
        {children}
      </a>
    )
  }
  return (
    <a href={href} onClick={onClick}
      className={`group relative inline-flex items-center justify-center gap-2 overflow-hidden rounded-xl bg-gradient-to-r from-electric-400 to-electric px-7 py-3.5 text-sm font-bold text-white shadow-glow transition hover:scale-[1.02] motion-safe:animate-pulseGlow ${className}`}>
      <span className="pointer-events-none absolute inset-0 -translate-x-full bg-gradient-to-r from-transparent via-white/40 to-transparent group-hover:motion-safe:animate-sheen" />
      <span className="relative z-10 flex items-center gap-2">{children}</span>
    </a>
  )
}
