const { Sequelize } = require("sequelize");

const db = new Sequelize("ToDo", "DBUSER", "DBPASSWORD", {
  host: "localhost",
  dialect: "postgres",
});

module.exports = db
