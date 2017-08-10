## Motivation
*   Not all contracts should be instantiated from an external transaction
*   This makes sense when a contract shall be created not only once (no Singleton)

## Introduce the Factory Pattern
*   Contracts therefore create new instances of a given contract