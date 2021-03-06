options =
  # enforceDefine: true
  # optimize: 'none'
  optimize: 'uglify2'
  generateSourceMaps: false
  preserveLicenseComments: true
  wrap: true

  baseUrl: '/'
  paths:
    rootDir: './'
    jquery: './vendor/assets/jquery/js/jquery'

  # load non-amd dependencies
  shim: {}

  exclude: [
    'jquery'
  ]

require = options if window?
module.exports = options if module?
