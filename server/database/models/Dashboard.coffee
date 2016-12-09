DataType = require 'sequelize'
Model = require '../sequelize'

gql = "
  type Dashboard {
    id: String!
    title: String!
    owner: User
}
"

Dashboard = Model.define('Dashboard', {
  id:
    type: DataType.UUID,
    defaultValue: DataType.UUIDV1,
    primaryKey: yes
  title:
    type: DataType.STRING
    allowNull: no
    unique: no
  timestamp: yes
})

module.exports = Dashboard