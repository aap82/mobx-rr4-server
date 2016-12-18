models = require('../../database/models')
{user} = require('./user').query
{dashboard, dashboards} = require('./dashboard')
{attributeFields, defaultArgs, resolver, defaultListArgs} = require 'graphql-sequelize'
{GraphQLString, GraphQLObjectType, GraphQLInt, GraphQLList} = require 'graphql'
{getGridProps} = require '../../utils/helpers'

excludedAttr = exclude: ['createdAt', 'updatedAt']

createDashboard = (userId, deviceType) ->
  props = getGridProps(deviceType)
  models.Dashboard.create {
      title: "My #{deviceType.toUpperCase()} Dashboard"
      deviceType: deviceType
      props: getGridProps(deviceType)
      UserId: userId
    },
    { include: [ association: models.Dashboard.GridProp ] }
  .then (dashboard) ->
    console.log 'dashboard created'
    return dashboard
    dashboard.save()


userEntry =
  name: 'UserEntry'
  fields:
    ip: type: GraphQLString
    deviceName: type: GraphQLString
    deviceType: type: GraphQLString
    dashboards:
      type: new GraphQLList(dashboard.type)
      args:
        UserId: type: GraphQLInt
      resolve: (root, args, context, info) ->
        models.Dashboard.findAll({where: {UserId: args.UserId, deviceType: root.deviceType}}).then (result) ->
          return result
    dashboard:
      type: dashboard.type
      args:
        UserId: type: GraphQLInt
      resolve: (root, args, context, info) ->
        models.Dashboard.findAll({
          where: {UserId: args.UserId, deviceType: root.deviceType}
          include: [
            attributes: excludedAttr
            all: yes
            nested: yes
          ]
        }).then (result) ->
          if result[0]?
            return result[0]
          else
            return createDashboard(args.UserId, root.deviceType)





userEntryType = new GraphQLObjectType(userEntry)

userEntryQuery =
  type: userEntryType




module.exports =
  type: userEntryType
  query: userEntryQuery