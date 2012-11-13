'use strict'

# Dependencies
{assert} = require 'chai'
{isRef} = require '../../src/ref'
{code} = require '../../src/key'


suite 'code:', ->
  suite 'alnum:', ->
    for key, ref of code.alnum
      test "#{key} is a reference", ->
        assert.isTrue isRef ref

  suite 'arrow:', ->
    for key, ref of code.arrow
      test "#{key} is a reference", ->
        assert.isTrue isRef ref

  suite 'special:', ->
    for key, ref of code.special
      test "#{key} is a reference", ->
        assert.isTrue isRef ref

  suite 'brand:', ->
    test 'apple key is a reference', ->
      assert.isTrue isRef code.brand.apple

    suite 'Windows keys:', ->
    for key, ref of code.brand.windows
      test "#{key} windows key is a reference", ->
        assert.isTrue isRef ref
