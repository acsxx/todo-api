const { Sequelize } = require("sequelize");

const db = new Sequelize("ToDo", "postgres", "171213022", {
  host: "localhost",
  dialect: "postgres",
});

module.exports = db
