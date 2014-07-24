module.exports = (grunt) ->

  # configure the tasks
  grunt.initConfig
  # Task to copy files from src to dest
    copy:
      build:
        files: [
          src: [
            'src/**/*'
            'public/**/*'
            'views/**/*'
          ]
          dest: 'build/'
        ]

  # Task to compile coffee files from src to dest
    coffee:
      build:
        options :
          bare: true
        expand: true
        src: [
          'src/**/*.coffee',
          'public/**/*.coffee',
        ]
        dest: 'build/'
        ext: '.js'

  # Task to removed files
    clean:
      build:
        src: ['build']
      coverage:
        src: ['coverage']


  # load the tasks for build
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'build', [
    'clean:build'
    'copy:build'
    'coffee'
  ]


