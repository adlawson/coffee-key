'use strict'


# Key reference
class Reference


  # Setup the reference
  #
  # @param [String] name
  # @param [Number] code
  constructor: (@name, @code) ->


# Create a new reference
#
# @param [String] name
# @param [Number] code
# @return [Reference]
ref = (name, code) ->
  new Reference name, code


# Is the value a valid reference
#
# @param [mixed] ref
# @return [Boolean]
isRef = (ref) ->
  ref instanceof Reference


# Assert valid reference
#
# @param [mixed] ref
# @param [Reference]
assertRef = (ref) ->
  throw new Error 'Invalid reference' unless isRef ref
  ref


# Exports
module.exports = {
  ref
  isRef
  assertRef
}
