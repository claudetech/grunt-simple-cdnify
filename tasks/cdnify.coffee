cdnify = require 'cdnify'
_      = require 'lodash'

module.exports = (grunt) ->
  grunt.registerMultiTask 'cdnify', 'Use CDN in HTML files.', ->
    done = @async()
    baseOptions = this.options(
      incompatible: []
      useLocal: false
      cdnAttr: 'cdn'
    )

    return done() if @files.length == 0

    count = 0
    @files.forEach (f) =>
      src = f.src?[0]
      return unless src?
      options = _.extend({output: f.dest}, baseOptions)
      cdnify.processFile src, options, (err, html) =>
        if err?
          grunt.log.error "Failed to compile: #{err.message ? err}"
          grunt.fail.warn "cdnify task failed"
        count += 1
        done() if count == @files.length
