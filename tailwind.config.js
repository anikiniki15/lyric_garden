/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/components/**/*.{rb,html.erb}"
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
};
