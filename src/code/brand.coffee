'use strict'


# Key
#
# @copyright Andrew Lawson 2012
# @see http://github.com/adlawson/key
# @see http://npmjs.org/package/key
# @see http://opensource.org/licenses/mit-license.php MIT License


# Dependencies
{ref} = require '../ref'


# Exports
module.exports = {

  apple: ref 'Apple &#8984;', 224

  windows:
    left:  ref 'Windows start', 91
    right: ref 'Windows start', 92
    menu:  ref 'Windows menu',  93
}
