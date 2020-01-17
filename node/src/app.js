const express = require('express'); 
const bodyParser = require('body-parser');

const app = express(); 


// Config parser de entrada e saída
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

// Rotas 
const indexRoutes = require('./routes/index-routes');
app.use('/', indexRoutes); 

module.exports = app; 
