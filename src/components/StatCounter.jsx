import { useEffect, useRef, useState } from 'react'

/** Counts up from 0 to `value` when scrolled into view (once). */
export default function StatCounter({ value, prefix = '', suffix = '', decimals = 0, duration = 1400, className = '' }) {
  const ref = useRef(null)
  const [n, setN] = useState(0)
  const done = useRef(false)

  useEffect(() => {
    const el = ref.current
    if (!el) return
    const reduce = window.matchMedia?.('(prefers-reduced-motion: reduce)').matches
    if (reduce) { setN(value); return }
    const io = new IntersectionObserver(([e]) => {
      if (!e.isIntersecting || done.current) return
      done.current = true
      const start = performance.now()
      const tick = (now) => {
        const t = Math.min(1, (now - start) / duration)
        const eased = 1 - Math.pow(1 - t, 3)
        setN(value * eased)
        if (t < 1) requestAnimationFrame(tick)
        else setN(value)
      }
      requestAnimationFrame(tick)
    }, { threshold: 0.4 })
    io.observe(el)
    return () => io.disconnect()
  }, [value, duration])

  const display = decimals > 0 ? n.toFixed(decimals) : Math.round(n).toLocaleString()
  return <span ref={ref} className={className}>{prefix}{display}{suffix}</span>
}
