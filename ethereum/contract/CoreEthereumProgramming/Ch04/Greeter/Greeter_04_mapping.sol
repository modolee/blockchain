pragma solidity ^0.4.24;

/**
 * Ch.4 Greeter 스마트 컨트랙트
 * 04-03 mapping 변수를 이용해서 다국어 지원
 * mapping 상태 변수를 정의하고, 생성자에서 초기 값을 설정해 준다.
 */

contract Greeter {
    // mapping (Lang => string) helloByLang 처럼 정의하고 싶지만,
    // 솔리티디에서는 enum 타입으로 key 타입을 지정할 수 없다.
    // value 타입으로는 모든 타입이 가능
    mapping (uint8 => string) helloByLang;

    string goodbyeKorean = "잘가!";
    string goodbyeEnglish = "Goodbye!";

    enum Lang { Korean, English }

    constructor() public {
        helloByLang[uint8(Lang.Korean)] = "안녕?";
        helloByLang[uint8(Lang.English)] = "Hello";
    }

    function sayHello(uint8 lang) public view returns (string) {
        return helloByLang[lang];
    }

    function changeHello(uint8 lang, string _hello) public {
        helloByLang[lang] = _hello;
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