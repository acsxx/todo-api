const express = require("express");
const router = express.Router();
const { ensureAuthenticated, forwardAuthenticated } = require("../config/auth");
const Todos = require("../models/Todos");
const Teams = require("../models/Team");
const TeamMembers = require("../models/TeamMembers");
const User = require("../models/User");
//const User = require("../models/Team");

const listUserTodos = (req, res, next) => {
  Todos.findAll({
    where: { owner_id: req.user.id },
  })
    .then((todo) => {
      res.send(todo);
      next();
    })
    .catch((err) => {
      res.send(err);
      next();
    });
};

const createTodo = (req, res, next) => {
  const { todo, isDone, isPrivate } = req.body;

  Todos.create({
    todo,
    owner_id: req.user.id,
    isDone,
    isPrivate,
  })
    .then((todo) => {
      res.redirect("/dashboard");
      next();
    })
    .catch((err) => {
      res.send(err);
      next();
    });
};

const listActiveTodos = (req, res, next) => {
  Todos.findAll({
    where: {
      owner_id: req.user.id,
      isDone: false,
    },
  })
    .then((todo) => {
      res.send(todo);
      next();
    })
    .catch((err) => {
      res.send(err);
      next();
    });
};

const listComplatedTodos = (req, res, next) => {
  Todos.findAll({
    where: {
      owner_id: req.user.id,
      isDone: true,
    },
  })
    .then((todo) => {
      res.send(todo);
      next();
    })
    .catch((err) => {
      res.send(err);
      next();
    });
};

const deleteTodo = () => {};

const createTeam = (req, res, next) => {
  Teams.findOne({
    where: { title: req.body.title },
  }).then((t) => {
    if (t) {
      res.send("team already exist");
      next();
    } else {
      Teams.create({
        title: req.body.title,
        owner_id: req.user.id,
      })
        .then((team) => {
          TeamMembers.create({
            team_name: team.title,
            user_name: req.user.username,
          })
            .then((members) => {
              res.send(members);
              next();
            })
            .catch((err) => {
              res.send(err);
              next();
            });
        })
        .catch((err) => {
          res.send(err);
          next();
        });
    }
  });
};

const myTeams = (req, res, next) => {
  TeamMembers.findAll({
    where: {
      user_name: req.user.username,
    },
  })
    .then((teams) => {
      res.send(teams);
      next();
    })
    .catch((err) => {
      res.send(err);
      next();
    });
};

const listAllTeamMembers = (req, res, next) => {
  TeamMembers.findOne({
    where: {
      user_name: req.user.username,
    },
  })
    .then((row) => {
      TeamMembers.findAll({
        where: {
          //team_name: row.map((e) => e.team_name),
          team_name: row.team_name
        },
      }).then((teamlist) => {
        res.send(teamlist);
        next();
      });
    })
    .catch((err) => {
      res.send(err);
      next();
    });
};


const addUserToTeam = (req, res, next) => {

  Teams.findOne({
    where: {
      title: req.body.team,
    },
  }).then((team) => {
    //1. check: is team exists?
    if (team) {

      //2. check: is user has a owner? (you have to be an owner to add member to the teams)
      if (team.owner_id == req.user.id) {

        User.findOne({
          where: {
            username: req.body.username,
          },
        }).then((user) => {

          //3. check: is user exists?
          if (user) {

            TeamMembers.findOne({
              where: {
                user_name: req.body.username,
                team_name: req.body.team,
              },
            }).then((member) => {

              //4. check: is user alredy exist in team?
              if (member) {

                res.send("user already exist in this team");
                next();
              } else {

                //then add user.
                TeamMembers.create({
                  team_name: req.body.team,
                  user_name: req.body.username,
                })
                  .then((members) => {
                    res.send(members);
                    next();
                  })
                  .catch((err) => {
                    res.send(err);
                    next();
                  });
              }
            });
          } else {
            res.send("user not found");
            next();
          }
        });
      } else {
        res.send("you must be an owner to add member to the team");
        next();
      }
    } else {
      res.send("team not found");
      next();
    }
  });
};

// Welcome Page
router.get("/", forwardAuthenticated, (req, res) => res.send("welcome"));

// Function requests
router.get("/dashboard", ensureAuthenticated, listUserTodos);
router.post("/create-todo", ensureAuthenticated, createTodo);
router.get("/active-todos", ensureAuthenticated, listActiveTodos);
router.get("/complated-todos", ensureAuthenticated, listComplatedTodos);
router.post("/create-team", ensureAuthenticated, createTeam);
router.get("/list-team", ensureAuthenticated, myTeams);
router.post("/add-user", ensureAuthenticated, addUserToTeam);
router.get("/list-members", ensureAuthenticated, listAllTeamMembers);

module.exports = router;
