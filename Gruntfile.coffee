﻿module.exports = (grunt) ->

  grunt.initConfig
  
    pkg: grunt.file.readJSON 'package.json'
    
    coffeelint:
      app: ['src/coffee/**/*.coffee', 'test/src/**/*.coffee']
    
    jasmine:
      default:
        src: ['extension/chrome/utilities.js']
        options:
          keepRunner: false
          specs: 'test/spec/utilities.spec.js'

    coffee:
      default:
        options:
          bare: true
        files:
          # Firefox
          'extension/firefox/lib/main.js' : [
            'src/coffee/utilities.coffee'
            'src/coffee/firefox/main.coffee'
          ]
          'extension/firefox/data/utilities.js' : ['src/coffee/utilities.coffee']
          'extension/firefox/data/popup.js' : [
            'src/coffee/popup.coffee',
            'src/coffee/firefox/popup.coffee'
          ]
          # Chrome
          'extension/chrome/background.js' : ['src/coffee/chrome/background.coffee']
          'extension/chrome/content.js' : ['src/coffee/chrome/content.coffee']
          'extension/chrome/popup.js' : [
            'src/coffee/popup.coffee',
            'src/coffee/chrome/popup.coffee'
          ]
          'extension/chrome/utilities.js' : ['src/coffee/utilities.coffee']
          # Tests
          'test/spec/utilities.spec.js' : ['test/src/utilities.spec.coffee']
    
    less:
      default:
        files:
          'extension/chrome/popup.css': 'src/less/popup.less'
          'extension/firefox/data/popup.css': 'src/less/popup.less'
    
    watch:
      default:
        options:
          atStart: true
        files: ['src/less/**/*.less', 'src/coffee/**/*.coffee', 'test/src/**/*.coffee']
        tasks: ['dev']
    
    'mozilla-addon-sdk':
      '1_14':
        options:
          revision: '1.14'
      master:
        options:
          revision: 'master'
          github: true

    'mozilla-cfx-xpi':
      stable:
        options:
          'mozilla-addon-sdk': '1_14'
          extension_dir: 'extension/firefox'
          dist_dir: 'build/firefox/stable'
      experimental:
        options:
          'mozilla-addon-sdk': 'master'
          extension_dir: 'extension/firefox'
          dist_dir: 'build/firefox/experimental'

    'mozilla-cfx':
      run_stable:
        options:
          'mozilla-addon-sdk': '1_14'
          extension_dir: 'extension/firefox'
          command: 'run'
      run_experimental:
        options:
          'mozilla-addon-sdk': 'master'
          extension_dir: 'extension/firefox'
          command: 'run'
  
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-mozilla-addon-sdk'
  
  grunt.registerTask 'test', ['jasmine:default']
  grunt.registerTask 'dev', ['coffeelint', 'coffee:default', 'less:default', 'test']
  grunt.registerTask 'build', ['dev']
  grunt.registerTask 'default', ['watch:default']
