pragma solidity ^0.4.24;

/**
 * Ch.4 Greeter 스마트 컨트랙트
 * 04-02 enum 변수를 이용해서 다국어 지원
 * 숫자로 선택하던 언어를 enum 타입을 정의해서 가독성을 높인다.
 */

contract Greeter {
    string helloKorean = "안녕?";
    string goodbyeKorean = "잘가!";
    string helloEnglish = "Hello";
    string goodbyeEnglish = "Goodbye!";

    enum Lang { Korean, English }

    // enum 타입 사용 시 lang이 uint8이므로 명시적 형 변환 필수!
    function sayHello(uint8 lang) public view returns (string) {
        if (lang == uint8(Lang.Korean)) {
            return helloKorean;
        } else if (lang == uint8(Lang.English)) {
            return helloEnglish;
        } else {
            return "";
        }
    }

    function changeHello(uint8 lang, string _hello) public {
        if (lang == uint8(Lang.Korean)) {
            helloKorean = _hello;
        } else if (lang == uint8(Lang.English)) {
            helloEnglish = _hello;
        }
    }

    function sayGoodbye(uint8 lang) public view returns (string) {
        if (lang == uint8(Lang.Korean)) {
            return goodbyeKorean;
        } else if (lang == uint8(Lang.English)) {
            return goodbyeEnglish;
        } else {
            return "";
        }
    }

    function changeGoodbye(uint8 lang, string _goodbye) public {
        if (lang == uint8(Lang.Korean)) {
            goodbyeKorean = _goodbye;
        } else if (lang == uint8(Lang.English)) {
            goodbyeEnglish = _goodbye;
        }
    }
}