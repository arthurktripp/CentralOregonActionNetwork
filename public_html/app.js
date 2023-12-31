// app.js

/* ************************
 -------- SETUP -------- //
**************************/ 

// EXPRESS
var express = require('express');
var app = express();
PORT = 1687

// HANDLEBARS
const { engine } = require('express-handlebars');
var exphbs = require('express-handlebars');
app.engine('.hbs', engine({
  extname: '.hbs',
}));
app.set('view engine', '.hbs');
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(express.static('public'));

// DATABASE
var db = require('./database/db-connector');


/* *************************
 -------- ROUTES -------- //
***************************/ 

// ----- HOME ----- //
app.get('/');




/*
  LISTENER
*/
app.listen(PORT, function(){  
  console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});
