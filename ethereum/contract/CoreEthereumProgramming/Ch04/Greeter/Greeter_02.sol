pragma solidity ^0.4.24;

/**
 * Ch.4 Greeter 스마트 컨트랙트
 * 02 인사말 변경 추가
 */

contract Greeter {
    string public message = "안녕?";

     // message 상태 변수를 읽어와야 되므로, pure가 아닌 view로 변경
    function sayHello() public view returns (string) {
        return message;
    }

    /**
     * 쓰기가 포함되어 있으므로, pure/view 사용 불가
     * 기본(non-payable) 사용
     */
    function changeHello(string _message) public {
        message = _message;
    }
}
