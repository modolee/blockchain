pragma solidity ^0.4.24;

/// @title Ch.4.2 Greeter 스마트 컨트랙트 - 01 인사말 출력
/// @author Seongil Lee
/// @notice 코어 이더리움 프로그램 책에 나와 있는 예제입니다.
/// @dev 개인 공부용으로 작성했습니다.
contract Greeter {
    /// @notice 상태 변수 읽기/쓰기가 없으므로 pure로 선언
    /// @return 인사말
    function sayHello() public pure returns (string){
        return "안녕?";
    }
}