pragma solidity ^0.5.0;

contract SimpleStorage {
    uint data;

    function setData(uint x) public {
        data = x;
    }

    function getData() public view returns (uint) {
        return data;
    }
}
