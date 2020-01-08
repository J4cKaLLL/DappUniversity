pragma solidity >= 0.4.23 <0.6.0;

contract MarketPlace {
    string public name;
    string public eder;
    constructor() public {
        name = "Dapp University Marketplace";
        eder = "Eder Rubiano";
    }
}