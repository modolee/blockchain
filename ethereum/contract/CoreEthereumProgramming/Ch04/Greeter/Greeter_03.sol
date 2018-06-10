pragma solidity ^0.4.24;

/**
 * Ch.4 Greeter 스마트 컨트랙트
 * 03 헤어질 때 인사 메세지 추가
 */

contract Greeter {
    string hello = "안녕?";
    string goodbye = "잘가!";

    function sayHello() public view returns (string) {
        return hello;
    }

    function changeHello(string _hello) public {
        hello = _hello;
    }

    function sayGoodbye() public view returns (string) {
        return goodbye;
    }

    function changeGoodbye(string _goodbye) public {
        goodbye = _goodbye;
    }
}