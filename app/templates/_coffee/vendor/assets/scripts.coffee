options =
  # enforceDefine: true
  # optimize: 'none'
  optimize: 'uglify2'
  generateSourceMaps: false
  preserveLicenseComments: true
  wrap: false

  baseUrl: '/'
  paths:
    almond: './vendor/assets/almond/js/almond'
    jquery: './vendor/assets/jquery/js/jquery'

  # load non-amd dependencies
  shim: {}

  include: [
    'almond'
    'jquery'
  ]

require = options if window?
module.exports = options if module?
