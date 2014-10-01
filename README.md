# grunt-simple-cdnify

Grunt task for [cdnify](https://github.com/claudetech/node-cdnify).

Sample configuration:

```javascript
module.exports = function (grunt) {
  grunt.initConfig({
    cdnify: {
      dev: {
        files: [{
          expand: true,
          cwd: 'public',
          src: ['**/*.html'],
          dest: 'public',
          ext: '.html'
        }],
        options: {
          useLocal: true
        }
      },
      options: {
        incompatible: ['glob'],
        useLocal: false
      }
    }
  });

  grunt.loadNpmTasks('grunt-simple-cdnify');
};
```

See [cdnify](https://github.com/claudetech/node-cdnify) documentation for more information.
