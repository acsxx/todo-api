const { DataTypes } = require("sequelize");
const db = require("../config/db-connection");

const Roles = db.define("Roles", {
  role: {
    type: DataTypes.STRING,
    allowNull: false,
  }
});

module.exports = Roles
