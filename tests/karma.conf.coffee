# Karma configuration
# Generated on Tue Oct 07 2014 13:57:40 GMT-0400 (EDT)

gulpConfig = require '../gulp'

module.exports = (config) ->
  # console.log 'gulpConfig', gulpConfig.paths.libs
  files = [
    'bower_components/angular-mocks/angular-mocks.js'
    'public/endpoints.js'
    'tmp/*.js'
    'tmp/**/*.js'
    'app/**/*.unit-test.coffee'
  ]
  files = gulpConfig.paths.libs.concat files
  # console.log 'files', files
  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '../'


    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine']


    # list of files / patterns to load in the browser
    files: files


    # list of files to exclude
    exclude: [
    ]

    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress']

    # preprocess the coffeescript
    preprocessors: {
      '**/*.coffee': ['coffee']
    }


    # web server port
    port: 9876


    # enable / disable colors in the output (reporters and logs)
    colors: true


    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO


    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true


    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome_without_security']
    customLaunchers:
      Chrome_without_security:
        base: 'Chrome'
        flags: ['--disable-web-security']


    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false
