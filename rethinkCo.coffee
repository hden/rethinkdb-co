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

exports.run = (query, connection = @rethinkdb or _connection) ->
  (done) ->
    query.run connection, done

exports.runf = (query, connection = @rethinkdb or _connection) ->
  (done) ->
    query.run connection, (error, res) ->
      return cb error if error?

      if res.toArray?
        # cursor
        res.toArray.call res, done
      else
        # pojo
        cb null, res
