'use strict'

# Dependencies
{assert} = require 'chai'
{spy} = require 'sinon'
{mockRef} = require '../mock/ref'


suite 'key:', ->
  key = require '../../src/key'

  setup ->
    key.code =
      foo: {
        a: mockRef 'a', [1,2,3]
        b: mockRef 'b', [4,5,6]
        bar: {
          c: mockRef 'c', [7,8,9]
        }
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

    test '2 is foo.a', ->
      assert.strictEqual key.code.foo.a, (key.get 2)

    test '3 is foo.a', ->
      assert.strictEqual key.code.foo.a, (key.get 3)

    test '4 is foo.b', ->
      assert.strictEqual key.code.foo.b, (key.get 4)

    test '5 is foo.b', ->
      assert.strictEqual key.code.foo.b, (key.get 5)

    test '6 is foo.b', ->
      assert.strictEqual key.code.foo.b, (key.get 6)

    test '7 is foo.bar.c', ->
      assert.strictEqual key.code.foo.bar.c, (key.get 7)

    test '8 is foo.bar.c', ->
      assert.strictEqual key.code.foo.bar.c, (key.get 8)

    test '9 is foo.bar.c', ->
      assert.strictEqual key.code.foo.bar.c, (key.get 9)


  suite 'is:', ->
    test '1 is foo.a', ->
      assert.isTrue (key.is key.code.foo.a, 1)

    test '2 is foo.a', ->
      assert.isTrue (key.is key.code.foo.a, 2)

    test '3 is foo.a', ->
      assert.isTrue (key.is key.code.foo.a, 3)

    test '4 is foo.b', ->
      assert.isTrue (key.is key.code.foo.b, 4)

    test '5 is foo.b', ->
      assert.isTrue (key.is key.code.foo.b, 5)

    test '6 is foo.b', ->
      assert.isTrue (key.is key.code.foo.b, 6)

    test '7 is foo.bar.c', ->
      assert.isTrue (key.is key.code.foo.bar.c, 7)

    test '8 is foo.bar.c', ->
      assert.isTrue (key.is key.code.foo.bar.c, 8)

    test '9 is foo.bar.c', ->
      assert.isTrue (key.is key.code.foo.bar.c, 9)
