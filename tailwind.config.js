module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/components/**/*.{rb,html.erb}"
  ],
  safelist: [
    'bg-brand',
    'hover:bg-brand-dark'
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          DEFAULT: "#9AC94E",
          dark: "#7AAA3D",
        },
      },
    },
  },
  plugins: [],
}
