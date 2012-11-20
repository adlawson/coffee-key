'use strict'

# Dependencies
{assert} = require 'chai'
{isRef} = require '../../src/ref'
{code} = require '../../src/key'


suite 'code:', ->
  suite 'alnum:', ->
    for key, ref of code.alnum
      do (key, ref) ->
        test "#{key} is a reference", ->
          assert.isTrue isRef ref

  suite 'arrow:', ->
    for key, ref of code.arrow
      do (key, ref) ->
        test "#{key} is a reference", ->
          assert.isTrue isRef ref

  suite 'special:', ->
    for key, ref of code.special
      do (key, ref) ->
        test "#{key} is a reference", ->
          assert.isTrue isRef ref

  suite 'brand:', ->
    test 'apple key is a reference', ->
      assert.isTrue isRef code.brand.apple

    suite 'windows:', ->
      for key, ref of code.brand.windows
        do (key, ref) ->
          test "#{key} key is a reference", ->
            assert.isTrue isRef ref
