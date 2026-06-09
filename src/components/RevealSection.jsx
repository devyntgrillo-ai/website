import { motion, useReducedMotion } from 'framer-motion'

/** Scroll reveal: rises + fades in once, with optional stagger for children. */
export default function RevealSection({ children, className = '', delay = 0, as = 'div', stagger = false }) {
  const reduce = useReducedMotion()
  const MotionTag = motion[as] || motion.div

  if (reduce) {
    const Tag = as
    return <Tag className={className}>{children}</Tag>
  }
  if (stagger) {
    return (
      <MotionTag
        className={className}
        initial="hidden"
        whileInView="show"
        viewport={{ once: true, margin: '-80px' }}
        variants={{ show: { transition: { staggerChildren: 0.09, delayChildren: delay } } }}
      >
        {children}
      </MotionTag>
    )
  }
  return (
    <MotionTag
      className={className}
      initial={{ opacity: 0, y: 28 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, margin: '-80px' }}
      transition={{ duration: 0.7, delay, ease: [0.22, 1, 0.36, 1] }}
    >
      {children}
    </MotionTag>
  )
}

/** A child item for staggered reveals. */
export function RevealItem({ children, className = '', as = 'div' }) {
  const reduce = useReducedMotion()
  const Tag = motion[as] || motion.div
  if (reduce) { const T = as; return <T className={className}>{children}</T> }
  return (
    <Tag
      className={className}
      variants={{ hidden: { opacity: 0, y: 22 }, show: { opacity: 1, y: 0, transition: { duration: 0.6, ease: [0.22, 1, 0.36, 1] } } }}
    >
      {children}
    </Tag>
  )
}
