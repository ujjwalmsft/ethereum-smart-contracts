## Motivation
*   You need to keep the contracts somewhere - e.g. on chain or off chain
*   Collections of contracts must be managed explicitely

## Introduce Registries
*   Registries store references to existing contracts
*   The references are kept inside of mappings or arrays
*   These registries are generally singletons
*   This allows us to support references and some cross contract behavior

![Registry Pattern](https://github.com/BlockchainRepos/ethereum-smart-contracts/blob/master/resources/RegistryPattern.png)