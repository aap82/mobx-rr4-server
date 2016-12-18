DataType = require 'sequelize'
Model = require '../sequelize'
{attributeFields} = require 'graphql-sequelize'


User = Model.define('User', {
  username:
    type: DataType.STRING
    allowNull: false,
    unique: true
  password:
    type: DataType.STRING
    allowNull: false
    unique: no
})




module.exports = User