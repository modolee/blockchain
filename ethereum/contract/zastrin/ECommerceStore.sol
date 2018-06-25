pragma solidity ^0.4.24;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}

/// @title Decentralized ECommerceStore Contract
/// @author Seongil Lee
/// @notice This is an EcommerceStore of decentralized version
contract EcommerceStore {
    using SafeMath for uint;
    
    enum ProductStatus { Open, Sold, Unsold }
    enum ProductCondition { New, Used }
    
    uint public productIndex;
    mapping (address => mapping(uint => Product)) stores;
    mapping (uint => address) productIdInStore;
    
    struct Product {
        uint id;
        string name;
        string category;
        string imageLink;
        string descLink;
        uint auctionStartTime;
        uint auctionEndTime;
        uint startPrice;
        address highestBidder;
        uint highestBid;
        uint secondHighestBid;
        uint totalBids;
        ProductStatus status;
        ProductCondition condition;
    }
    
    /// @notice constructor for EcommerceStore contract
    /// @dev initialize productIndex
    constructor() public {
        productIndex = 0;
    }
    
    /// @notice Add products info to sell
    /// @dev pass all member variables of Product struct
    /// @param _name product name
    /// @param _category product category
    /// @param _imageLink IPFS link for product image
    /// @param _descLink IPFS link for product description
    /// @param _auctionStartTime auction start time (sec)
    /// @param _auctionEndTime auction end time (sec)
    /// @param _startPrice start price (wei)
    /// @param _condition product conditions (ProductCondition)
    function addProductToStore(
        string _name,
        string _category,
        string _imageLink,
        string _descLink,
        uint _auctionStartTime,
        uint _auctionEndTime,
        uint _startPrice,
        ProductCondition _condition
    )
        public
    {
        productIndex = productIndex.add(1);
        require(_auctionStartTime < _auctionEndTime);
        Product memory product = Product(
            productIndex,
            _name,
            _category,
            _imageLink,
            _descLink,
            _auctionStartTime,
            _auctionEndTime,
            _startPrice,
            0,
            0,
            0,
            0,
            ProductStatus.Open,
            ProductCondition(_condition)
        );
        stores[msg.sender][productIndex] = product;
        productIdInStore[productIndex] = msg.sender;
    }
    
    /// @notice Get product information
    /// @param _productId product id that you want to know product information
    function getProduct(uint _productId) public view returns(
        uint,
        string,
        string,
        string,
        string,
        uint,
        uint,
        uint,
        ProductStatus,
        ProductCondition
    )
    {
        Product memory product = stores[productIdInStore[_productId]][_productId];
        
        return (
            product.id,
            product.name,
            product.category,
            product.imageLink,
            product.descLink,
            product.auctionStartTime,
            product.auctionEndTime,
            product.startPrice,
            product.status,
            product.condition
        );
    }
}
