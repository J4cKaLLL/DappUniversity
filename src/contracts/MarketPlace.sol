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
        address payable owner;
        bool purchased;
    }

     event ProductCreated (
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );

     event ProductPurchased (
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );

    constructor() public {
        name = "Dapp University Marketplace";
        eder = "Eder Rubiano";
    }

    function createProduct(string memory _name, uint _price) public {
        // Require a name
        require(bytes(_name).length > 0, "Error1");
        // Require a valid price
        require(_price > 0,"Error2");
        // Increment product count
        productCount++;
        // Create the product
        products[productCount] = Product(productCount, _name, _price, msg.sender, false);
        // Trigger an event
        emit ProductCreated(productCount, _name, _price, msg.sender, false);
    }

    function purchaseProduct(uint _id) public payable {
        // Fetch the product
        Product memory _product = products[_id];
        // Fetch the owner
        address payable _seller = _product.owner;
        // Make sure product is valid        
        // Transfer Ownership to the buyer
        _product.owner = msg.sender;
        // Mark as purchased
        _product.purchased = true;
        // Update the product
        products[_id] = _product;
        // Pay the seller by sending them ether
        address(_seller).transfer(msg.value);
        // Trigger an event
        emit ProductPurchased(productCount, _product.name, _product.price, msg.sender, false);
    }
}