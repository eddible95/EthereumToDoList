pragma solidity >=0.5.1 <0.6.0;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    function mint() public {
        // Gets the address of the person that initate the original transaction
        balances[tx.origin] ++;
    }
}

contract MyContract {
    mapping(address => uint256) public balances;
    address payable wallet;
    address public token;

    // // Create an event
    // event Purchase(
    //     // Only for a specific address you listen for event
    //     address indexed _buyer,
    //     uint256 _amount

    // );

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token =_token;
    }

    function() external payable {
        buyToken();
    }

    // Function that accepts ether reqires the payable modifier
    function buyToken() public payable {
        // Create an instance of the token
        ERC20Token(address(token)).mint();
        // Send to the wallet
        wallet.transfer(msg.value);
        //emit Purchase(msg.sender, 1);
    }
}
