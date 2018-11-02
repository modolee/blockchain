# Puppeth를 이용해 AWS에 Private Ethereum Network 구성하기 (PoA)

---

geth(go-ethereum)을 이용해서 프라이빗 이더리움 네트워크를 구축하는 방법은 크게 두 가지가 있다.
* 직접 각각의 서버에 geth를 설치하고 bootnode, sealernode 설정들을 다 해주는 것이다.
* geth에 포함되어 있는 puppeth라는 툴을 이용해서 미리 설정 된 docker 설정을 통해서 서버에 docker를 올리기만 하면 되는 것이다.

첫 번째 방법은 1대의 서버(또는 개인PC)를 이용해서 여러 노드를 띄워서 구성해 볼 수 있지만, 두 번째 방법은 리모트 서버에 배포하는 방식으로만 구성할 수 있다. (혹시나 로컬에서 할 수 있는 방법을 알고 계시면 알려주세요.)

로컬에 매뉴얼하게 구성하는 방식은 귀찮긴 하지만 많이 어려운 부분이 없어서, 이번에는 puppeth를 이용해서 AWS EC2 인스턴스에 프라이빗 네트워크 구성에 필요한 요소들을 배포하는 방법을 알아보도록 한다.

---

## 사전 준비
* AWS 유료 계정
* AWS 접속을 위한 .pem 키 파일

---


## 참고자료
* [Using puppeth To Manually Create An Ethereum Proof Of Authority (Clique) Network On AWS](https://medium.com/@collin.cusce/using-puppeth-to-manually-create-an-ethereum-proof-of-authority-clique-network-on-aws-ae0d7c906cce)
* [AWS와 Puppeth를 활용한 Ethereum Private Blockchain (POA) 구축하기](https://steemit.com/ethereum/@dlgusdn616/aws-puppeth-ethereum-private-blockchain-poa)
