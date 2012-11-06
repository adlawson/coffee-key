#Key

Key is a tiny little keycode library for your browser. It makes keybound event assertions super simple.

[![Build Status](https://secure.travis-ci.org/adlawson/key.png)](http://travis-ci.org/adlawson/key)


## Installation

**Browser**

To use Key without a package manager in-browser, copy/link
to `client/key.js` or `client/key.min.js` and start using.

**NPM**

Just install with `npm install key` or add it to your `package.json`


## Usage

Key is bound to the `window` object, so usage in the browser is simple

```js
var key = window.key
```

Key will also work fine with a dependency manager like [Browserify][browserify] (both Javascript and CoffeeScript).

```js
var key = require('key')
```


## Example

```js
pressed = 13; // An event keycode (eg jQuery.event.which)

key.get(pressed).name; // "Enter"
key.is(key.code.special.enter, pressed); // true
key.is(key.code.alnum.a, pressed); // false
```


## License
The content of this library is released under the **MIT License** by **Andrew Lawson**.<br>
You can find a copy of this license at http://www.opensource.org/licenses/mit


<!-- Meta -->
[browserify]: http://github.com/substack/node-browserify
