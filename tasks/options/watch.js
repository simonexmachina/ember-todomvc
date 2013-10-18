var Helpers = require('../helpers');

module.exports = {
  main: {
    files: ['app/**/*', 'public/**/*', 'tests/**/*'], // 'vendor/**/*', 
    tasks: ['build:debug']
  },
  test: {
    files: ['app/**/*', 'public/**/*', 'tests/**/*'], // 'vendor/**/*', 
    tasks: ['build:debug', 'karma:server:run']
  },
  options: {
    debounceDelay: 200,
    livereload: Helpers.isPackageAvailable("connect-livereload")
  }
};
