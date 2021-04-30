const fs = require('fs');

const mnemonic = process.argv[2];
const etherscan_key = process.argv[3];
const jsonRPC = process.argv[4];

const replaceInFile = function(file, toBeReplaced, replaceWith) {
    let data = fs.readFileSync(file, 'utf8');
    const result = data.replace(new RegExp(toBeReplaced, 'g'), replaceWith);
    fs.writeFileSync(file, result, 'utf8', function(ex) {
        if (err) {
            return console.log(ex);
        }
    });
};


fs.copyFileSync('./truffle-config.js.template', './truffle-config.json');

replaceInFile('./truffle-config.js','{{mnemonic}}',mnemonic);
replaceInFile('./truffle-config.js','{{etherscan_key}}',etherscan_key);
replaceInFile('./truffle-config.js','{{jsonRPC}}',jsonRPC);