'use strict'

# Dependencies
colors = require 'colors'
{exec} = require 'child_process'
path = require 'path'


# Paths
paths =
  npmbin:    './node_modules/.bin'
  script:
    bootstrap: './script/main.coffee'
    compiled:  './script/site.js'
    minified:  './script/site.min.js'
  style:
    bootstrap: './style/main.less'
    compiled:  './style/site.css'
    minified:  './style/site.min.css'


# Default
desc 'Default task'
task 'default', ['compile', 'minify']


# CI build
desc 'Continously integrate'
task 'ci', ->


# Compile
desc 'Compile client side'
task 'compile', ['compile:script', 'compile:style']
namespace 'compile', ->

  desc 'Compile client side JavaScript'
  task 'script', ->
    cmd = "#{paths.npmbin}/browserify -o #{paths.script.compiled} #{paths.script.bootstrap}"
    log 'Compiling client side JavaScript...', 'task'
    run [cmd], 'Compiled successfully', {printStderr:true, breakOnError:true}
  , async:true

  desc 'Compile client side styles'
  task 'style', ->
    cmd = "#{paths.npmbin}/lessc #{paths.style.bootstrap} > #{paths.style.compiled}"
    log 'Compiling client side CSS...', 'task'
    run [cmd], 'Compiled successfully', {printStderr:true, breakOnError:true}
  , async:true


# Minify
desc 'Minify client side'
task 'minify', ['minify:script', 'minify:style']
namespace 'minify', ->

  desc 'Minify client side JavaScript'
  task 'script', ->
    cmd = "#{paths.npmbin}/uglifyjs --lift-vars -o #{paths.script.minified} #{paths.script.compiled}"
    log 'Minifying client side JavaScript...', 'task'
    run [cmd], 'Minified successfully', {printStderr:true, breakOnError:true}
  , async:true

  desc 'Minify client side styles'
  task 'style', ->
    cmd = "#{paths.npmbin}/cleancss -o #{paths.style.minified} #{paths.style.compiled}"
    log 'Minifying client side CSS...', 'task'
    run [cmd], 'Minified successfully', {printStderr:true, breakOnError:true}
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