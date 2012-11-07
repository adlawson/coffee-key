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
  style:
    bootstrap: './style/main.less'
    compiled:  './style/site.css'


# Default
desc 'Default task'
task 'default', ['compile']


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
    cmd = "#{paths.npmbin}/recess #{paths.style.bootstrap} > #{paths.style.compiled}"
    log 'Compiling client side CSS...', 'task'
    run [cmd], 'Compiled successfully', {printStderr:true, breakOnError:true}
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