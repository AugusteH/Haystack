var gulp = require( 'gulp' ),
	// Automatically load any gulp plugins in your package.json
	plugins = require('gulp-load-plugins')();

// paths to directories and files used throughout grunt file
var paths = {
  index: ['app/index.html'],
  generated: ["app/app.css", 'jshint-output.log'],
  libs: ['app/bower_components/**/*.js', 'app/bower_components/**/**/**/**/*.js', 'app/bower_components/**/*.css', '!app/bower_components/**/*theme.css', 
  '!app/bower_components/**/src/**/*.css', '!app/bower_components/**/*.min.css'],
  js: ['app/components/**/*.js', 'app/components/**/**/*.js', 'app/modules/**/*.js', 'app/modules/**/**/*.js'],
  styles: ['app/resources/**/*.less', 'app/components/**/*.less', 'app/components/**/**/*.less', 'app/modules/**/*.less', 'app/modules/**/**/*.less'],
  specs: ['./test/e2e/*spec.js'],
  testConfig: 'test/e2e/conf.js',
  concatStyles: 'app.css',
  baseDir: 'app/'
};

// Error handler called from gulp-plumber
var onError = function (error) {
  plugins.util.beep();  
  plugins.util.log(plugins.util.colors.red('Error (' + error.plugin + '): ' + error.message));
};

// Run e2e tests
// start selinium webdriver standalone locally
// and then runs protractor tests
// Run manually with: 'gulp test:e2e'
gulp.task('test:e2e', function(callback) {
    gulp
        .src(paths.specs)
        .pipe(plugins.plumber({
          errorHandler: onError
        }))
        .pipe(plugins.angularProtractor({
            'configFile': paths.testConfig,
            'debug': false,
            'autoStartStopServer': true
        }))
        .on('end', callback);
});


 // Run test once and exit
 // Run manually with: 'gulp test:e2e'
gulp.task('test:unit', function (done) {
  var Server = require('karma').Server;
  new Server({
    configFile: __dirname + '/karma.conf.js',
    singleRun: true
  }, done).start();
});


// Removes files and folders
// Run manually with: 'gulp clean' 
gulp.task('clean', function () {
  return gulp.src(paths.generated, {read: false})
    .pipe(plugins.plumber({
          errorHandler: onError
    }))
    .pipe(plugins.clean());
});

// Less to CSS: Run manually with: "gulp less"
gulp.task('less', function () {
  return gulp.src(paths.styles)
    .pipe(plugins.plumber({
          errorHandler: onError
    }))
    .pipe(plugins.less({
      compress: true,
      lint: true
    }))
    .pipe(plugins.autoprefixer({
      browsers: [
        '> 10%',
        'last 2 versions',
        'Firefox >= 4',
        'Safari >= 7',
        'IE >= 8',
        'Edge >= 12',
        'Chrome >= 30'
      ],
      cascade: false
    }))
    .pipe(plugins.concat(paths.concatStyles))
    .pipe(gulp.dest(paths.baseDir));
});
 

// run to detect basic javascript syntax  errors
// Run manually with: 'gulp lint'
gulp.task('lint', function() {
  return gulp.src(paths.js)
    .pipe(plugins.plumber({
          errorHandler: onError
    }))
  	.pipe(plugins.jshint('.jshintrc'))
    .pipe(plugins.jshint.reporter('gulp-jshint-file-reporter', {
      filename: __dirname + '/jshint-output.log'
    }))
});

// run to inject current bower component dependencies dynamically 
// Run manually with: 'gulp wiredep'
gulp.task('wiredep', function() {
    var wiredep = require('wiredep').stream;
    var target = gulp.src(paths.index);

    return target
        .pipe(plugins.plumber({
          errorHandler: onError
        }))
        .pipe(wiredep({
          dependencies: true
        }))
        .pipe(gulp.dest(paths.baseDir))

});


// run the wiredep, lint, less, and clean tasks
// Run manually with: 'run-dev'
gulp.task('run-dev', function() {
  var runSequence = require('run-sequence');
  runSequence('clean', ['wiredep', 'less', 'lint']);
})