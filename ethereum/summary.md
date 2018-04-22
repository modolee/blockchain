# 이더리움 개념 정리

### 목차
* 이더리움이란?
* 비탈릭 부테린은?
* 이더리움 탄생 배경
* 이더리움의 특징들

### 이더리움이란?
2015년 비탈릭 부테린이 개발한 2세대 블록체인

>Ethereum is a decentralized platform that runs smart contracts: applications that run exactly as programmed without any possibility of downtime, censorship, fraud or third-party interference.
출처 : http://www.ethereum.org

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

##### 2. 가치의 불투명성(Value-blindness)
코인의 가치를 외부에서 받아와서(**오라클 문제**) 해당 가치만큼을 분배하려고 할 때, 비트코인의 경우 UTXO에서 일부만 사용이 불가능하다. 일부만 사용하기 위해서는 전체를 input으로 하고 일부를 수신자에게 보내고 나머지를 자신에게 보내는 비효율적인 작업을 해야 한다.
=> **어카운트 개념 도입**

##### 3. 상태의 단순성(Lack of state)
###### 상태를 다양하게 하려던 시도
* 컬러드 코인
* 네임 코인
* 메타 코인
##### 4. 블록체인 해석 불가 (Blockchain-blindness)

### 이더리움의 특징들

#### 어카운트
##### 어카운트란?
=> ~~가치 불투명성의 해결책~~ UTXO의 비효율성 해결

비트코인 UTXO와 비교
##### EOA(Externally Owned Account)
##### CA (Contract Account)

#### 메세지와 트랜잭션
비트코인 UTXO와 비교
##### 메세지
##### 트랜잭션

#### 상태 변환 함수
=> 상태의 단순성, 블록체인 해석 불가의 해결
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
