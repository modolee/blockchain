# 오라클
* "오라클"이라는 용어는 그리스 신화에서 유래됐으며, 미래에 대한 비전을 볼 수 있으며 신들과 소통하는 사람을 가리킨다.
* 블록체인에서 말하는 오라클을 이더리움(블록체인) 외부의 질문을 대답할 수 있는 시스템이다.
* 이상적인 오라클은 분산으로 운영되며 신뢰가 필요 없는 시스템이다.

## 오라클이 왜 필요한가?
* 이더리움 플랫폼의 핵심은 컨센서스 규칙에 의해 프로그램을 실행하고 상태를 업데이트하는 EVM(Ethereum Virtual Machine)이다.
* 컨센서스를 유지하기 위해서 EVM은 항상 결정적으로만 실행되어야 한다. 이로 인해 중요한 두 가지 결론이 나온다.

### 이더리움 내부에서는 랜덤 소스가 없다.
* 예를 들어 A라는 노드가 스마트 컨트랙트를 실행해서 3이라는 값을 저장하였고, B라는 노드가 같은 스마트 컨트랙트를 실행해서 7이라는 값을 저장했다고 하자.
* 이렇게 스마트 컨트랙트가 실행 될 때 마다 다른 결과가 나오게 된다면, 세계에 퍼져 있는 노드들이 각자 운영하면서 네트워크를 형성한다는 것은 불가능하다.
* 즉 동일한 원장을 공유해야 하는데, 서로 다른 원장을 가지고 있게 되는 것이다.

### 외부 데이터는 트랜잭션 data payload를 통해서만 이더리움 내부로 들어올 수 있다.
* 서명 된 트랜잭션은 모든 노드가 받아 들일지 말지를 결정할 수 있다.
* 외부의 데이터(랜덤 소스, 가격 정보, 일기 예보 등)를 가져올 때 트랜잭션의 데이터에 넣으면 노드의 동의를 구할 수 있다.
* 하지만 이런 데이터는 신뢰할 수 없는 출처에서 나온 것일 수 있기 때문에 무조건 동의를 받을 수 없다.

## 오라클 사용 사례 및 예시
* 양자/열 처리와 같은 물리적 소스로부터의 랜덤 넘버 / 엔트로피 : 복권 스마트 컨트랙트의 우승자를 공정하게 선정
* 자연 재해에 인덱싱 된 매개 변수 트리거 : 지진 채권에 대한 리히터 규모 측정과 같은 대재해 채권 스마트 컨트랙트의 트리거
* 환율 데이터 : 암호화폐와 법정화폐를 정확하게 패깅
* 자본 시장 데이터 : 토큰 화 된 자산/증권 바스켓의 가격 책정
* 벤치 마크 참조 데이터 : 금리를 스마트 금융 파생 상품에 통합
* 정적/유사 정적 데이터 : 보안 식별자, 국가 코드, 통화 코드 등
* 시간 및 간격 데이터 : 정확한 시간 측정에 근거한 이벤트 트리거
* 날씨 데이터 : 일기 예보에 근거한 보험료 계산
* 정치적 사건 : 예측 시장
* 스포츠 이벤트 : 예측 시장 및 판타지 스포츠 계약
* 지리적 위치 데이터 : 공급망 추적에 사용
* 피해 확인 : 보험 계약
* 다른 블록체인에서 발생하는 이벤트 : 상호 운용성 기능
* Ether 시장 가격 : Gas 가격을 법정화폐로 환산
* 비행 통계 : 항공사 마일리지 가족(그룹) 공유에 사용

## 오라클 디자인 패턴

### 모든 오라클이 공통적으로 제공하는 기능
1. 오프 체인 소스로 부터 데이터를 수집한다.
2. 서명 된 트랜잭션에 데이터를 온 체인에 전송한다.
3. 데이터를 스마트 컨트랙트의 저장소에 저장하여 사용 가능하게 한다.

오라클을 설정하는 방법은 크게 3가지로 나눌 수 있다.

### 즉시 읽기
* 즉각적인 결정에만 필요한 데이터를 제공
* 효율성 또는 개인 정보보호상의 이유로 오라클에 의해 저장 된 데이터는 오라클이 처리하는 원시 데이터가 아닐 가능성이 높다.
* 예 : 도메인의 IP주소를 알려주는 오라클, 술 판매 시 고객의 나이 확인을 위한 오라클, 대학 졸업생의 학업 성취 증명을 위한 오라클
* 변경되지 않는 정보를 저장해 놓고 읽기만 하는 방식

