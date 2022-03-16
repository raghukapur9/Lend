pragma solidity ^0.8.7;

contract Migrations {
    address owner = msg.sender;

    address[] public stableCoins;
    uint stableCoinsIndex = 0;

    struct BorrowOrder {
        uint256 ltv_min;
        uint256 ltv_max;
        uint256 loan_duration;
        uint256 interest_rate_min;
        uint256 interest_rate_max;
        bool installments;
        uint collateral;
        bool fulfilled;
        uint256 amount_borrowed;
        address stable_coin_address;
        address collateral_address;
        address borrower_address;
        address lender_address;
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
        uint256 _ltv_min,
        uint256 _ltv_max,
        uint256 _loan_duration,
        uint256 _interest_rate_min,
        uint256 _interest_rate_max,
        bool _installments,
        uint256 _collateral,
        address _stable_coin_address,
        address _collateral_address
    ) public {
        require((_ltv_min > 0 && _ltv_max > 0 && _ltv_max > _ltv_min), "LTV min should be more than 0");
        require((_loan_duration > 0), "loan duration should be greater than 0 months");
        require((_interest_rate_min > 0 && _interest_rate_max > 0  && _interest_rate_max > _interest_rate_min), "Interest rate should be more than 0 and interest rate max value should be greater than interest rate min");
        require((_collateral > 0), "Collateral should be more than 0");
        require((_stable_coin_address != address(0) && _collateral_address != address(0)), "stable coin address should not be 0");

    }
}