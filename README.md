brofist-phantomjs
=================

A PhantomJS runner for Brofist tests.


## Example

Write your tests in Brofist's style (exporting your specs):

```js
var spec = require('brofist')()

module.exports = spec('Your thing', function(it) {
  it('Should pass', function() {
    
  })
})
```

Then run it through the phantom wrapper:

```bash
$ brofist-phantomjs your-spec.js
```


## Installing

Grab it from NPM:

    $ npm install brofist-phantomjs -g


## Licence

MIT/X11. ie.: do whatever you want.
