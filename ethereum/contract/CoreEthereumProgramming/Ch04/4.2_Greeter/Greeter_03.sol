pragma solidity ^0.4.24;

/// @title Ch.4.2 Greeter 스마트 컨트랙트 - 03 헤어질 때 인사 메세지 추가
/// @author Seongil Lee
/// @notice 코어 이더리움 프로그램 책에 나와 있는 예제입니다.
/// @dev 개인 공부용으로 작성했습니다.
contract Greeter {
    string hello = "안녕?";
    string goodbye = "잘가!";

    /// @notice 만날 때 인사말을 가져옵니다.
    /// @return 만날 때 인사말
    function sayHello() public view returns (string) {
        return hello;
    }

    /// @notice 만날 때 인사말을 변경합니다.
    /// @param _hello 변경하고자 하는 만날 때 인사말
    function changeHello(string _hello) public {
        hello = _hello;
    }

    /// @notice 헤어질 때 인사말을 가져옵니다.
    /// @return 헤어질 때 인사말
    function sayGoodbye() public view returns (string) {
        return goodbye;
    }

    /// @notice 헤어질 때 인사말을 변경합니다.
    /// @param _goodbye 변경하고자 하는 헤어질 때 인사말
    function changeGoodbye(string _goodbye) public {
        goodbye = _goodbye;
    }
}