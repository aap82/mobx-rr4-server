DataType = require 'sequelize'
Model = require '../sequelize'
exports = module.exports

GridLayout = Model.define('GridLayout', {
  id:
    type: DataType.INTEGER,
    primaryKey: yes
  x:
    type: DataType.INTEGER
  y:
    type: DataType.INTEGER
  w:
    type: DataType.INTEGER
  h:
    type: DataType.INTEGER
})

GridProp = Model.define('GridProp', {
  id:
    type: DataType.INTEGER
    autoIncrement: yes
    primaryKey: yes
  cols:
    type: DataType.INTEGER
  rowHeight:
    type: DataType.INTEGER
  marginX:
    type: DataType.INTEGER
  marginY:
    type: DataType.INTEGER
})


Dashboard = Model.define('Dashboard', {
  id:
    type: DataType.INTEGER
    autoIncrement: yes
    primaryKey: yes
  title:
    type: DataType.STRING
    allowNull: no
    unique: no
  deviceType: DataType.STRING
    allowNull: no
    unique: no
})


#GridProps.Dashboard = GridProps.belongsTo(Dashboard)
#GridProp.Dashboard = GridProp.belongsTo(Dashboard)


module.exports =
  GridProp: GridProp
  GridLayout: GridLayout
  Dashboard: Dashboard