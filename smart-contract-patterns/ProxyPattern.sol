// Motivation: 
//  loose coupling -> support upgradeability, interface segregation and modularity
//  changing addresses -> references an existing contract points to

// Classic appraoch: 
//  via a list of contracts you want to change, a method that can do the change, run an expensive transaction to make that change happen

// Via a proxy:
//  Create proxy contracts that keep addresses
//  The contracts that shall use the addresses (e.g. of the owner) add a new property with the address of the proxy contract
//  This allows an additional level of separation of concerns