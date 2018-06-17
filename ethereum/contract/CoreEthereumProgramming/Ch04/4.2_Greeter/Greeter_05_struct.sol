pragma solidity ^0.4.24;

/// @title Ch.4.2 Greeter 스마트 컨트랙트 - 05-02 struct 도입
/// @author Seongil Lee
/// @notice 코어 이더리움 프로그램 책에 나와 있는 예제입니다.
/// @dev 개인 공부용으로 작성했습니다.
/// @dev 만날 때 인사말과 헤어질 때 인사말을 struct로 묶어서 정의
contract Greeter {
    struct Greeting {
        string hello;
        string goodbye;
    }

    mapping (uint8 => Greeting) greetingByLang;

    enum Lang { Korean, English }

    /// @notice contract를 생성하며 만날 때 인사말을 지정합니다.
    /// @dev struct를 초기화 하는 방법은 2가지가 있습니다.
    /// @dev 1. struct에 정의 된 순서대로 지정하는 방법
    /// @dev 2. struct에 정의 된 변수 이름을 사용하여 지정하는 방법
    constructor() public {
        greetingByLang[uint8(Lang.Korean)] = Greeting("안녕?", "잘가!");
        greetingByLang[uint8(Lang.English)] = Greeting({goodbye:"Goodbye!", hello:"Hello"});
    }

    /// @notice 선택한 언어의 만날 때 인사말을 가져옵니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @return greetingByLang의 lang 인덱스에 들어 있는 만날 때 인사말
    function sayHello(uint8 lang) public view returns (string) {
        return greetingByLang[lang].hello;
    }

    /// @notice 선택한 언어의 만날 때 인사말을 변경합니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @param _hello 변경 하고자 하는 만날 때 인사말
    function changeHello(uint8 lang, string _hello) public {
        greetingByLang[lang].hello = _hello;
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 가져옵니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @return greetingByLang의 lang 인덱스에 들어 있는 헤어질 때 인사말
    function sayGoodbye(uint8 lang) public view returns (string) {
        return greetingByLang[lang].goodbye;
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 변경합니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @param _goodbye 변경 하고자 하는 헤어질 때 인사말
    function changeGoodbye(uint8 lang, string _goodbye) public {
        greetingByLang[lang].goodbye = _goodbye;
    }
}