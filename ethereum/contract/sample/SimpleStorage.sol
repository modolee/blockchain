pragma solidity ^0.5.0;

contract SimpleStorage {
    uint data;

    function setData(uint _data) public {
        data = _data;
    }

    function getData() public view returns (uint) {
        return data;
    }
}
