const { DataTypes } = require("sequelize");
const db = require("../config/db-connection");

const Todos = db.define("Todo", {
  todo: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  owner_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  isDone: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
  },
  isPrivate: {
    type: DataTypes.BOOLEAN,
    allowNull: false,
  },
});

module.exports = Todos
