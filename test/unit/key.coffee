'use strict'

# Dependencies
{assert} = require 'chai'
{spy} = require 'sinon'

suite 'key:', ->
  key = require '../../src/key'

  test 'should be an object', ->
    assert.isObject key

  test 'should be awesome', ->
    assert.isTrue key.isAwesome
