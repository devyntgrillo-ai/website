/** Clean white card with soft elevation. `glow` adds a faint accent shadow. */
export default function GlowCard({ children, className = '', border = false, glow = '', as = 'div' }) {
  const Tag = as
  const glowCls = glow === 'cyan' ? 'shadow-glow' : glow === 'green' ? 'shadow-glow-green' : ''
  // `border` now means a slightly more defined hairline (no neon ring).
  const borderCls = border ? 'border-line2' : ''
  return (
    <Tag className={`relative rounded-2xl glass ${borderCls} ${glowCls} ${className}`}>
      {children}
    </Tag>
  )
}
