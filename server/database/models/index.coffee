sequelize = require '../sequelize'
User = require './User'
Dashboard = require './Dashboard'

exports = module.exports


User.hasMany(Dashboard)
Dashboard.belongsTo(User)


exports.connect = => return sequelize.sync()

exports.Dashboard = Dashboard
exports.User = User

