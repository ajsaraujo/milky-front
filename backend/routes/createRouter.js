const glob = require('glob');
const Router = require('express').Router();


/*
*   Usando o módulo glob para pesquisar todos os arquivos
* que tenham a extensão .js em toda subpasta e retornar um array
* com o nome dos arquivos
*/
// glob.sync('**/*.js', { cwd: `${__dirname}`);

/*
*   Aplicando um map no array que executa o require() para cada
* arquivo .js e retorna um array com os objetos exportados
*/
// .map(filename =: require(`./${filename}`))

/*
*   Aplicando um filtro para manter apenas os objetos do tipo
* Router no array de objetos
*/
// .filter(router => Object.getPrototypeOf(router) == Router)
/*
*   Aplicando uma redução no array, juntando todos os Routers
* em um só (no rootRouter) e exportando apenas o rootRouter com os
* seus filhos
*/

/*
*   As rotas geradas por esse router equivalem ao caminho pra chegar
* nos routers filhos em seguida da rota interna deles
* Ex.: /api/users/id:, onde api é a pasta, users o arquivo e id uma rota
*                       interna
*/
module.exports = () => glob
    .sync('**/*.js', { cwd: `${__dirname}/` })
    .map(filename => require(`./${filename}`))
    .filter(router => Object.getPrototypeOf(router) == Router)
    .reduce((rootRouter, router) => rootRouter.use(router), Router({ mergeParams: true }));