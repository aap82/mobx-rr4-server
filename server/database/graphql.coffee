_ = require 'lodash'
{GraphQLSchema, GraphQLObjectType, GraphQLString, GraphQLList, GraphQLNonNull} = require 'graphql'
{attributeFields, resolver, defaultListArgs} = require 'graphql-sequelize'
models = require './models'

userType = new GraphQLObjectType({
  name: 'User'
  fields: _.assign(attributeFields(models.User), {})
})

exports.getSchema = ->
  schema = new GraphQLSchema(
    query: new GraphQLObjectType(
      name: 'RootQueryType'
      fields:
        user:
          type: userType
          args:
            username:
              description: 'name of the user'
              type: new GraphQLNonNull(GraphQLString)
          resolve: resolver(models.User)
    )
  )
  schema


