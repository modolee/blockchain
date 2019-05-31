pragma solidity ^0.5.0;

contract SimpleStorage {
    address owner;
    uint data;
    
    event LogSetData(uint oldVal, uint newVal);
    
    modifier onlyOwner(address _user) {
        require(owner == _user, 'You are not the owner');
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
    
    function () payable external {
        data = 9999999;
    }
    
    function getOwner() public view returns (address) {
        return owner;
    }

    function setData(uint x) public onlyOwner(msg.sender) {
        emit LogSetData(data, x);
        data = x;
    }

    function getData() public view returns (uint) {
        return data;
    }
}

contract fallbackCaller {
    address contractAddress;
    
    constructor(address _contract) public {
        contractAddress = _contract;
    }
    
    function callFallback() public {
        (bool success, bytes memory returndata) = contractAddress.call(abi.encodeWithSelector(bytes4(keccak256("abababab"))));
    }
}
