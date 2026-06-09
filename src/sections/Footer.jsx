import NodeField from '../components/NodeField'
import { APP_URL } from '../lib/links'

export default function Footer() {
  return (
    <footer className="relative overflow-hidden border-t border-white/10 bg-ink py-14">
      <NodeField density="low" intensity={0.25} greenBias={0.3} className="opacity-30" />
      <div className="container-c relative grid gap-10 sm:grid-cols-2 lg:grid-cols-4">
        <div>
          <div className="font-display text-lg font-extrabold text-white">CaseLift</div>
          <p className="mt-2 max-w-xs text-sm text-slate-400">We do the heavy lifting to get you more cases.</p>
          <a href="mailto:hello@caselift.io" className="mt-3 inline-block text-sm text-electric-300 hover:underline">hello@caselift.io</a>
          <div className="mt-4 inline-flex items-center gap-1.5 rounded-full border border-money/30 bg-money/10 px-2.5 py-1 text-xs font-medium text-money-300">
            <svg width="12" height="12" viewBox="0 0 20 20" fill="currentColor"><path d="M10 1l7 3v6c0 4.4-3 7.7-7 9-4-1.3-7-4.6-7-9V4l7-3z" /></svg> HIPAA Compliant
          </div>
        </div>
        <div>
          <h4 className="text-sm font-semibold text-white">Product</h4>
          <ul className="mt-3 space-y-2 text-sm text-slate-400">
            <li><a href="#how" className="hover:text-white">How It Works</a></li>
            <li><a href="#results" className="hover:text-white">Results</a></li>
            <li><a href="#pricing" className="hover:text-white">Pricing</a></li>
            <li><a href="#faq" className="hover:text-white">FAQ</a></li>
          </ul>
        </div>
        <div>
          <h4 className="text-sm font-semibold text-white">Company</h4>
          <ul className="mt-3 space-y-2 text-sm text-slate-400">
            <li><a href={APP_URL} className="hover:text-white">Log In</a></li>
            <li><a href="mailto:hello@caselift.io" className="hover:text-white">Contact</a></li>
          </ul>
        </div>
        <div>
          <h4 className="text-sm font-semibold text-white">Legal</h4>
          <ul className="mt-3 space-y-2 text-sm text-slate-400">
            <li><a href="/privacy" className="hover:text-white">Privacy</a></li>
            <li><a href="/terms" className="hover:text-white">Terms</a></li>
          </ul>
        </div>
      </div>
      <div className="container-c relative mt-10 border-t border-white/10 pt-6 text-xs text-slate-600">
        © {new Date().getFullYear()} CaseLift. All rights reserved.
      </div>
    </footer>
  )
}
