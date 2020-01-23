const express = require('express');
const bodyParser = require('body-parser');
const db = require('./queries');
const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(
    bodyParser.urlencoded({extended: true})
);

app.get('/', (req, res) => {
    res.json({info: 'Node.js, Express and Postgres API'})
    //res.send('Hello Wolrd!');
});

app.get('/users', db.getUsers);

app.get('/users/:id', db.getUserById);

app.post('/users', db.createUser);

app.put('/users/:id', db.updateUser);

app.delete('/users/:id', db.deleteUser);

app.post('/auth', db.authUser);

app.listen(port, '0.0.0.0', () => {
    console.log(`Server running on port ${port}.`);
    //console.log(app.address());
});

//const server = http.createServer(app);
//server.listen(port, '0.0.0.0');

//console.log(server.address());
