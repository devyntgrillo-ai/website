import { useEffect, useRef } from 'react'

const ELECTRIC = [14, 165, 233]
const GREEN = [16, 185, 129]
const lerp = (a, b, t) => a + (b - a) * t
const mix = (c1, c2, t) => `${Math.round(lerp(c1[0], c2[0], t))},${Math.round(lerp(c1[1], c2[1], t))},${Math.round(lerp(c1[2], c2[2], t))}`

const prefersReduced = () =>
  typeof window !== 'undefined' && window.matchMedia?.('(prefers-reduced-motion: reduce)').matches

/**
 * The living node network. Canvas 2D for mobile performance. Energy packets
 * travel along edges (cyan → green). Cursor-reactive on desktop, auto on mobile.
 * Pauses when off-screen; static field when prefers-reduced-motion.
 *
 * props: density 'low'|'med'|'high', intensity 0..1, greenBias 0..1, className
 */
export default function NodeField({ density = 'med', intensity = 1, greenBias = 0.35, className = '' }) {
  const canvasRef = useRef(null)
  const wrapRef = useRef(null)

  useEffect(() => {
    const canvas = canvasRef.current
    const wrap = wrapRef.current
    if (!canvas || !wrap) return
    const ctx = canvas.getContext('2d')
    const reduced = prefersReduced()
    const isMobile = window.matchMedia('(max-width: 768px)').matches

    let w = 0, h = 0, dpr = Math.min(window.devicePixelRatio || 1, 2)
    const COUNT = { low: 14, med: 26, high: 40 }[density] * (isMobile ? 0.55 : 1)
    const MAX_DIST = isMobile ? 150 : 190
    const nodes = []
    let edges = []
    const packets = []
    const mouse = { x: -9999, y: -9999, active: false }

    function resize() {
      const r = wrap.getBoundingClientRect()
      w = r.width; h = r.height
      canvas.width = w * dpr; canvas.height = h * dpr
      canvas.style.width = w + 'px'; canvas.style.height = h + 'px'
      ctx.setTransform(dpr, 0, 0, dpr, 0, 0)
      seed()
    }

    function seed() {
      nodes.length = 0
      const n = Math.max(6, Math.round(COUNT))
      for (let i = 0; i < n; i++) {
        nodes.push({
          x: Math.random() * w, y: Math.random() * h,
          vx: (Math.random() - 0.5) * 0.18, vy: (Math.random() - 0.5) * 0.18,
          r: 1.4 + Math.random() * 1.8, phase: Math.random() * Math.PI * 2,
          green: Math.random() < greenBias,
        })
      }
      computeEdges()
      packets.length = 0
    }

    function computeEdges() {
      edges = []
      for (let i = 0; i < nodes.length; i++) {
        for (let j = i + 1; j < nodes.length; j++) {
          const dx = nodes[i].x - nodes[j].x, dy = nodes[i].y - nodes[j].y
          if (dx * dx + dy * dy < MAX_DIST * MAX_DIST) edges.push([i, j])
        }
      }
    }

    function spawnPacket() {
      if (!edges.length) return
      const e = edges[(Math.random() * edges.length) | 0]
      packets.push({ a: e[0], b: e[1], t: 0, speed: 0.004 + Math.random() * 0.006 })
    }

    let raf = 0, frame = 0, running = true
    function draw() {
      raf = requestAnimationFrame(draw)
      frame++
      ctx.clearRect(0, 0, w, h)

      // Move nodes (slow drift), recompute edges occasionally.
      for (const nd of nodes) {
        nd.x += nd.vx; nd.y += nd.vy
        if (nd.x < 0 || nd.x > w) nd.vx *= -1
        if (nd.y < 0 || nd.y > h) nd.vy *= -1
        // Gentle cursor attraction.
        if (mouse.active) {
          const dx = mouse.x - nd.x, dy = mouse.y - nd.y
          const d2 = dx * dx + dy * dy
          if (d2 < 160 * 160) { nd.x += dx * 0.0008; nd.y += dy * 0.0008 }
        }
      }
      if (frame % 30 === 0) computeEdges()

      // Edges.
      for (const [i, j] of edges) {
        const a = nodes[i], b = nodes[j]
        const near = mouse.active && (Math.hypot(mouse.x - a.x, mouse.y - a.y) < 160 || Math.hypot(mouse.x - b.x, mouse.y - b.y) < 160)
        ctx.strokeStyle = `rgba(${a.green && b.green ? mix(ELECTRIC, GREEN, 0.8) : '90,120,170'},${(near ? 0.35 : 0.13) * intensity})`
        ctx.lineWidth = 1
        ctx.beginPath(); ctx.moveTo(a.x, a.y); ctx.lineTo(b.x, b.y); ctx.stroke()
      }

      // Energy packets along edges.
      if (!reduced && running) {
        if (frame % Math.round(22 / Math.max(0.3, intensity)) === 0 && packets.length < (isMobile ? 8 : 16)) spawnPacket()
        for (let k = packets.length - 1; k >= 0; k--) {
          const p = packets[k]
          p.t += p.speed
          if (p.t >= 1) { packets.splice(k, 1); continue }
          const a = nodes[p.a], b = nodes[p.b]
          if (!a || !b) { packets.splice(k, 1); continue }
          const x = lerp(a.x, b.x, p.t), y = lerp(a.y, b.y, p.t)
          const col = mix(ELECTRIC, GREEN, b.green ? Math.min(1, p.t + 0.3) : p.t * 0.4)
          ctx.beginPath()
          ctx.fillStyle = `rgba(${col},${0.9 * intensity})`
          ctx.shadowColor = `rgba(${col},0.9)`; ctx.shadowBlur = 8
          ctx.arc(x, y, 2.2, 0, Math.PI * 2); ctx.fill()
          ctx.shadowBlur = 0
        }
      }

      // Nodes (breathing).
      for (const nd of nodes) {
        nd.phase += 0.02
        const pulse = reduced ? 1 : 0.7 + 0.3 * Math.sin(nd.phase)
        const near = mouse.active && Math.hypot(mouse.x - nd.x, mouse.y - nd.y) < 150
        const col = nd.green ? GREEN : ELECTRIC
        ctx.beginPath()
        ctx.fillStyle = `rgba(${col[0]},${col[1]},${col[2]},${(near ? 0.95 : 0.55) * intensity * pulse})`
        ctx.arc(nd.x, nd.y, nd.r * (near ? 1.7 : 1), 0, Math.PI * 2)
        ctx.fill()
      }
    }

    resize()
    if (reduced) { draw(); cancelAnimationFrame(raf) } // one static frame
    else raf = requestAnimationFrame(draw)

    const io = new IntersectionObserver(([e]) => {
      running = e.isIntersecting
      if (running && !reduced && !raf) raf = requestAnimationFrame(draw)
      if (!running) { cancelAnimationFrame(raf); raf = 0 }
    }, { threshold: 0.01 })
    io.observe(wrap)

    const onResize = () => resize()
    const onMove = (e) => { const r = canvas.getBoundingClientRect(); mouse.x = e.clientX - r.left; mouse.y = e.clientY - r.top; mouse.active = true }
    const onLeave = () => { mouse.active = false }
    window.addEventListener('resize', onResize)
    if (!isMobile && !reduced) { wrap.addEventListener('pointermove', onMove); wrap.addEventListener('pointerleave', onLeave) }

    return () => {
      cancelAnimationFrame(raf); io.disconnect()
      window.removeEventListener('resize', onResize)
      wrap.removeEventListener('pointermove', onMove); wrap.removeEventListener('pointerleave', onLeave)
    }
  }, [density, intensity, greenBias])

  return (
    <div ref={wrapRef} className={`pointer-events-none absolute inset-0 overflow-hidden ${className}`} aria-hidden="true">
      <canvas ref={canvasRef} className="h-full w-full" />
    </div>
  )
}
