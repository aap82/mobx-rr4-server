object = require('lodash/fp/object')
{User} = require '../../database/models'
{attributeFields, defaultArgs, resolver, defaultListArgs} = require 'graphql-sequelize'
{GraphQLList, GraphQLObjectType, GraphQLString, GraphQLInt} = require 'graphql'
{dashboard} = require('./dashboard')
#---------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------
user =
  name: 'User'
  fields: attributeFields User, {
    only: ['id', 'username']
    allowNull: yes
  }


user.fields.dashboards =
  type: new GraphQLList(dashboard.type)
  args: defaultListArgs()
  resolve: resolver(User.Dashboard)

userType = new GraphQLObjectType(user)
#---------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------

userQuery =
  type: userType
  args: object.assign defaultArgs(User), {
    username:
      type: GraphQLString
  }
  resolve: resolver(User)

usersQuery =
  type: new GraphQLList(userType)
  args: defaultListArgs(User)
  resolve: resolver(User)
#---------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------------------


module.exports =
  query:
    user: userQuery
    users: usersQuery
  type:
    user: userType




