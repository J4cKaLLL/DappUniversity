pragma solidity >= 0.4.23 <0.6.0;

contract MarketPlace {
    string public name;
    string public eder;
    uint public productCount = 0;
    mapping(uint => Product) public products;

    struct Product {
        uint id;
        string name;
        uint price;
        address owner;
        bool purchased;
    }

    constructor() public {
        name = "Dapp University Marketplace";
        eder = "Eder Rubiano";
    }

    function createProduct() public {
        // make sure parameters are correct
        // Create the product
        // Increment product count
        productCount++;
        // Trigger an event
    }
}