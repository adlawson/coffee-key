'use strict'

# Dependencies
colors = require 'colors'
{exec} = require 'child_process'
fs = require 'fs'
path = require 'path'


# Paths
paths =
  bootstrap: './src/key.coffee'
  config:    './test/config'
  integration: './test/integration'
  lib:       './lib'
  minified:  './key.min.js'
  npmbin:    './node_modules/.bin'
  src:       './src'
  unit:      './test/unit'


# Default
desc 'Default task'
task 'default', ['build']


# Build
desc 'Build the project'
task 'build', ['lint', 'test', 'compile', 'bundle']


# CI build
desc 'Continuously integrate'
task 'ci', ['lint', 'test']


# Bundle
desc 'Bundle client side JavaScript'
task 'bundle', ->
  cmd = "#{paths.npmbin}/browserify #{paths.bootstrap} | #{paths.npmbin}/uglifyjs --lift-vars -o #{paths.minified}"
  log 'Bundling client side...', 'task'
  run [cmd], 'Bundled successfully', {printStderr:true, breakOnError:true}
, async:true


# Compile
desc 'Compile JavaScript library'
task 'compile', ->
  cmd = "#{paths.npmbin}/coffee -o #{paths.lib} #{paths.src}"
  log 'Compiling library...', 'task'
  run [cmd], 'Compiled successfully', printStderr:true
, async:true


# Lint
desc 'Lint CoffeeScript source'
task 'lint', ->
  cmd = "#{paths.npmbin}/coffeelint -rf #{paths.config}/coffeelint.json #{paths.src}/** #{paths.unit}/**"
  log 'Linting source...', 'task'
  run [cmd], 'Linted successfully', {printStderr:true, printStdout:true, breakOnError:false}
, async:true


# Test
desc 'Test CoffeeScript source'
task 'test', ['test:unit', 'test:integration']
namespace 'test', ->

  desc 'Unit test CoffeeScript source'
  task 'unit', ->
    options =
      reporter: 'spec'
      ui: 'tdd'
    cmd = "#{paths.npmbin}/mocha --compilers coffee:coffee-script --ui #{options.ui} --reporter #{options.reporter} --colors --recursive #{paths.unit}"
    log 'Unit testing...', 'task'
    run [cmd], 'Unit tested successfully', {printStderr:true, printStdout:true, breakOnError:false}
  , async:true

  desc 'Integration test CoffeeScript source'
  task 'integration', ->
    options =
      reporter: 'spec'
      ui: 'tdd'
    cmd = "#{paths.npmbin}/mocha --compilers coffee:coffee-script --ui #{options.ui} --reporter #{options.reporter} --colors --recursive #{paths.integration}"
    log 'Integration testing...', 'task'
    run [cmd], 'Integration tested successfully', {printStderr:true, printStdout:true, breakOnError:false}
  , async:true


# Run a command
#
# @param [Array] commands
# @param [String] successMsg
# @param [Object] options
run = (commands, successMsg, options) ->
  exec commands, (error, stdout, stderr) ->
    unless error?
      log stdout
      log successMsg, 'success' if successMsg?
    else
      log stderr
    complete()
  , options


# Write to the log
#
# @param [String] message
# @param [String] level
log = (message, level) ->
  console.log switch level
    when 'task' then '\n' + message.cyan
    when 'success' then (' > ' + message).green
    when 'error' then (' > ' + message).red
    else message