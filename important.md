# Gulp

https://travismaynard.com/writing/getting-started-with-gulp 

## To add watcher
``` javascript
var gulp = require('gulp');

gulp.task('watch', function() {
  gulp.watch('css/*.css', ['print']); // print task will be invoked every time a file changes in the css folder
})

gulp.task('print', function(){
  console.log('ok');
});
```

# compiling less 
``` javascript
// Build CSS
var less = require('gulp-less');
gulp.task('build-less', function(){
    return gulp.src('less/**.less')
        .pipe(less())
        .pipe(gulp.dest('./css'));
});
```