### publish - subscribe
* 정기적으로 또는 자주 변경 될 것으로 예상되는 데이터에 대한 브로드캐스트 서비스를 효과적으로 제공 오라클
* 업데이트를 위해 온 체인 폴링 또는 오프 체인 데몬을 사용한다.
* 폴링은 웹 서버 세계에서는 매우 비효율적이지만, 블록체인 P2P 세계에서는 그렇지 않다. 오라클 업데이트를 위해서는 트랜잭션을 발생시키게 되고, 해당 트랜잭션이 블록에 포함되었다면 모든 노드들이 해당 내용을 자신의 노드에 기록하게 된다. 그러면 폴링을 서버를 폴링하는 것이 아니라 로컬을 폴링하는 것이다.
* 이더리움 이벤트 로그를 사용하면 응용 프로그램에서 오라클 업데이트를 확인할 수 있기 때문에 어떤 면에서는 푸시 서비스로 볼 수도 있다.
* 온 체인에서 폴링을 수행하게 되면 과도한 가스비가 발생할 수 있다.
* 예 : 가격 정보, 기상 정보, 경제 또는 사회 통계, 교통 정보 등
* 자주 변경되는 데이터를 한 곳만 수정하고 필요한 사람들이 알아서 폴링하고 있다가 사용하는 방식

### request - response
* 데이터 공간이 너무 커서 스마트 컨트랙트에 저장할 수 없으며, 사용자는 한 번에 전체 데이터 중 일부만 필요한 경우
* 실제로 오라클은 요청을 모니터링하고 데이터를 검색 및 반환하는데 사용되는 온체인 스마트 컨트랙트와 오프체인 인프라 시스템으로 구현 될 수 있다.

1. dApp으로부터 쿼리를 받는다.
2. 쿼리를 파싱한다.
3. 지불 및 데이터 액세스 권한이 제공되는지 확인한다.
4. 오프 체인 소스에서 관련 데이터를 검색한다. (필요한 경우 암호화)
5. 데이터가 포함 된 거래에 서명한다.
6. 트랜잭션을 네트워크로 브로드 캐스트한다.
7. 알림 등 필요한 추가 트랜잭션을 스케줄링한다.

* 큰 데이터의 일부만 사용하며, 각 개별 요청에 맞춰 요청자에게 응답을 제공하는 방식

## 데이터 인증
* 데이터 소스는 신뢰할 수 있다지만, 그 데이터를 온 체인으로 올리는 주체는 어떻게 믿어야 하는가?
* 전송 중에 데이터가 변조 될 수 있는 가능성이 있기 때문에, 변조되지 않았다는 무결성을 증명해야 한다.
* 증명하는 방식은 2가지로 볼 수 있다. 진위성 증명, 신뢰할 수 있는 실행 환경(TEE - Trusted Execution Environments)

