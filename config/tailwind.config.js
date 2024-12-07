const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js',
     './app/assets/javascripts/**/*.js'
  ],
  theme: {
    extend:{
        fontFamily: {
          sans: ["CalSans", ...defaultTheme.fontFamily.sans],
        },
        colors: {
          rosa: {
            light: '#f48fb1', // Rosa para botones
            hover: '#f06292', // Rosa para hover
            pale: '#f8bbd0',  // Rosa pálido para bordes o foco
          },
          gris: {
            light: '#f5f5f5', // Gris para el fondo
          },
        },
      },
    },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin'),
  ]
}
