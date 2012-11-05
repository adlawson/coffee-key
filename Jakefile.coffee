'use strict'

# Dependencies
colors = require 'colors'
{exec} = require 'child_process'
path = require 'path'

# Paths
paths =
  config: './test/config'
  lib: './lib'
  nodebin: './node_modules/.bin'
  src: './src'
  test: './test'
  unitTest: './test/unit'

# Build JavaScript
desc 'Build JavaScript from CoffeeScript source'
task 'build', ['lint', 'test'], ->
  console.log 'Building:'.cyan
  exec "#{paths.nodebin}/coffee -o #{paths.lib} #{paths.src}", (error, stdout, stderr) ->
    if error is null
      console.log 'Done'.green
    else
      console.log stderr
      fail()
    complete()
, async: true

# Run CoffeeLint
desc 'Run CoffeeLint on CoffeeScript source'
task 'lint', ->
  console.log 'Linting:'.cyan
  exec getLintCommand(), (error, stdout, stderr) ->
    if stderr is ''
      console.log stdout
    else
      console.log stderr
      fail()
    complete()
, async: true

# Run unit tests
desc 'Run all unit tests'
task 'test', (filePath) ->
  if filePath?
    filePath = path.join paths.unitTest, filePath
    console.log "Testing #{filePath}:".cyan
  else
    console.log 'Testing:'.cyan
  exec getTestCommand(path: filePath), (error, stdout, stderr) ->
    if error is null
      console.log stdout
    else
      console.log stderr
      fail()
    complete()
, async: true

# Run CI tasks
desc 'Run CI tasks'
task 'ci', ['lint', 'test']

# Default task
task 'default', ['build']

# Generate a lint command
getLintCommand = (options = {}) ->
  options.configFile ?= "#{paths.config}/coffeelint.json"
  "#{paths.nodebin}/coffeelint -rf #{options.configFile} #{paths.src}/** #{paths.test}/**"

# Generate a test command
getTestCommand = (options = {}) ->
  options.ui ?= 'tdd'
  options.reporter ?= 'spec'
  options.path ?= paths.unitTest
  "#{paths.nodebin}/mocha --compilers coffee:coffee-script --ui #{options.ui} --reporter #{options.reporter} --colors --recursive #{options.path}"
