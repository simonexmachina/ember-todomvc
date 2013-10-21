var lockFile = require('lockfile'),
    fs = require('fs'),
    url = require('url'),
    Helpers = require('../helpers');

module.exports = {
  server: {
    options: {
      port: process.env.PORT || 8000,
      hostname: '0.0.0.0',
      base: 'tmp/public',
      // Use this option to have the catch-all return a different
      // page than index.html on any url not matching an asset.
      //   wildcard: 'not_index.html'
      middleware: middleware
    }
  },
  dist: {
    options: {
      port: process.env.PORT || 8000,
      hostname: '0.0.0.0',
      base: 'dist/',
      middleware: middleware
    }
  }
};

// works with tasks/locking.js
function lock(req, res, next) {
  (function retry() {
    if (lockFile.checkSync('tmp/connect.lock')) {
      setTimeout(retry, 30);
    } else {
      next();
    }
  }());
}

function wildcardResponseIsValid(request) {
  var urlSegments = request.url.split('.'),
      extension   = urlSegments[urlSegments.length-1];
  return (
    ['GET', 'HEAD'].indexOf(request.method.toUpperCase()) > -1 &&
    (urlSegments.length === 1 || extension.indexOf('htm') === 0 || extension.length > 5)
  );
}

function buildWildcardMiddleware(options) {
  return function(request, response, next) {
    if (!wildcardResponseIsValid(request)) { return next(); }

    var wildcard     = (options.wildcard || 'index.html'),
        wildcardPath = options.base + "/" + wildcard;

    fs.readFile(wildcardPath, function(err, data){
      if (err) { return next('ENOENT' === err.code ? null : err); }

      response.writeHead(200, { 'Content-Type': 'text/html' });
      response.end(data);
    });
  };
}

function reverseProxy() {
  var httpProxy = require('http-proxy'),
      proxy = new httpProxy.RoutingProxy(),
      Buffer = require('buffer').Buffer,
      userPass = new Buffer('30132a35-c23c-490b-a081-b9110733e993', "ascii").toString("base64");
  return function (req, res, next) {
    if( req.url.indexOf('/v0/') === 0 ) {
      req.headers.authorization = "Basic " + userPass;
      proxy.proxyRequest(req, res, {
        host: 'api.orchestrate.io',
        port: 80,
      });
    }
    else if( req.url.indexOf('/verify') === 0 ) {
      proxy.proxyRequest(req, res, {
        target: 'http://verifier.login.persona.org',
        // port: 443,
        // https: true
      });
    }
    else {
      next();
    }
  };
}

function middleware(connect, options) {
  var result = [
    lock,
    connect['static'](options.base),
    connect.directory(options.base),
    reverseProxy(),
    // Remove this middleware to disable catch-all routing.
    buildWildcardMiddleware(options)
  ];

  // Add livereload middlware after lock middleware if enabled
  if (Helpers.isPackageAvailable("connect-livereload")) {
    result.splice(1,0, require("connect-livereload")());
  }

  return result;
}
