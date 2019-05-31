pragma solidity ^0.5.0;

contract SimpleStorage {
    uint data;
    address public owner;

    event LogSetData(uint indexed oldData, uint indexed newData);

    modifier onlyOwner() {
        require(owner == msg.sender, 'You are not the owner');
        _;
    }

    constructor() public {
        owner = msg.sender;
    }
    
    function () payable external {
        
    }
    
    function getEthBalance() public view returns(uint256) {
        return address(this).balance;
    }
    
    function withdraw() external onlyOwner() {
        msg.sender.transfer(address(this).balance);
    }

    function setData(uint _data) public onlyOwner() {
        emit LogSetData(data, _data);
        data = _data;
    }

    function getData() public view returns (uint) {
        return data;
    }
}
