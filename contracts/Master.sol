pragma solidity ^0.8.7;

contract Migrations {
    address owner = msg.sender;

    address[] public stableCoins;
    uint stableCoinsIndex = 0;

    constructor() public {
        owner = msg.sender;
    }
    function addStableCoin (address _stableCoinAddress) public {
        require((msg.sender == owner), "Stable coin address cannot be zero");
        require((_stableCoinAddress != address(0)), "Stable coin address cannot be zero");
        stableCoins.push(_stableCoinAddress);
        stableCoinsIndex ++;
    }
}