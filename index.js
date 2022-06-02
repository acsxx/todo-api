const express = require('express');
var bodyParser = require('body-parser')
const passport = require('passport');
const flash = require('connect-flash');
const session = require('express-session');
const auth =  require('./routes/auth.js')
const app = express();

app.use(express.json())
app.use(bodyParser.urlencoded({ extended: false }))

// Passport Config
require('./config/passport')(passport);

// DB Config
const db = require("./config/db-connection")

db.authenticate()
  .then(() => console.log("db connected"))
  .catch((err) => console.error(err));

// Express session
app.use(
  session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
  })
);

// Passport middleware
app.use(passport.initialize());
app.use(passport.session());

app.use(flash());

// Routes
app.use('/', require('./routes/index.js'));
app.use('/auth',auth);

const PORT = process.env.PORT || 5000;

app.listen(PORT, console.log(`Server running on  ${PORT}`));
