'use strict'

# Dependencies
{assert} = require 'chai'
{isRef} = require '../../src/ref'
{code} = require '../../src/key'


# Test refs in a collection
#
# @param [Object] collection
# @param [Function] fn
testCollection = (collection, fn = testRef) ->
  for key, ref of collection
    fn key, ref


# Test a ref
#
# @param [String] name
# @param [Reference] ref
testRef = (name, ref) ->
  test "#{name} is a reference", ->
    assert.isTrue isRef ref


# Tests
suite 'code:', ->
  suite 'alnum:', ->
    testCollection code.alnum

  suite 'arrow:', ->
    testCollection code.arrow

  suite 'special:', ->
    testCollection code.special

  suite 'brand:', ->
    testRef 'apple', code.brand.apple

    suite 'windows:', ->
      testCollection code.brand.windows

  suite 'punctuation:', ->
    for key, ref of code.punctuation
      if ref not in [code.punctuation.brace, code.punctuation.slash]
        testRef key, ref

    suite 'brace:', ->
      suite 'square:', ->
        testCollection code.punctuation.brace.square

      suite 'curly:', ->
        testCollection code.punctuation.brace.curly

    suite 'slash:', ->
      testCollection code.punctuation.slash
