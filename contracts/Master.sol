pragma solidity ^0.8.7;

contract Migrations {
    address owner = msg.sender;

    address[] public stableCoins;
    uint public stableCoinsIndex = 0;

    constructor() public {
        owner = msg.sender;
    }
    function addStableCoin (address _stableCoinAddress) public {
        require((_stableCoinAddress != address(0)), "Stable coin address cannot be zero");
        stableCoins[stableCoinsIndex] = _stableCoinAddress;
    }

}