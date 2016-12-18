sequelize = require '../sequelize'
User = require './User'
{Dashboard, GridProp, GridLayout} = require './Dashboard'

exports = module.exports


User.Dashboard = User.hasMany(Dashboard)



Dashboard.GridLayout = Dashboard.hasOne(GridLayout, {as: "layout"})
Dashboard.GridProp = Dashboard.hasOne(GridProp, {as: "props"})

GridLayout.Dashboard = GridLayout.belongsTo(Dashboard)
GridProp.Dashboard = GridProp.belongsTo(Dashboard)




exports.connect = => return sequelize.sync()


exports.Dashboard = Dashboard
exports.User = User
exports.GridProp = GridProp
exports.GridLayout = GridLayout

