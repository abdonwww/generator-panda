options =
  optimize: 'none'
  generateSourceMaps: false
  preserveLicenseComments: true
  # name: './js/_lib/prod/almond/almond'
  wrap: true

  baseUrl: '/'
  paths:
    jquery: './js/_lib/prod/jquery/jquery'
    respond: './js/_lib/prod/respond/respond.min'
    modernizr: './js/_lib/prod/modernizr/modernizr'

  # load non-amd dependencies
  shim:
    jquery:
      exports: '$'

  exclude: [
    'jquery'
    'respond'
    'modernizr'
  ]



# Expose options in the global scope
module.exports = options if module? # for nodejs
window.require = options if window? # for browsers