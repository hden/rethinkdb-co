rethinkdb-co
============

Harness RethinkDB Callbacks with ECMAScript 6 Generators

## Installation

    $ npm install rethinkdb-co

## Example

    r   = require 'rethinkdb'
    co  = require 'co'

    rco = require 'rethinkdb-co'

    query = r.tableList()

    do co ->*
      # get connection
      connection = yield rco.connect()
      # get result
      result     = yield rco.run query
      console.log 'result', result
      # end connection
      yield rco.disconnect()

## License

MIT
