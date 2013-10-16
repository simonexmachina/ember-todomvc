module.exports = {
  options: {
    includePaths: [
      'vendor/twitter-bootstrap-sass/vendor/assets/stylesheets'
    ]
  },
  compile: {
    files: {
      'tmp/public/assets/app.css': ['app/styles/**/*.{scss,sass}', '!app/styles/vendor.{scss,sass}'],
      'tmp/public/assets/vendor.css': 'app/styles/vendor.{scss,sass}'
    },
  }
};
