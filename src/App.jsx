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
import EnergyBeam from './components/EnergyBeam'

export default function App() {
  return (
    <div className="relative min-h-screen overflow-x-clip bg-paper">
      {/* Faint cool background wash for depth. */}
      <div className="aurora" aria-hidden="true" />

      <div className="relative z-[2]">
        <Nav />
        <main>
          <Hero />
          <EnergyBeam height={120} />
          <HiddenLeak />
          <EnergyBeam height={120} />
          <HowItWorks />
          <EnergyBeam height={120} />
          <Integrations />
          <EnergyBeam height={120} />
          <Results />
          <EnergyBeam height={120} />
          <RoiCalculator />
          <EnergyBeam height={120} />
          <Guarantee />
          <EnergyBeam height={120} />
          <Pricing />
          <EnergyBeam height={120} />
          <HumanAI />
          <EnergyBeam height={120} />
          <Faq />
          <EnergyBeam height={120} />
          <FinalCta />
        </main>
        <Footer />
      </div>
    </div>
  )
}
