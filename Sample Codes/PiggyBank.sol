
pragma solidity >=0.4.22 <0.6.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.

contract PiggyBank {
    address creator;
    uint deposits;

    // Declaring this function as public makes it accessible to other users and smart contracts
    constructor() public {
        creator = msg.sender;
        deposits = 0;
    }

    // Check whether any ether has been deposited. When it is deposited, the number of deposits go up and the total count is returned
    function desposit() public payable returns (uint) {
        if(msg.value > 0) {
            deposits = deposits + 1;
        }
        return getNumberOfDeposits();
    }
    // Comments
    function getNumberOfDeposits() public view returns (uint) {
        return deposits;
    }

    // When the external account that instantiate this contract calls it again, it terminates and sends back its balance
    function kill() private {
        if(msg.sender == creator) {
            selfdestruct(msg.sender);
        }
    }
}
