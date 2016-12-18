models = require '../database/models'
queries = require './queries'
mutations = require './mutations'
{GraphQLSchema} = require 'graphql'


exports.getSchema = ->
  schema = new GraphQLSchema(
    query: queries
    mutation: mutations
  )
  schema