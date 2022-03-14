pragma solidity ^0.8.7;

contract Migrations {
    address owner = msg.sender;

    address[] public stableCoins;
    uint stableCoinsIndex = 0;

    struct BorrowOrder {
        uint ltv_min;
        uint ltv_max;
        uint loan_duration;
        uint interest_rate_min;
        uint interest_rate_max;
        bool installments;
        uint collateral;
        bool fulfilled;
        uint amount_borrowed;
        address stable_coin_address;
    }

     mapping(address => mapping(uint => BorrowOrder)) public borrowOrders;
    constructor() public {
        owner = msg.sender;
    }
    function addStableCoin (address _stableCoinAddress) public {
        require((msg.sender == owner), "Stable coin address cannot be zero");
        require((_stableCoinAddress != address(0)), "Stable coin address cannot be zero");
        stableCoins.push(_stableCoinAddress);
        stableCoinsIndex ++;
    }

    function createBorrowOrder(
        uint _ltv_min,
        uint _ltv_max,
        uint _loan_duration,
        uint _interest_rate_min,
        uint _interest_rate_max,
        bool _installments,
        uint _collateral,
        address _stable_coin_address
    ) public {
        require((_ltv_min > 0), "LTV min should be more than 0");
        require((_ltv_max > 0 && _ltv_max > _ltv_min), "LTV max should be more than 0 and should be greater than LTV min");
        require((_loan_duration > 0), "Loan duration should be greater than 0 months");
        require((_interest_rate_min > 0 && _interest_rate_max > 0  && _interest_rate_max > _interest_rate_min), "Interest rate should be more than 0 and interest rate max value should be greater than interest rate min");
        require((_collateral > 0), "Collateral should be more than 0");
        require((_stable_coin_address != address(0)), "stable coin address should not be 0");
        
    }
}