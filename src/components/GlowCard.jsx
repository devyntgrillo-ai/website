/** Glass card with an optional rotating conic gradient border (powered-on look). */
export default function GlowCard({ children, className = '', border = false, glow = '', as = 'div' }) {
  const Tag = as
  const glowCls = glow === 'cyan' ? 'shadow-glow' : glow === 'green' ? 'shadow-glow-green' : ''
  return (
    <Tag className={`relative rounded-2xl glass ${border ? 'ring-anim' : ''} ${glowCls} ${className}`}>
      {children}
    </Tag>
  )
}
