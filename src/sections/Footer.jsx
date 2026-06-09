import NodeField from '../components/NodeField'
import { APP_URL } from '../lib/links'

export default function Footer() {
  return (
    <footer className="relative overflow-hidden border-t border-line bg-paper py-14">
      <NodeField density="low" intensity={0.25} greenBias={0.3} className="opacity-30" />
      <div className="container-c relative grid gap-10 sm:grid-cols-2 lg:grid-cols-4">
        <div>
          <div className="font-display text-lg font-extrabold text-headline">CaseLift</div>
          <p className="mt-2 max-w-xs text-sm text-muted">We do the heavy lifting to get you more cases.</p>
          <a href="mailto:hello@caselift.io" className="mt-3 inline-block text-sm text-electric-700 hover:underline">hello@caselift.io</a>
          <div className="mt-4 inline-flex items-center gap-1.5 rounded-full border border-money/30 bg-money/10 px-2.5 py-1 text-xs font-medium text-money-700">
            <svg width="12" height="12" viewBox="0 0 20 20" fill="currentColor"><path d="M10 1l7 3v6c0 4.4-3 7.7-7 9-4-1.3-7-4.6-7-9V4l7-3z" /></svg> HIPAA Compliant
          </div>
        </div>
        <div>
          <h4 className="text-sm font-semibold text-headline">Product</h4>
          <ul className="mt-3 space-y-2 text-sm text-muted">
            <li><a href="#how" className="hover:text-headline">How It Works</a></li>
            <li><a href="#results" className="hover:text-headline">Results</a></li>
            <li><a href="#pricing" className="hover:text-headline">Pricing</a></li>
            <li><a href="#faq" className="hover:text-headline">FAQ</a></li>
          </ul>
        </div>
        <div>
          <h4 className="text-sm font-semibold text-headline">Company</h4>
          <ul className="mt-3 space-y-2 text-sm text-muted">
            <li><a href={APP_URL} className="hover:text-headline">Log In</a></li>
            <li><a href="mailto:hello@caselift.io" className="hover:text-headline">Contact</a></li>
          </ul>
        </div>
        <div>
          <h4 className="text-sm font-semibold text-headline">Legal</h4>
          <ul className="mt-3 space-y-2 text-sm text-muted">
            <li><a href="/privacy" className="hover:text-headline">Privacy</a></li>
            <li><a href="/terms" className="hover:text-headline">Terms</a></li>
          </ul>
        </div>
      </div>
      <div className="container-c relative mt-10 border-t border-line pt-6 text-xs text-faint2">
        © {new Date().getFullYear()} CaseLift. All rights reserved.
      </div>
    </footer>
  )
}
