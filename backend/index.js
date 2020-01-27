const express = require('express');
const bodyParser = require('body-parser');
//const db = require('./queries');
//const router = require('./routes/createRouter.js')();
const userRouter = require('./routes/api/users');
const authRouter = require('./routes/api/auth');
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

app.use('/api/users', userRouter);
app.use('/api/auth', authRouter);

// Futura automação que vai juntar todos os routers em um
// ver em createRouter.js
//app.use('/api', router);

app.listen(port, '0.0.0.0', () => {
    console.log(`Server running on port ${port}.`);
});