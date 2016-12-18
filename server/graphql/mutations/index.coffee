{GraphQLObjectType} = require 'graphql'
user = require('./user')


mutation = {
  name: 'RootMutationType'
  fields: user

}


mutations = new GraphQLObjectType(mutation)

module.exports = mutations