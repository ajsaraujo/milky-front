const express = require('express'); 

const app = express(); 

// Rotas 
const indexRoutes = require('./routes/index-routes');
app.use('/', indexRoutes); 

module.exports = app; 
