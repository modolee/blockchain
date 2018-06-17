pragma solidity ^0.4.24;

/// @title Ch.4.2 Greeter 스마트 컨트랙트 - 02 인사말 변경 추가
/// @author Seongil Lee
/// @notice 코어 이더리움 프로그램 책에 나와 있는 예제입니다.
/// @dev 개인 공부용으로 작성했습니다.
contract Greeter {
    string public message = "안녕?";

    /// @notice message 상태 변수를 읽어와야 되므로, pure가 아닌 view로 변경
    /// @return 인사말 상태변수
    function sayHello() public view returns (string) {
        return message;
    }

    /// @notice 쓰기가 포함되어 있으므로, pure/view 사용 불가
    /// @dev 기본(non-payable) 사용
    /// @param _message 변경하고자 하는 인사말
    function changeHello(string _message) public {
        message = _message;
    }
}
