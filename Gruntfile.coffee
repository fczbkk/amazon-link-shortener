module.exports = (grunt) ->

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
    
    watch:
      default:
        options:
          atStart: true
        files: ['src/less/**/*.less', 'src/coffee/**/*.coffee', 'test/src/**/*.coffee']
        tasks: ['dev']
    
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-less'
  
  grunt.registerTask 'test', ['jasmine:default']
  grunt.registerTask 'dev', ['coffeelint', 'coffee:default', 'less:default', 'test']
  grunt.registerTask 'build', ['dev', 'uglify:default']
  grunt.registerTask 'default', ['watch:default']
