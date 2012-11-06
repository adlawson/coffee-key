'use strict'

# Dependencies
{assert} = require 'chai'
{mockRef} = require '../mock/ref'


suite 'key:', ->
  key = require '../../src/key'

  setup ->
    key.code =
      foo: {
        a: mockRef 'a', 1
        b: mockRef 'b', 2
        bar: {
          c: mockRef 'c', 3
        }
      }
      baz: {
        d: mockRef 'd', 4
      }


  suite 'exports:', ->
    test 'key is an object', ->
      assert.isObject key

    test 'key.code is an object', ->
      assert.isObject key.code

    test 'key.get is a function', ->
      assert.isFunction key.get

    test 'key.is is a function', ->
      assert.isFunction key.is


  suite 'get:', ->
    test '1 is foo.a', ->
      assert.strictEqual key.code.foo.a, (key.get 1)

    test '2 is foo.b', ->
      assert.strictEqual key.code.foo.b, (key.get 2)

    test '3 is foo.bar.c', ->
      assert.strictEqual key.code.foo.bar.c, (key.get 3)

    test '4 is baz.d', ->
      assert.strictEqual key.code.baz.d, (key.get 4)


  suite 'is:', ->
    test '1 is foo.a', ->
      assert.isTrue (key.is key.code.foo.a, 1)

    test '2 is foo.b', ->
      assert.isTrue (key.is key.code.foo.b, 2)

    test '3 is foo.bar.c', ->
      assert.isTrue (key.is key.code.foo.bar.c, 3)

    test '4 is baz.d', ->
      assert.isTrue (key.is key.code.baz.d, 4)
