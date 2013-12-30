'use strict'

r   = require 'rethinkdb'
co  = require 'co'

rco = require "#{__dirname}/../rethinkCo"

query = r.tableList()

do co ->*
  # get connection
  connection = yield rco.connect()
  # get result
  result     = yield rco.run query
  console.log 'result', result
  # end connection
  yield rco.disconnect()
