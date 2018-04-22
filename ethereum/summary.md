# 이더리움 개념 정리

### 목차
* 이더리움이란?
* 비탈릭 부테린은?
* 이더리움 탄생 배경
* 이더리움의 특징들

### 이더리움이란?
2015년 비탈릭 부테린이 개발한 2세대 블록체인

>Ethereum is a decentralized platform that runs smart contracts: applications that run exactly as programmed without any possibility of downtime, censorship, fraud or third-party interference.

(출처 : http://www.ethereum.org)

**스마트 컨트랙트**(중단, 검열, 사기 또는 제 3자의 방해 가능성이 전혀 없이 **프로그래밍 된 대로 정확히 동작하는 프로그램**)가 동작하는 탈중앙화 된 **플랫폼**.

### 비탈릭 부테린은?
![비탈릭사진](https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/VitalikButerinProfile.jpg/250px-VitalikButerinProfile.jpg)

* 1994년 1월 31일 : 만 24살
* 러시아에서 태어나 부모님 취직을 위해서 캐나다로 이민가면서 캐나다에 정착
* 2011년 9월 **[비트코인 매거진](https://bitcoinmagazine.com/authors/vitalik-buterin/)** 창간
* 2013년 이더리움 백서 작성
* 2014년 월드 테크놀로지 어워드 IT 소프트웨어 부문 수상 (페이스북의 마크 저커버그도 함께 후보에 있었음)
* 2015년 7월 30일 이더리움 메인넷 런칭

(출처 : [위키피디아](https://ko.wikipedia.org/wiki/%EB%B9%84%ED%83%88%EB%A6%AD_%EB%B6%80%ED%85%8C%EB%A6%B0), [한국경제 신문](http://news.hankyung.com/article/2014121540821))

### 이더리움 탄생 배경
#### 스마트 컨트랙트 도입
* [마스터 코인에 스마트 컨트랙트 도입 제안](https://vitalik.ca/general/2017/09/14/prehistory.html)
* 거절 당하자 직접 만들어 버림
##### 스마트 컨트랙트란?
* 블록체인 기반으로 금융거래, 부동산 계약, 공증 등 다양한 형태의 계약을 체결하고 이행하는 것을 말한다. 블록체인 2.0이라고도 한다. (출처 : [위키피디아](https://ko.wikipedia.org/wiki/%EC%8A%A4%EB%A7%88%ED%8A%B8_%EA%B3%84%EC%95%BD))
* 기존의 계약
![기존의계약](https://media.blockchainhub.net/wp-content/uploads/2016/07/smart-contracts-infographic-slice-1-1.jpg)
* 스마트 컨트랙트(계약)
![스마트계약](https://media.blockchainhub.net/wp-content/uploads/2016/07/smart-contracts-infographic-slice-3.jpg)
(출처 : https://blockchainhub.net/smart-contracts/)
* 예시 - 웹사이트 판매
![웹사이트판매](http://etherscripter.com/sales_contract.png)
(출처 : http://etherscripter.com/what_is_ethereum.html)
* 예시 - 가장 기본적인 ICO
    * 1 ETH를 보내면 10 SI를 보내준다.
    * 1SI = 0.1 ETH
    * [이더리움 ICO 코드](https://www.ethereum.org/crowdsale)
#### 비트코인의 문제점 해결
##### 1. 튜링 불완정성 (Lack of Turing-completeness)
비트코인 스크립트로 할 수 있는 작업(서명, 검증 등)이 많긴 하지만 모든 경우의 프로그래밍을 다 지원하지는 않는다. 특히 반복문을 지원하지 않아서 공간 비효율적이다.
* 반복문이란?
    * 프로그래밍 언어에서 동일한 명령을 반복적으로 실행할 수 있게 해주는 명령어
    * for, while 등이 있다.
    * 반복문 사용 전
    ```
    printf("Give me 1 ETH");
    printf("Give me 2 ETH");
    printf("Give me 3 ETH");
    printf("Give me 4 ETH");
    printf("Give me 5 ETH");
    ```
    * 반복문 사용 후
    ```
    for(i=1;i<=5;i++) {
        printf("Give me %d ETH", i);
    }
    ```
* 비트코인이 반복문을 사용하지 않았던 이유
    * 코드 실행 시 무한 루프에 빠지는 것을 방지하기 위해서

=> **튜링 완전한 프로그래밍 언어 지원 & Gas Fee 도입**
 
##### 2. 가치의 불투명성(Value-blindness)
코인의 가치를 외부에서 받아와서(**오라클 문제**) 해당 가치만큼을 분배하려고 할 때, 비트코인의 경우 UTXO에서 일부만 사용이 불가능하다. 일부만 사용하기 위해서는 전체를 input으로 하고 일부를 수신자에게 보내고 나머지를 자신에게 보내는 비효율적인 작업을 해야 한다.
=> **어카운트 개념 도입**

##### 3. 상태의 단순성(Lack of state)
비트코인은 애초에 지불 수단으로 개발되었기 때문에, 비트코인을 주고 받는 용도로 밖에 사용할 수 없다. 다른 데이터를 넣을 수 없다. 그리고 UTXO는 *사용되었다/사용되지 않았다* 라는 두 가지 상태 밖에 표현할 수 없다.
###### 상태를 다양하게 하려던 시도
비트코인의 UTXO에 메타 데이터를 넣어서 다른 가치들을 저장하려고 시도
* 컬러드 코인 - [소개영상](https://www.youtube.com/watch?v=fmFjmvwPGKU)
* 네임 코인
* 메타 코인
* 마스터 코인
<img src="./img/colored_coin.png" width=70%>

=> **트랜잭션에 잔액 뿐만 아니라 다른 데이터를 넣을 수 있는 공간을 마련**
##### 4. 블록체인 해석 불가 (Blockchain-blindness) - 잘 이해 안됨
비트코인의 UTXO에서는 블록체인 내에서 랜덤성을 띄고 있는 값들(논스, 이전 블록의 해시, 타임스탬프)을 불러서 사용할 수 없다. 그래서 랜덤성을 요구하는 도박과 같은 어플리케이션을 만드는게 한계가 있다.
=> **결국엔 Lack of State와 같은 말이 아닐까?**

### 이더리움의 특징들

#### 어카운트
##### 어카운트란?
=> ~~가치 불투명성의 해결책~~ **UTXO의 비효율성 해결**
##### 비트코인의 UTXO
##### EOA(Externally Owned Account)
실행 코드를 포함하고 있지 않다.
##### CA (Contract Account)

#### 메세지와 트랜잭션
##### 비트코인의 트랜잭션
##### 트랜잭션
##### 메세지
프라이빗키로 서명되어 있지 않다.

#### 상태 변환 함수
=> 상태의 단순성, 블록체인 해석 불가의 해결
##### 비트코인의 상태 변환
##### 일반 트랜잭션
##### 스마트 컨트랙트 트랜잭션

#### 코드 실행
##### 프로그래밍 언어
=> 튜링 불완전성 해결
* Solidity
* Serpent
* LLL(Low Level OPCODE)
##### EVM(Ethereum Virtual Machine)

#### 블럭체인과 채굴
##### Etash
: ASIC 사용 불가
