pragma solidity ^0.4.24;

/**
 * Ch.4 Greeter 스마트 컨트랙트
 * 04-01 uint8 변수를 이용해서 다국어 지원
 */

contract Greeter {
    string helloKorean = "안녕?";
    string goodbyeKorean = "잘가!";
    string helloEnglish = "Hello";
    string goodbyeEnglish = "Goodbye!";

    function sayHello(uint8 lang) public view returns (string) {
        if (lang == 0) {
            return helloKorean;
        } else if (lang == 1) {
            return helloEnglish;
        } else {
            return "";
        }
    }

    function changeHello(uint8 lang, string _hello) public {
        if (lang == 0) {
            helloKorean = _hello;
        } else if (lang == 1) {
            helloEnglish = _hello;
        }
    }

    function sayGoodbye(uint8 lang) public view returns (string) {
        if (lang == 0) {
            return goodbyeKorean;
        } else if (lang == 1) {
            return goodbyeEnglish;
        } else {
            return "";
        }
    }

    function changeGoodbye(uint8 lang, string _goodbye) public {
        if (lang == 0) {
            goodbyeKorean = _goodbye;
        } else if (lang == 1) {
            goodbyeEnglish = _goodbye;
        }
    }
}