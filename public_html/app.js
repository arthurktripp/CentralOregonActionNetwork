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
var hbs = exphbs.create({});
hbs.handlebars.registerHelper('split', function (str, separator) {
  return str.split(separator);
});

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
  const serviceQuery = `
    SELECT
      Services.serviceID,
      Services.name AS serviceName,
      Services.description AS serviceDescription,
      Services.donateURL AS donateURL,
      Services.websiteURL AS websiteURL,
      Services.getServicesURL AS getServicesURL,
      ServicesCities.cityID,
      GROUP_CONCAT(DISTINCT Cities.cityName ORDER BY Cities.cityName ASC) AS serviceCities,
      ServicesCategories.categoryID,
      GROUP_CONCAT(DISTINCT Categories.categoryName ORDER BY Categories.categoryName ASC) AS serviceCategories 
    FROM Services
    LEFT JOIN ServicesCities ON ServicesCities.serviceID = Services.serviceID
    LEFT JOIN Cities ON Cities.cityID = ServicesCities.cityID
    LEFT JOIN ServicesCategories ON ServicesCategories.serviceID = Services.serviceID
    LEFT JOIN Categories ON Categories.categoryID = ServicesCategories.categoryID 
    GROUP BY Services.serviceID;`;


  db.pool.query(serviceQuery, function(err, rows, fields){
    if (err) {console.log(err); res.sendStatus(400)
    } else {
      let servicesData = rows;
      res.render('index', {
        title: 'COAN | Central Oregon Action Network',
        service: servicesData
        
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
