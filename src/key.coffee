'use strict'


# Dependencies
{isRef, assertRef} = require './ref'


# Namespace
ns = {}


# Keycodes
ns.code =
  alnum: require './code/alnum'


# Get pressed key information
#
# @param [Number] pressed
# @return [Object]
ns.get = (pressed) =>
  iterator = (context) ->
    for own key, ref of context
      if isRef ref
        return ref if ns.is ref, pressed
      else return iterator ref
  iterator ns.code


# Compare a pressed key against a reference
#
# @param [Reference] ref
# @param [Number] pressed
# @return [Boolean]
ns.is = (ref, pressed) =>
  pressed in assertRef(ref).codes


# Exports
module.exports = ns
