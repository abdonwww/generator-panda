'use strict';

module.exports = (grunt) ->

  ###*
   Load grunt-* packages
  ###
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  ###*
   Load packages
  ###
  extend = require('extend')

  ###*
   Initialize variables
  ###
  tempDir = 'temp'
  buildDir = 'build'

  ###*
   Configure
  ###
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    ###*
     Connect
    ###
    connect:
      server:
        options:
          port: 8000
          protocol: 'http'
          hostname: "*"
          base: tempDir
          directory: null
          keepalive: false
          debug: false
          livereload: false
          open: false
          # middleware: ->

    ###*
     Watch
    ###
    watch:
      jshint:
        files: ["static/**/*.js"]
        tasks: ["jshint"]
      copy:
        files: ["static/**/*"]
        tasks: ["copy:development"]
      jade:
        files: ["jade/**/*.jade"]
        tasks: ["jade:development"]
      stylus:
        files: ["styl/**/*.styl"]
        tasks: ["stylus:development"]
      coffee:
        files: ["coffee/**/*.coffee"]
        tasks: ["coffee"]

    ###*
     Clean
    ###
    clean:
      development:
        src: [tempDir]
      production:
        src: [buildDir]

    ###*
     Copy
    ###
    copy:
      development:
        files: [
          {
            expand: true
            flatten: false
            cwd: "static/"
            src: ['**']
            dest: "#{tempDir}/"
          }
        ]
      production:
        files: [
          {
            expand: true
            flatten: false
            cwd: "static/"
            src: ['**', '!**/_*.{png,jpg,gif}']
            dest: "#{buildDir}/"
          }
        ]

    ###*
     Imagemin
    ###
    imagemin:
      options:
        optimizationLevel: 3
        progressive: true
        interlaced: true
        pngquant: false
      production:
        files: [
          {
            expand: true
            flatten: false
            cwd: "static/"
            src: ['**/*.{png,jpg,gif}']
            dest: "#{buildDir}/"
          }
        ]

    ###*
     Bower task
    ###
    bower:
      install:
        options:
          targetDir: "#{tempDir}/js/_lib/"
          layout: 'byType' # or "byComponent"
          install: true # Whether you want to run bower install task itself (e.g. you might not want to do this each time on CI server).
          copy: true # Copy Bower packages to target directory.
          verbose: false # Display detail log output
          cleanTargetDir: true # Will clean target dir before running install.
          cleanBowerDir: false # Will remove bower's dir after copying all needed files into target dir.
          # cleanup: false # If set to true or false then both cleanBowerDir & cleanTargetDir are set to the value of cleanup.

    ###*
     Jade
    ###
    jade:
      options:
        pretty: true
        # data: (dest, src) ->
        #   return {
        #     from: src
        #     to: dest
        #   }
        filters:
          some: (block) ->
            return
          another: (block) ->
            return
        compileDebug: true
        client: false
        namespace: "JST"
        amd: false
        processName: (filename) ->
          return do filename.toUpperCase
      development:
        options:
          data:
            rootDir: "/"
            debug: true
            # projectDir: __dirname
        files: [{
          dot: true
          matchBase: true

          expand: true
          flatten: false
          cwd: 'jade/'
          src: ['**/*.jade', '!**/_*.jade', '!**/_*/**/*.jade']
          dest: "#{tempDir}/"
          ext: '.html'
        }]
      preview:
        options:
          data:
            rootDir: "/path/to/directory/"
            debug: false
            # projectDir: __dirname
        files: [{
          dot: true
          matchBase: true

          expand: true
          flatten: false
          cwd: 'jade/'
          src: ['**/*.jade', '!**/_*.jade', '!**/_*/**/*.jade']
          dest: "#{buildDir}/"
          ext: '.html'
        }]
      production:
        options:
          data:
            rootDir: "/path/to/directory/"
            debug: false
            # projectDir: __dirname
        files: [{
          dot: true
          matchBase: true

          expand: true
          flatten: false
          cwd: 'jade/'
          src: ['**/*.jade', '!**/_*.jade', '!**/_*/**/*.jade']
          dest: "#{buildDir}/"
          ext: '.html'
        }]

    ###*
     Stylus
    ###
    stylus:
      options:
        compress: false
        linenos: true
        firebug: false
        # paths: ['path/to/import', 'another/to/import']
        define: {
          pkg: grunt.pkg
        } # Allows you to define global variables in Gruntfile that will be accessible in Stylus files.
        # urlfunc: "String: Specifies function name that should be used for embedding images as Data URI."
        use: [] # Allows passing of stylus plugins to be used during compile
        import: []
        "include css": true
        "resolve url": true
        banner: '/*! <%%= pkg.name %> <%%= grunt.template.today("yyyy-mm-dd") %> */'
      development:
        files: [{
          dot: true
          matchBase: true

          expand: true
          flatten: false
          cwd: 'styl/'
          src: ['**/*.styl', '!**/_*.styl', '!**/_*/**/*.styl']
          dest: "#{tempDir}/css/"
          ext: '.css'
        }]
      production:
        options:
          linenos: false
        files: [{
          dot: true
          matchBase: true

          expand: true
          flatten: false
          cwd: 'styl/'
          src: ['**/*.styl', '!**/_*.styl', '!**/_*/**/*.styl']
          dest: "#{buildDir}/css/"
          ext: '.css'
        }]

    ###*
     Coffeescript
    ###
    coffee:
      options:
        separator: "/* Grunt Separator */"
        bare: false
        join: false
        sourceMap: false

      compile:
        files: [{
          dot: true
          matchBase: true

          expand: true
          flatten: false
          cwd: 'coffee/'
          src: ['**/*.coffee']
          dest: "#{tempDir}/js/"
          ext: '.js'
        }]

    ###*
     Jshint
    ###
    jshint:
      options:
        jshintrc: '.jshintrc'
        # extensions: ''
        # force: false
        # ignores: []
        # reporter: 'STRING' # 'jslint' or 'checkstyle'
        # reporterOutput: 'STRING'
      files: ["static/**/*.js"]

    ###*
     Requirejs (See the original task below)
    ###
    requirejs: {}


  ###*
   Create the original tasks
  ###
  grunt.registerTask 'custom_requirejs', 'Run requirejs configuration and execution', ()->

    requireConfig = {}

    # Consolidate libraries
    libConfig = require("./#{tempDir}/js/_lib/_config")
    requireConfig["library"] =
      options: extend(true, {}, libConfig, {
        baseUrl: tempDir
        # name: "js/_lib/libraries"
        # insertRequire: []
        out: "#{buildDir}/js/libraries.js"
      })

    # Consolidate general scripts
    baseConfig = require("./#{tempDir}/js/_config")
    requireFiles = grunt.file.expandMapping(
      ['**/*.js', '!**/_*.js', '!**/_*/**/*.js']
      tempDir
      {
        cwd: tempDir
        flatten: false
        nonull: false
        matchBase: false
        ext: '.js'
        rename: (dest, matchedSrcPath, options) ->
          return matchedSrcPath
      }
    )

    requireFiles.forEach (filepath, index, object) ->
      requireConfig["target#{index}"] =
        options: extend(true, {}, baseConfig, {
          baseUrl: tempDir
          name: filepath.src[0].replace("#{tempDir}/", '').replace('.js', '')
          # include: filepath.src[0].replace("#{tempDir}/", '').replace('.js', '')
          # insertRequire: ["#{buildDir}/" + filepath.dest]
          out: "#{buildDir}/" + filepath.dest
        })

    grunt.config.set 'requirejs', requireConfig
    grunt.task.run 'requirejs'


  ###*
   Register tasks
  ###
  grunt.registerTask "build:development", "Build for development", [
    "clean:development"
    "jshint"
    "bower"
    "copy:development"
    "jade:development"
    "stylus:development"
    "coffee"
  ]

  grunt.registerTask "build:preview", "Build for preview", [
    "clean"
    "jshint"
    "bower"
    "copy:production"
    "imagemin:production"
    "jade:preview"
    "stylus:production"
    "coffee"
    "custom_requirejs"
    "clean:development"
  ]

  grunt.registerTask "build:production", "Build for production", [
    "clean"
    "jshint"
    "bower"
    "copy:production"
    "imagemin:production"
    "jade:production"
    "stylus:production"
    "coffee"
    "custom_requirejs"
    "clean:development"
  ]

  grunt.registerTask "build", "Run default tasks", () ->
    grunt.task.run 'build:production'


  grunt.registerTask "default", "Run default tasks", () ->
    grunt.log.writeln "Starting static web server in '#{tempDir}' on port 8000 as watching file updates"
    grunt.task.run 'build:development'
    grunt.task.run 'connect'
    grunt.task.run 'watch'





