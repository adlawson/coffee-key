'use strict'


# Key
#
# @copyright Andrew Lawson 2012
# @see http://github.com/adlawson/key
# @see http://npmjs.org/package/key
# @see http://opensource.org/licenses/mit-license.php MIT License


# Dependencies
{ref} = require '../ref'


# Definitions
keypad = {

  '0': ref '0',  96
  '1': ref '1',  97
  '2': ref '2',  98
  '3': ref '3',  99
  '4': ref '4', 100
  '5': ref '5', 101
  '6': ref '6', 102
  '7': ref '7', 103
  '8': ref '8', 104
  '9': ref '9', 105

  multiply: ref 'Multiply',      106
  plus:     ref 'Plus',          107
  minus:    ref 'Minus',         109
  decimal:  ref 'Decimal point', 110
  divide:   ref 'Divide',        111

}


# Exports
module.exports = keypad
