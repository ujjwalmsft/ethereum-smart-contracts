## Motivation: 
*   Loose coupling of contracts
*   Support upgradeability, interface segregation and modularity
*   Allow changing references an existing contract points to (addresses)

## Classic approac: 
*   Via a list of contracts you want to change, a method that can do the change, run an expensive transaction to make that change happen

## Introduce Proxy Pattern
*   Create proxy contracts that keep addresses
*   The contracts that shall use the addresses (e.g. of the owner) add a new property with the address of the proxy contract
*   This allows an additional level of separation of concerns