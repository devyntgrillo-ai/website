import Nav from './sections/Nav'
import Hero from './sections/Hero'
import HiddenLeak from './sections/HiddenLeak'
import HowItWorks from './sections/HowItWorks'
import Integrations from './sections/Integrations'
import Results from './sections/Results'
import RoiCalculator from './sections/RoiCalculator'
import Guarantee from './sections/Guarantee'
import Pricing from './sections/Pricing'
import HumanAI from './sections/HumanAI'
import Faq from './sections/Faq'
import FinalCta from './sections/FinalCta'
import Footer from './sections/Footer'

export default function App() {
  return (
    <div className="min-h-screen bg-ink">
      <Nav />
      <main>
        <Hero />
        <HiddenLeak />
        <HowItWorks />
        <Integrations />
        <Results />
        <RoiCalculator />
        <Guarantee />
        <Pricing />
        <HumanAI />
        <Faq />
        <FinalCta />
      </main>
      <Footer />
    </div>
  )
}
