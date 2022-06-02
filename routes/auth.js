const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const passport = require("passport");
const User = require("../models/User");
const { forwardAuthenticated } = require("../config/auth");

// Login Page
router.get("/login", forwardAuthenticated, (req, res) => res.send("login page"));

// Register Page
router.get("/register",(req, res) =>
  res.send("register page")
);

// Register
router.post("/register", (req, res) => {
  const { username, email, password, role } = req.body
    User.findOne({
      where: {
        email: email
      }
    }).then((user) => {
      if (user) {
        res.send("email already exist");
      } else {
        const newUser = new User({
          username,
          email,
          password,
          role,
        });
        bcrypt.genSalt(10, (err, salt) => {
          bcrypt.hash(newUser.password, salt, (err, hash) => {
            if (err) throw err;
            newUser.password = hash;
            newUser
              .save()
              .then((user) => {
                res.json(user);
              })
              .catch((err) => console.log(err));
          });
        });
      }
    });
});

// Login
router.post("/login", (req, res, next) => {
  passport.authenticate("local", {
    successRedirect: "/dashboard",
    failureRedirect: "/auth/login",
    failureFlash: true,
  })(req, res, next);
});

// Logout
router.get("/logout", (req, res) => {
  req.logout();
  res.redirect("/auth/login");
});

module.exports = router;
