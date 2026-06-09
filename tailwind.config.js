/** CaseLift brand theme — semantic tokens. */
export default {
  content: ['./index.html', './src/**/*.{js,jsx}'],
  theme: {
    extend: {
      colors: {
        // Brand blue ramp. 500/600 = brand. 700/800 = AA-safe text on light.
        electric: { DEFAULT: '#0EA5E9', 50: '#E0F2FE', 300: '#7DD3FC', 400: '#38BDF8', 500: '#0EA5E9', 600: '#0284C7', 700: '#0369A1', 800: '#0C4A6E', 900: '#0C4A6E' },
        // Money / success green. 700 = readable-on-light body.
        money: { DEFAULT: '#10B981', 300: '#6EE7B7', 400: '#34D399', 600: '#059669', 700: '#047857' },
        accent: { DEFAULT: '#0EA5E9', hover: '#0284C7' }, // primary CTA fill

        // Premium clinical light surface system (slate scale).
        paper: '#F8FAFC',     // page background
        panel: '#F1F5F9',     // subtle fill / nested chips
        panel2: '#E2E8F0',    // dividers / input fill
        panel3: '#CBD5E1',    // strong surface / tracks

        // Text ramp.
        headline: '#0F172A',  // headings / emphasis
        body: '#64748B',      // default body
        muted: '#94A3B8',     // meta / placeholders
        faint: '#94A3B8',
        faint2: '#94A3B8',

        // Hairlines.
        line: '#E2E8F0',
        line2: '#CBD5E1',

        // Legacy darks (retained ONLY for node-art / pipeline SVG fills).
        ink: '#0B0F19',
        space: { DEFAULT: '#0B0F19', 800: '#111827', 700: '#1A2235', 600: '#232c44' },
      },
      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui', '-apple-system', 'sans-serif'],
        display: ['Inter', 'ui-sans-serif', 'system-ui', 'sans-serif'],
      },
      fontSize: {
        hero: ['clamp(2.6rem, 7vw, 5.5rem)', { lineHeight: '1.02', letterSpacing: '-0.03em' }],
        section: ['clamp(2rem, 4.5vw, 3.5rem)', { lineHeight: '1.05', letterSpacing: '-0.02em' }],
      },
      maxWidth: { content: '1200px' },
      boxShadow: {
        // Soft Apple-style elevation (replaces the old neon glows).
        glow: '0 10px 34px -14px rgba(14,165,233,0.28)',
        'glow-green': '0 10px 34px -14px rgba(16,185,129,0.28)',
        card: '0 1px 2px rgba(0,0,0,0.04), 0 12px 32px -16px rgba(0,0,0,0.14)',
        'card-hover': '0 4px 10px rgba(0,0,0,0.05), 0 22px 48px -20px rgba(0,0,0,0.22)',
      },
      keyframes: {
        sheen: { '0%': { transform: 'translateX(-120%)' }, '100%': { transform: 'translateX(220%)' } },
        breathe: { '0%,100%': { opacity: '0.85', transform: 'scale(1)' }, '50%': { opacity: '1', transform: 'scale(1.04)' } },
        spinSlow: { to: { transform: 'rotate(360deg)' } },
        pulseGlow: { '0%,100%': { boxShadow: '0 0 0 0 rgba(14,165,233,0.45)' }, '50%': { boxShadow: '0 0 28px 4px rgba(14,165,233,0.55)' } },
      },
      animation: {
        sheen: 'sheen 0.9s ease-in-out',
        breathe: 'breathe 4s ease-in-out infinite',
        spinSlow: 'spinSlow 6s linear infinite',
        pulseGlow: 'pulseGlow 3s ease-in-out infinite',
      },
    },
  },
  plugins: [],
}
