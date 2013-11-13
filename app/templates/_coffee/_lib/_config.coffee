options =
  optimize: 'uglify2'
  generateSourceMaps: false
  preserveLicenseComments: true
  wrap: false

  baseUrl: '/'
  paths:
    almond: './js/_lib/prod/almond/almond'
    jquery: './js/_lib/prod/jquery/jquery'
    respond: './js/_lib/prod/respond/respond.min'
    modernizr: './js/_lib/prod/modernizr/modernizr'

  # load non-amd dependencies
  shim:
    jquery:
      exports: '$'

  include: [
    'almond'
    'jquery'
    'modernizr'
    'respond'
  ]


# Expose options in the global scope
module.exports = options if module? # for nodejs
window.require = options if window? # for browsers