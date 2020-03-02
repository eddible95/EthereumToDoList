pragma solidity ^0.5.1;

import "./Token.sol";

contract TokenTimeLock {
    Token public token;
    address public beneficiary;
    uint256 public releaseTime;

    constructor(Token _token, address _beneficiary, uint256 _relaseTime) public {
        require(_relaseTime > block.timestamp);
        token = _token;
        beneficiary = _beneficiary;
        releaseTime = _relaseTime;
    }

    function release() public {
        require(block.timestamp >= releaseTime);

        uint256 amount = token.balanceOf(address(this));
        require(amount > 0);

        token.transfer(beneficiary, amount);
    }
}
