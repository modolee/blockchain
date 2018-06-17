pragma solidity ^0.4.24;

/// @title Ch.4.2 Greeter 스마트 컨트랙트 - 04-01 uint8 변수를 이용해서 다국어 지원
/// @author Seongil Lee
/// @notice 코어 이더리움 프로그램 책에 나와 있는 예제입니다.
/// @dev 개인 공부용으로 작성했습니다.
contract Greeter {
    string helloKorean = "안녕?";
    string goodbyeKorean = "잘가!";
    string helloEnglish = "Hello";
    string goodbyeEnglish = "Goodbye!";

    /// @notice 선택한 언어의 만날 때 인사말을 가져옵니다.
    /// @dev enum 타입 사용 시 lang이 uint8이므로 명시적 형 변환 필수!
    /// @param lang 언어를 선택하기 위한 uint8 value (Korean : 0, English: 1)
    /// @return lang에 맞는 만날 때 인사말
    function sayHello(uint8 lang) public view returns (string) {
        if (lang == 0) {
            return helloKorean;
        } else if (lang == 1) {
            return helloEnglish;
        } else {
            return "";
        }
    }

    /// @notice 선택한 언어의 만날 때 인사말을 변경합니다.
    /// @param lang 언어를 선택하기 위한 uint8 value (Korean : 0, English: 1)
    /// @param _hello 변경 하고자 하는 만날 때 인사말
    function changeHello(uint8 lang, string _hello) public {
        if (lang == 0) {
            helloKorean = _hello;
        } else if (lang == 1) {
            helloEnglish = _hello;
        }
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 가져옵니다.
    /// @dev enum 타입 사용 시 lang이 uint8이므로 명시적 형 변환 필수!
    /// @param lang 언어를 선택하기 위한 uint8 value (Korean : 0, English: 1)
    /// @return lang에 맞는 헤어질 때 인사말
    function sayGoodbye(uint8 lang) public view returns (string) {
        if (lang == 0) {
            return goodbyeKorean;
        } else if (lang == 1) {
            return goodbyeEnglish;
        } else {
            return "";
        }
    }

    /// @notice 선택한 언어의 헤어질 때 인사말을 변경합니다.
    /// @param lang 언어를 선택하기 위한 uint8 value (Korean : 0, English: 1)
    /// @param _goodbye 변경 하고자 하는 헤어질 때 인사말
    function changeGoodbye(uint8 lang, string _goodbye) public {
        if (lang == 0) {
            goodbyeKorean = _goodbye;
        } else if (lang == 1) {
            goodbyeEnglish = _goodbye;
        }
    }
}