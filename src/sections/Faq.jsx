import { useState, useId } from 'react'
import { AnimatePresence, motion } from 'framer-motion'
import RevealSection from '../components/RevealSection'

const FAQS = [
  { q: 'How does CaseLift actually work?', a: 'Your coordinator hits record at the start of a high-value consult. CaseLift transcribes and analyzes it, figures out the objection and the case value, then writes and sends a personalized follow-up sequence by text and email until the patient books or says no. Replies come straight to your coordinator with full context.' },
  { q: 'Is this only for dental implants?', a: 'No. CaseLift works for any high-value treatment: implants, full arch, Invisalign, cosmetic veneers, sleep apnea, periodontal, and full-mouth rehab. It tailors the analysis and the messages to the treatment the patient actually discussed.' },
  { q: 'Will the follow-ups sound like a robot?', a: 'The opposite. Every message is written around that specific patient, their objection, and the moment in their life they mentioned. Patients reply because it reads like a real person from your office who remembers them.' },
  { q: 'Is it HIPAA compliant?', a: 'Yes. Transcripts are de-identified automatically, data is encrypted, and we operate under a signed BAA. Your patient data is handled to HIPAA standards end to end.' },
  { q: 'How does it know what to say to each patient?', a: 'It uses the actual consult: the objection raised, how ready they were to move forward, the case value, and personal details they shared. Then it leans on what is already converting across every practice on CaseLift to lead with the messages most likely to earn a reply.' },
  { q: 'Do we need any hardware?', a: 'None. Recording happens right in the browser. Nothing to buy, nothing to install, nothing for your front desk to learn beyond pressing record.' },
  { q: 'What is the TC Certification library?', a: 'A growing set of guided video courses and objection-handling scripts built by a coordinator who has personally closed seven figures in cases. Your team levels up while the software works.' },
  { q: 'How does the guarantee work?', a: 'If CaseLift does not return at least 3X what you pay in your first 90 days, your membership is free until it does. We measure recovery against your real PMS production, not our word for it.' },
  { q: 'How is this different from other follow-up tools?', a: 'Most tools blast templates on a fixed schedule. CaseLift listens to the actual consult, writes around each patient, adapts to replies, learns what converts, and pairs it all with real human coaching. CaseLift closes cases, it does not just send reminders.' },
]

function Item({ q, a, open, onToggle }) {
  const id = useId()
  return (
    <div className="border-b border-line">
      <button onClick={onToggle} aria-expanded={open} aria-controls={id}
        className="flex w-full items-center justify-between gap-4 py-5 text-left">
        <span className="text-[16px] font-semibold text-headline">{q}</span>
        <span className={`shrink-0 text-electric-700 transition-transform duration-300 ${open ? 'rotate-45' : ''}`}>
          <svg width="20" height="20" fill="none" stroke="currentColor" strokeWidth="2"><path d="M10 4v12M4 10h12" /></svg>
        </span>
      </button>
      <AnimatePresence initial={false}>
        {open && (
          <motion.div id={id}
            initial={{ height: 0, opacity: 0 }} animate={{ height: 'auto', opacity: 1 }} exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.3, ease: [0.22, 1, 0.36, 1] }} className="overflow-hidden">
            <p className="pb-5 pr-8 text-[15px] leading-relaxed text-muted">{a}</p>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  )
}

export default function Faq() {
  const [open, setOpen] = useState(0)
  return (
    <section id="faq" className="relative bg-paper py-24 sm:py-32">
      <div className="container-c max-w-3xl">
        <RevealSection>
          <p className="eyebrow">FAQ</p>
          <h2 className="mt-4 font-display text-section font-bold text-headline">Questions, answered</h2>
        </RevealSection>
        <RevealSection className="mt-10">
          {FAQS.map((f, i) => (
            <Item key={i} q={f.q} a={f.a} open={open === i} onToggle={() => setOpen(open === i ? -1 : i)} />
          ))}
        </RevealSection>
      </div>
    </section>
  )
}
