'use strict'

r  = require 'rethinkdb'

_connection = undefined

exports.connect = (options = {}) ->
  (done) ->
    r.connect options, (error, connection) ->
      _connection = connection
      done error, connection

exports.disconnect = ->
  (done) ->
    fn null unless _connection? and connection.open
    _connection.close done

exports.run = (query, connection = _connection) ->
  (done) ->
    query.run connection, done
