const { DataTypes } = require("sequelize");
const db = require("../config/db-connection");

const TeamMembers = db.define("TeamMembers", {
  team_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  user_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
});

module.exports = TeamMembers