### 진위성 증명
* 진위성 증명은 변조되지 않았다는 것을 암호학적으로 보장한다.
* [oraclize](http://www.oraclize.it/)는 다양한 진위성 증명을 활용하는 예이고, TLSNotary 증명이 그 중 하나이다.
* TLSNotary 증명을 사용하는 클라이언트는 클라이언트 서버 간에 HTTPS 웹 트래픽이 발생했다는 증거를 제 3자에게 제공할 수 있다.

![TLSNotary](https://cdn-images-1.medium.com/max/1600/0*5qiPf50N-wSYXZa9.png)

* 이 과정에는 세 종류의 참여자가 있다. 서버(oracle), 감시 대상자(oraclize), 감시관(AWS instance)
* AWS instance는 TLSNotary secret를 저장하고 있어 진위성 증명을 제공하며, 인스턴스화 이후에 수정되지 않았다는 것이 검증될 수 있다.
* oraclize가 아니라 AWS가 instance를 변경할 경우에는 수정 내역을 검증할 수 없으므로 문제가 될 수 있다.

### 신뢰할 수 있는 실행 환경(TEE)
* [Town Crier](http://www.town-crier.org/)는 데이터 무결성을 위해 하드웨어 기반의 보안 영역을 사용한다.
* Intel의 Software Guard eXtensions(SGX)를 사용하여 HTTPS 쿼리의 진위성을 검증할 수 있다.

## 계산 오라클
* 오라클은 데이터의 요청 및 응답에만 사용되는 것 뿐만 아니라, 블록 가스 한도를 초과하는 계산 작업에도 사용할 수 있다.
* 예 : 계산 집약적인 회귀 계산을 수행하여 채권 계약의 수익률을 추정
* Microsoft에서는 [Cryptlet](https://github.com/Azure/azure-blockchain-projects/blob/master/bletchley/CryptletsDeepDive.md)이라는 것을 제공하고 있다.

* Cryptlet 샘플 코드
```
public class SampleContractCryptlet : Cryptlet
  {
        public SampleContractCryptlet(Guid id, Guid bindingId, string name,
            string address, IContainerServices hostContainer, bool contract)
            : base(id, bindingId, name, address, hostContainer, contract)
        {
            MessageApi = new CryptletMessageApi(GetType().FullName,
                new SampleContractConstructor())
```

### [TrueBit](https://truebit.io/)
* 보다 탈중앙화 된 솔루션으로 확장성과 검증 가능한 오프 체인 계산을 위한 솔루션을 제공한다.
* 계산과 계산에 대한 검증을 통해서 인센티브를 얻는 solver와 verifier가 시스템을 유지한다.
* 계산을 매우 작게 나눠서 검증 게임을 진행한다. 최종 라운드에는 마이너가 쉽게 검증할 수 있게 하여 최종 결정을 하게 한다.
* 기계학습에서부터 작업 증명에 이르기까지 다양한 응용 프로그램이 있다.
* Doge-Ethereum 브릿지가 있는데, DogeCoin의 작업 증명을 검증하기 위해 TrueBit를 사용한다. 이를 통해서 Ethereum Rinkeby 테스트 네트워크에서 스마트 컨트랙트를 통해서 DogeCoin의 트랜잭션을 안전하게 확인할 수 있다.

## 탈중앙화 된 오라클
* 많은 응용 프로그램에서 중앙화 된 데이터 또는 계산 오라클로 충분하지만, Ethereum 네트워크에서는 단일 장애점(Single Point of Failure)이 생긴다.

### [ChainLink](https://www.smartcontract.com/link)
* ChainLink는 3가지의 주요 컨트랙트(평판 컨트랙트, 주문-매칭 컨트랙트, 집계 컨트랙트)와 데이터 공급자(오라클)의 오프체인 레지스트리로 구성 된 탈중앙화 된 오라클을 제안했다.
* 평판 컨트랙트 : 데이터 제공 업체의 성과를 추적. 성과에 대한 점수는 오프체인 레지스트리를 선정하는데 사용된다.
* 주문-매칭 컨트랙트 : 평판 컨트랙트를 사용하여 oracle로 부터 입찰가를 선택한다. 쿼리 매개 변수와 필요한 오라클 수를 포함하는 서비스 수준 계약을 완료한다.
* 집계 컨트랙트 : 여러 오라클로부터 응답을 수집하고 쿼리의 최종 집합 결과를 계산한 결과를 평판 컨트랙트에게 돌려 보낸다.
* 구매자는 개별 오라클과 직접 거래 할 필요가 없다.
* 이러한 탈중앙화 된 방식의 주요 문제점 중 하나는 집계 함수의 공식화이다. ChainLink는 각 오라클 응답에 대해 유효성 점수가 보고되도록 가중치 응답을 계산할 것을 제안한다.
* 다른 예로 SchellingCoin 프로토콜은 여러 참가자가 값을 보고하고 중간 값을 올바른 대답으로 취한다.

## Solidity용 오라클 클라이언트 인터페이스
### Oraclize

* Oraclize를 이용해서 외부 소스(크라켄 거래소)에서 ETH/USD 환율을 업데이트한다.

```
/*
   Kraken-based ETH/XBT price ticker
   This contract keeps in storage an updated ETH/XBT price,
   which is updated every ~60 seconds.
*/
pragma solidity ^0.4.0;

import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";


contract KrakenPriceTicker is usingOraclize {

    string public priceETHUSD;

    event NewOraclizeQuery(string description);
    event NewKrakenPriceTicker(string price);

    function KrakenPriceTicker() public {
        oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
        update();
    }

    function __callback(bytes32 myid, string result, bytes proof) public {
        if (msg.sender != oraclize_cbAddress()) revert();
        priceETHUSD = result;
        NewKrakenPriceTicker(priceETHUSD);
        update();
    }

    function update() public payable {
        if (oraclize_getPrice("URL") > this.balance) {
            NewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            NewOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            oraclize_query(60, "URL", "json(https://api.kraken.com/0/public/Ticker?pair=ETHUSD).result.XETHZUSD.c.0");
        }
    }
}
```

* Oraclize를 사용하기 위해서는 usingOraclize를 상속 받아서 컨트랙트를 작성해야 한다.

1. oraclize_query를 이용해서 쿼리에 대한 데이터를 요청한다.
2. 요청은 __callback 함수를 통해서 전달되며, 원하는 동작을 하도록 구현한다.

* [Oraclize 튜토리얼](https://medium.com/day34/solidity-oraclize-%ED%8A%9C%ED%86%A0%EB%A6%AC%EC%96%BC-2691efcee9a2)


### [BlockOne IQ](https://blockoneiq.thomsonreuters.com/)
* 재무 데이터 제공 업체인 Thomson Reuters에서 제공하는 재무 관련 오라클 서비스 (이용해 보려 했으나 현재 불가능 한 듯)


```
pragma solidity ^0.4.11;

contract Oracle {
    uint256 public divisor;
    function initRequest(
       uint256 queryType, function(uint256) external onSuccess,
       function(uint256
    ) external onFailure) public returns (uint256 id);
    function addArgumentToRequestUint(uint256 id, bytes32 name, uint256 arg) public;
    function addArgumentToRequestString(uint256 id, bytes32 name, bytes32 arg)
        public;
    function executeRequest(uint256 id) public;
    function getResponseUint(uint256 id, bytes32 name) public constant
        returns(uint256);
    function getResponseString(uint256 id, bytes32 name) public constant
        returns(bytes32);
    function getResponseError(uint256 id) public constant returns(bytes32);
    function deleteResponse(uint256 id) public constant;
}

contract OracleB1IQClient {

    Oracle private oracle;
    event LogError(bytes32 description);

    function OracleB1IQClient(address addr) public payable {
        oracle = Oracle(addr);
        getIntraday("IBM", now);
    }

    function getIntraday(bytes32 ric, uint256 timestamp) public {
        uint256 id = oracle.initRequest(0, this.handleSuccess, this.handleFailure);
        oracle.addArgumentToRequestString(id, "symbol", ric);
        oracle.addArgumentToRequestUint(id, "timestamp", timestamp);
        oracle.executeRequest(id);
    }

    function handleSuccess(uint256 id) public {
        assert(msg.sender == address(oracle));
        bytes32 ric = oracle.getResponseString(id, "symbol");
        uint256 open = oracle.getResponseUint(id, "open");
        uint256 high = oracle.getResponseUint(id, "high");
        uint256 low = oracle.getResponseUint(id, "low");
        uint256 close = oracle.getResponseUint(id, "close");
        uint256 bid = oracle.getResponseUint(id, "bid");
        uint256 ask = oracle.getResponseUint(id, "ask");
        uint256 timestamp = oracle.getResponseUint(id, "timestamp");
        oracle.deleteResponse(id);
        // Do something with the price data
    }

    function handleFailure(uint256 id) public {
        assert(msg.sender == address(oracle));
        bytes32 error = oracle.getResponseError(id);
        oracle.deleteResponse(id);
        emit LogError(error);
    }

}
```

* Oracle 이라는 컨트랙트 구현체는 공개가 되어 있지 않고, 인터페이스만 제공하는 듯

1. initRequest 함수에 쿼리 유형, 성공, 실패 시의 callback 함수를 지정한다.
2. addArgumentToRequestString, addArgumentToRequestUint로 매개변수를 지정한다.
3. executeRequest를 실행해서 요청한다.
4. 성공, 실패에 따라 해당 callback 함수로 가서 원하는 작업을 수행한다.


## 결론

* 보다시피 오라클은 스마트 컨트랙트에 중요한 서비스를 제공한다. 컨트랙트 실행을 위한 외부 사실을 가져온다.
* 물론 오라클이 심각한 문제를 일으킬 수 있는데, 오라클 서비스를 제공하는 주체가 직접 데이터 소스를 제공할 때이다.
* 신뢰 기반의 오라클을 사용할 때에는 매우 조심해야 한다. 오라클에서 잘못 된 입력을 전달할 경우 문제가 발생할 수 있으니, 스마트 컨트랙트 코드 보안에도 신경써야 한다.
* 무신뢰 기반의 오라클은 이러한 우려 사항 중 일부를 해결할 수 있으며, 신뢰가 필요 없는 외부 데이터 제공이 가능합니다.