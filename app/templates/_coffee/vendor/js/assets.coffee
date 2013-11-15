options =
  optimize: 'uglify2'
  generateSourceMaps: false
  preserveLicenseComments: true
  wrap: false

  baseUrl: '/'
  paths:
    almond: './vendor/assets/almond/js/almond'
    html5shiv: './vendor/assets/html5shiv/js/html5shiv'
    modernizr: './vendor/assets/modernizr/js/modernizr'
    respond: './vendor/assets/respond/js/respond.min'
    jquery: './vendor/assets/jquery/js/jquery'

  # load non-amd dependencies
  shim:
    jquery:
        exports: '$'

  include: [
    'almond'
    'html5shiv'
    'modernizr'
    'respond'
    'jquery'
  ]

# Expose options in the global scope
module.exports = options if module? # for nodejs
window.require = options if window? # for browsers
