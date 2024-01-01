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
app.get('/', function(req, res){
  let query1 = `SELECT * FROM Services;`;

  db.pool.query(query1, function(err, rows, fields){
    if (err) {console.log(err); res.sendStatus(400)
    } else {
      let data = rows;
      res.render('index', {
        title: 'COAN | Central Oregon Action Network',
        data: data
      });
    };
  });
});




/*
  LISTENER
*/
app.listen(PORT, function(){  
  console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});
