module.exports = function(template, locals) {
  return require('handlebars').compile(template)(locals);
};

