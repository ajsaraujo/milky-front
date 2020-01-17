const app = require('../src/app');
const http = require('http'); 
const debug = require('debug')('nodestr:server');

function normalizePort(value) {
    const port = parseInt(value, 10); 

    if (isNaN(port))
	return value; 

    if (port >= 0)
	return port; 

    return false;
}

const port = normalizePort(process.env.PORT || 3000);
app.set('port', port); 

// error handler
function onError(error) {
    if (error.syscall !== 'listen')
	throw error;

    const bind = typeof port === 'string' ? 'Pipe ' + port : 'Port' + port;

    switch (error.code) {
	case 'EACCES':
	    console.error(bind + 'requires elevated privileges'); 
	    process.exit(1); 

	case 'EADDRINUSE':
	    console.error(bind + 'is already in use'); 
	    process.exit(1); 

	default: 
	    throw error; 
    }
}

function onListening() {
	const addr = server.address(); 
	const bind = typeof addr === 'string' ? 'pipe ' + addr : 'port' + addr.port; 
	debug('Listening on' + bind); 
}
/*
* Hoje aprendi uma coisa nova!
* A diferença de criar o servidor assim pra criar
* usando só o listen do express é que assim tem https.
*/
const server = http.createServer(app);
server.listen(port); 
server.on('error', onError);
server.on('listening', onListening);
console.log(`API is alive on ${port}!`); 
