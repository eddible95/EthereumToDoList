const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const compiledContract = require('../build/ToDoList.json');

// Unlock account using private key and give the web3 provieder to Ethereum node
const provider = new HDWalletProvider(
    'e5af84f3e46ff0a35d7317e2dd7f4a97b7c949596a23d6c5beb898432f4e730c',
    'http://127.0.0.1:8543'
);
const web3 = new Web3(provider);
const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    console.log('Attempting to deploy from account', accounts[0]);
    const result = await new web3.eth.Contract(compiledContract.abi)
        .deploy({data: '0x' + compiledContract.evm.bytecode.object})
        .send({
            from: accounts[0],
            gas: '6500000',
            gasPrice: web3.utils.toWei('15', 'gwei')
        });
    console.log('Contract deployed to ', result.options.address);
    provider.engine.stop()
};
// run deploy function
deploy();
