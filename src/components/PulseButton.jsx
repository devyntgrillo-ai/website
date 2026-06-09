/** Apple-style primary CTA: solid accent pill. Ghost: clean outline. */
export default function PulseButton({ children, href = '#', variant = 'primary', className = '', onClick }) {
  if (variant === 'ghost') {
    return (
      <a href={href} onClick={onClick}
        className={`inline-flex items-center justify-center gap-2 rounded-full border border-line2 px-6 py-3.5 text-sm font-semibold text-headline transition hover:border-black/25 hover:bg-black/[0.03] ${className}`}>
        {children}
      </a>
    )
  }
  return (
    <a href={href} onClick={onClick}
      className={`inline-flex items-center justify-center gap-2 rounded-full bg-accent px-7 py-3.5 text-sm font-semibold text-headline transition-colors hover:bg-accent-hover ${className}`}>
      {children}
    </a>
  )
}
