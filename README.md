rethinkdb-co
============

Harness RethinkDB Callbacks with ECMAScript 6 Generators

## Installation

    $ npm install rethinkdb-co

## Example

    var co, query, r, rco;

    rco = require('rethinkdb-co');
    r   = require('rethinkdb');
    co  = require('co');

    query = r.tableList();

    co(function *() {
      var connection, result;
      // pause and wait for connection
      connection = yield rco.connect();
      // pause and wait for result
      result = yield rco.run(query);
      console.log('result', result);
      // disconnect
      yield rco.disconnect();
    })();

## License

MIT
