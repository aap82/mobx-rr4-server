{GraphQLObjectType} = require 'graphql'
{user, users} = require('./user').query
entry = require('./entry').query
dashboard = require('./dashboard')

query =
  name: 'RootQueryType'
  fields:
    entry: entry
    user: user
    users: users


queryType = new GraphQLObjectType(query)

module.exports = queryType


