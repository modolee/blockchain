pragma solidity ^0.4.24;

/**
 * Ch.4 Greeter 스마트 컨트랙트
 * 01 인사말 출력
 */

contract Greeter {
    // 상태 변수 읽기/쓰기가 없으므로 pure로 선언
    function sayHello() public pure returns (string){
        return "안녕?";
    }
}