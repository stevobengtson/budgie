const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      color: {
        'turtle-green': {
          '50': '#f6fbea',
          '100': '#e9f6d1',
          '200': '#d4eea8',
          '300': '#b7e175',
          '400': '#9bd14a',
          '500': '#7cb62c',
          '600': '#5f911f',
          '700': '#496f1c',
          '800': '#3d581c',
          '900': '#344b1c',
          '950': '#263e0f',
        },
    }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
  darkMode: 'class',
}
