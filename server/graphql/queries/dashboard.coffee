object = require('lodash/fp/object')
{Dashboard, GridProp, GridLayout} = require '../../database/models'
{attributeFields, defaultArgs, resolver, defaultListArgs} = require 'graphql-sequelize'
{GraphQLObjectType, GraphQLList} = require 'graphql'

gridLayout =
  name: 'GridLayout'
  fields: attributeFields GridLayout, {
    allowNull: yes
  }

gridLayoutType = new GraphQLObjectType(gridLayout)


gridProps =
  name: 'GridProp'
  fields: attributeFields GridProp, {
    allowNull: yes
  }

gridPropsType = new GraphQLObjectType(gridProps)

dashboard =
  name: 'Dashboard'
  fields: attributeFields Dashboard, {
    allowNull: yes
  }



dashboard.fields.props =
  type: gridPropsType
  resolve: resolver(Dashboard.GridProp)

dashboard.fields.layout =
  type: gridLayoutType
  resolve: resolver(Dashboard.GridLayout)






#dashboard.fields.props.resolve = resolver(Dashboard.GridProp)
#dashboard.fields.layout.resolve = resolver(Dashboard.GridLayout)



dashboardType =  new GraphQLObjectType(dashboard)





dashboardsQuery =
  type: new GraphQLList(dashboardType)
  args: defaultListArgs(Dashboard)
  resolve: resolver(Dashboard)

module.exports =
  dashboard:
    type: dashboardType
  dashboards:
    query: dashboardsQuery

