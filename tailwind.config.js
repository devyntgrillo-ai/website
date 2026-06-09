/** CaseLift brand theme — semantic tokens. */
export default {
  content: ['./index.html', './src/**/*.{js,jsx}'],
  theme: {
    extend: {
      colors: {
        // Brand (exact values).
        electric: { DEFAULT: '#0EA5E9', 50: '#E0F2FE', 300: '#7DD3FC', 400: '#38BDF8', 600: '#0284C7' },
        money: { DEFAULT: '#10B981', 300: '#6EE7B7', 400: '#34D399', 600: '#059669' },
        ink: '#0B0F19',          // dark background
        surface: '#F8FAFC',      // light surface
        // Layered darks for depth.
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
        glow: '0 0 40px -8px rgba(14,165,233,0.45)',
        'glow-green': '0 0 40px -8px rgba(16,185,129,0.45)',
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
