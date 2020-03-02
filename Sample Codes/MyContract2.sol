pragma solidity >=0.5.1 <0.6.0;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public {
        // Gets the address of the person that initate the original transaction
        balances[tx.origin] ++;
    }
}

// Inheritence
contract MyToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;

    // Override inherent functions
    constructor(string memory _name, string memory _symbol) ERC20Token(_name) public {
        symbol = _symbol;
    }

    function mint() public {
        super.mint();
        owners.push(msg.sender);
    }
}
