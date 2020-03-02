pragma solidity ^0.5.0;

// Has an Escrow agent that officiates- the transaction on the blockchain
// Only person that can withdraw and deposit funds into the Smart Contract
contract Escrow {

    // Only person that has permission to use the smart contract`
    address agent;
    mapping(address => uint256) public deposits;

    modifier onlyAgent() {
        require(msg.sender == agent);
        _;
    }

    constructor() public {
        // Sender that deploys the Smart Contract
        agent = msg.sender;
    }

    // deposit funds into Escrow account
    function deposit(address payee) public onlyAgent payable {
        uint256 amount = msg.value;
        deposits[payee] = deposits[payee] + amount;
    }

    // withdraw funds from the Escrow account
    function withdraw(address payable payee) public onlyAgent {
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }
}
