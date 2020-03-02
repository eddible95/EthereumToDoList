pragma solidity ^0.5.1;

// Creating an Ethereum Savings Account
contract TimeLock {
    // Who can withdraw
    // How much
    // When
    address payable beneficiary;
    uint256 releaseTime;

    constructor(address payable _beneficiary, uint256 _releaseTime) public payable {
        require(_releaseTime > block.timestamp);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    function release() public {
        // Take the full balance of this account and transfer to the beneficiary
        require(block.timestamp >= releaseTime);
        address(beneficiary).transfer(address(this).balance);
    }
}
