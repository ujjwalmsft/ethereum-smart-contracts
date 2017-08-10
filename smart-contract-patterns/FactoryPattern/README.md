## Motivation
*   Not all contracts should be instantiated from an external transaction
*   This makes sense when a contract shall be created not only once (no Singleton)

## Introduce the Factory Pattern
*   Contracts therefore create new instances of a given contract

![Factory Pattern](https://github.com/BlockchainRepos/ethereum-smart-contracts/blob/master/resources/FactoryPattern.PNG)
