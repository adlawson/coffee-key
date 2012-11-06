'use strict'

# Dependencies
{assert} = require 'chai'
{spy} = require 'sinon'
{mockRef} = require '../mock/ref'


suite 'ref:', ->
  ref = require '../../src/ref'

  suite 'exports:', ->
    test 'ref is an object', ->
      assert.isObject ref

    test 'ref.ref is a function', ->
      assert.isFunction ref.ref

    test 'ref.isRef is a function', ->
      assert.isFunction ref.isRef

    test 'ref.assertRef is a function', ->
      assert.isFunction ref.assertRef


  suite 'ref:', ->
    test 'ref returns a new Reference', ->
      assert.isObject ref.ref 'foo', 1


  suite 'isRef:', ->
    test 'isRef with null returns false', ->
      assert.isFalse ref.isRef null

    test 'isRef with an object returns false', ->
      assert.isFalse ref.isRef {}

    test 'isRef with an array returns false', ->
      assert.isFalse ref.isRef []

    test 'isRef with a string returns false', ->
      assert.isFalse ref.isRef 'foo'

    test 'isRef with a number returns false', ->
      assert.isFalse ref.isRef 1

    test 'isRef with a boolean returns false', ->
      assert.isFalse ref.isRef true

    test 'isRef with a Reference returns true', ->
      mock = mockRef 'foo', 1
      assert.isTrue ref.isRef mock


  suite 'assertRef:', ->
    test 'assertRef with null throws', ->
      assert.throws -> ref.assertRef null

    test 'assertRef with an object throws', ->
      assert.throws -> ref.assertRef {}

    test 'assertRef with an array throws', ->
      assert.throws -> ref.assertRef []

    test 'assertRef with a string throws', ->
      assert.throws -> ref.assertRef 'foo'

    test 'assertRef with a number throws', ->
      assert.throws -> ref.assertRef 1

    test 'assertRef with a boolean throws', ->
      assert.throws -> ref.assertRef true

    test 'assertRef with a Reference does not throw', ->
      mock = mockRef 'foo', 1
      assert.doesNotThrow -> ref.assertRef mock
