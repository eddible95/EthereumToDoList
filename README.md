# Ethereum Application
This is an example of a To Do List decentralised-application (Dapp) powered by Ethereum Network.

## Installation
To create the environment the Dapp running on, run the following commands:
```
cd Ethereum_Application/eth-todo-list/
```
```
npm install
```
## Compiling of the Smart Contract
To compile the Smart Contract, within the eth-todo-list directory, run the following command:
```
truffle compile
```

## Deployment of the Smart Contract 
To deploy the Smart Contract onto the the Ethereum Network for the first time, run the following command:
```
truffle migrate
```
Subsequent deployment if needed, run the following command:
```
truffle migrate --reset
```
## Running the Web Application
To run the server hosting our client-side web application, run the following command:
```
npm run dev
```
