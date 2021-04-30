In order to deploy the smart contract follow the next steps

Setup:
1. npm install
2. node scripts/setup.js {{mnemonic}} {{etherscan_api_key}} {{jsonRPC_link}}

Deploy contract:
1. truffle migrate --network rinkeby  (use --reset for subsequent deployments)
2. truffle run verify KeykoNFT --network rinkeby

