{User, Dashboard, GridProp} = require '../../database/models'
{GraphQLInputObjectType, GraphQLString, GraphQLObjectType, GraphQLInt} = require 'graphql'
{getGridProps, signToken} = require '../../utils/helpers'

newUserType = new GraphQLObjectType({
  name: 'NewUser'
  fields:
    id: { type: GraphQLInt}
    username: { type: GraphQLString }
    token: { type: GraphQLString }
    deviceType: { type: GraphQLString }
})

newUserInputType = new GraphQLInputObjectType({
  name: 'NewUserInput'
  fields:
    username: { type: GraphQLString }
    password: { type: GraphQLString }
})

createUser =
  type: newUserType
  args:
    user: {type: newUserInputType}
  resolve: (root, {user}, {device}) ->
    token = signToken(user)
    User.create({
      username: user.username
      password: user.password
      Dashboards: [
        title: "My #{device.type.toUpperCase()} Dashboard"
        deviceType: device.type
        GridProp: getGridProps(device.type)
      ]
    }, {
      include: [
        association: User.Dashboard,
        include: [
          Dashboard.GridProp
        ]
      ]
    })
    .then (result) ->
      result.token = token
      result.deviceType = device.type
      return result
    .catch (err) ->
      console.log (err)



module.exports =
  addUser: createUser
