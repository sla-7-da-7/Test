const path = require('path');
const fs = require('fs');
const solc = require('solc'); 

const sourcePath = path.resolve(__dirname,'contracts','multiauth.sol');

const source = fs.readFileSync(sourcePath,'utf8');

//console.log(solc.compile(source,1));

module.exports = solc.compile(source,1).contracts[':MultiAuth'];