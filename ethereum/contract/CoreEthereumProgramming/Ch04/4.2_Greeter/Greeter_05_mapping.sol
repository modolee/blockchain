pragma solidity ^0.4.24;

/// @title Ch.4.2 Greeter 스마트 컨트랙트 - 05-01 mapping을 이용한 goodbye 다국어 지원
/// @author Seongil Lee
/// @notice 코어 이더리움 프로그램 책에 나와 있는 예제입니다.
/// @dev 개인 공부용으로 작성했습니다.
/// @dev mapping 상태 변수를 정의하고, 생성자에서 초기 값을 설정해 준다.
contract Greeter {
    mapping (uint8 => string) helloByLang;
    mapping (uint8 => string) goodbyeByLang;

    enum Lang { Korean, English }

    /// @notice contract를 생성하며 만날 때 인사말을 지정합니다.
    constructor() public {
        helloByLang[uint8(Lang.Korean)] = "안녕?";
        helloByLang[uint8(Lang.English)] = "Hello";
        goodbyeByLang[uint8(Lang.Korean)] = "잘가!";
        goodbyeByLang[uint8(Lang.English)] = "Goodbye!";
    }

    /// @notice 선택한 언어의 만날 때 인사말을 가져옵니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @return helloByLang의 lang 인덱스에 들어 있는 인사말
    function sayHello(uint8 lang) public view returns (string) {
        return helloByLang[lang];
    }

    /// @notice 선택한 언어의 만날 때 인사말을 변경합니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @param _hello 변경 하고자 하는 만날 때 인사말
    function changeHello(uint8 lang, string _hello) public {
        helloByLang[lang] = _hello;
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 가져옵니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @return lang에 맞는 헤어질 때 인사말
    function sayGoodbye(uint8 lang) public view returns (string) {
        return goodbyeByLang[lang];
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 변경합니다.
    /// @param lang 언어를 선택하기 위한 enum value (Korean : 0, English: 1)
    /// @param _goodbye 변경 하고자 하는 헤어질 때 인사말
    function changeGoodbye(uint8 lang, string _goodbye) public {
        goodbyeByLang[lang] = _goodbye;
    }
}