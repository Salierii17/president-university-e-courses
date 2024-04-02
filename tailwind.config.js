/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./website/**/*.{html,js,php}",
    "./website/*.{html,js,php}",
    "./website/courses/**/*.{html,js,php}",
    "./pages/**/*.{html,js,php}",
    "./pages/*.{html,js,php}", 
    "./src/**/*.{html,js}"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
