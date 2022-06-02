const { DataTypes } = require("sequelize");
const db = require("../config/db-connection");

const Teams = db.define("Teams", {
  title: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  owner_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
});

module.exports = Teams
