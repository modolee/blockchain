pragma solidity ^0.4.24;

/// @title Ch.4.2 Greeter 스마트 컨트랙트 - 05-03 lang을 문자열로 입력
/// @author Seongil Lee
/// @notice 코어 이더리움 프로그램 책에 나와 있는 예제입니다.
/// @dev 개인 공부용으로 작성했습니다.
/// @dev 사용자가 enum 숫자를 알 필요 없이 문자열로 입력하면 mapping 해 줍니다.
contract Greeter {
    struct Greeting {
        string hello;
        string goodbye;
    }

    mapping (uint8 => Greeting) greetingByLang;
    mapping (string => uint8) langMap;

    enum Lang { Korean, English }

    /// @notice contract를 생성하며 만날 때 인사말을 지정합니다.
    /// @dev 사용자가 문자열로 언어를 입력하면 enum으로 mapping합니다.
    constructor() public {
        greetingByLang[uint8(Lang.Korean)] = Greeting("안녕?", "잘가!");
        greetingByLang[uint8(Lang.English)] = Greeting({goodbye:"Goodbye!", hello:"Hello"});
        langMap["Korean"] = uint8(Lang.Korean);
        langMap["English"] = uint8(Lang.English);
    }

    /// @notice 선택한 언어의 만날 때 인사말을 가져옵니다.
    /// @param _lang 언어를 선택하기 위한 문자열 ("Korean", "English")
    /// @return greetingByLang의 lang 인덱스에 들어 있는 만날 때 인사말
    function sayHello(string _lang) public view returns (string) {
        uint8 lang = langMap[_lang];
        return greetingByLang[lang].hello;
    }

    /// @notice 선택한 언어의 만날 때 인사말을 변경합니다.
    /// @param _lang 언어를 선택하기 위한 문자열 ("Korean", "English")
    /// @param _hello 변경 하고자 하는 만날 때 인사말
    function changeHello(string _lang, string _hello) public {
        uint8 lang = langMap[_lang];
        greetingByLang[lang].hello = _hello;
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 가져옵니다.
    /// @param _lang 언어를 선택하기 위한 문자열 ("Korean", "English")
    /// @return lang에 맞는 헤어질 때 인사말
    function sayGoodbye(string _lang) public view returns (string) {
        uint8 lang = langMap[_lang];
        return greetingByLang[lang].goodbye;
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 변경합니다.
    /// @param _lang 언어를 선택하기 위한 문자열 ("Korean", "English")
    /// @param _goodbye 변경 하고자 하는 헤어질 때 인사말
    function changeGoodbye(string _lang, string _goodbye) public {
        uint8 lang = langMap[_lang];
        greetingByLang[lang].goodbye = _goodbye;
    }
}