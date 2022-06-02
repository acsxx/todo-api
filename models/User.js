const { DataTypes } = require("sequelize");
const db = require("../config/db-connection");

const User = db.define("User", {
  username: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  password: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  role: {
    type: DataTypes.TEXT,
    allowNull: true,
  }
});

module.exports = User
