rethinkdb-co
============

Harness RethinkDB Callbacks with ECMAScript 6 Generators

## Installation

    $ npm install rethinkdb-co

## Example
```javascript
var rco = require('rethinkdb-co');
var r   = require('rethinkdb');
var co  = require('co');

var query = r.tableList();

co(function *() {
  // pause and wait for connection
  var connection = yield rco.connect();
  // pause and wait for result
  var result = yield rco.run(query);
  console.log('result', result);
  // disconnect
  yield rco.disconnect();
})();
```

## With koa-rethinkdb

```javascript
var rethinkdbPool = require('koa-rethinkdb');
var rco           = require('rethinkdb-co');
var r             = require('rethinkdb');

app.use(rethinkdbPool(options));

app.use(function *(next) {

    // get the list of table
    var query1 = r.db('test').tableList();

    var list = yield rco.run(query1);

    // select a few documents
    var query2 = r.db('test').table('foobar').limit(10);

    result = yield rco.runf(query2);

    yield next;
    // connections are released back to the pool.
});
````

## methond: run

Return the result you would expect from rethinkdb client.

## methond: runf

If the query returns a cursor, run `cursor.toArray()` for you, since that's probably what you want.

## License

MIT
