## Motivation
*   Not all contracts should be instantiated from an external transaction
*   This makes sense when a contract shall be created not only once (no Singleton)

## Introduce the Factory Pattern
*   Contracts therefore create new instances of a given contract
*   There are multiple options to do so e.g.
    *   Define a contract in this file or import existing contract
    *   Provide ABI and binary code of a contract

![Factory Pattern](https://github.com/BlockchainRepos/ethereum-smart-contracts/blob/master/resources/FactoryPattern.png)