'use strict'


# Dependencies
{ref} = require '../../src/ref'


# Create a mock reference
#
# @param [mixed] args
# @return [Reference]
mockRef = (args...) ->
  ref args...


# Exports
module.exports = {mockRef}
