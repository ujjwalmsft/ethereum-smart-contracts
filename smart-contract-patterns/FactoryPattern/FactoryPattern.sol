pragma solidity 0.4.9;

contract FactoryPattern {
    // Documentation of a contract
    /** @title Implement factory pattern
      * @author Dr. Dolittle
      */

    address[] contractsAddressesOpt1;
    address[] contractsAddressesOpt2;

    bytes32 contractABI = "[{"constant":false,"inputs":[],"name":"returnValue","outputs":[{"name":"","type":"bytes32"}],"payable":false,"type":"function"}]";
    bytes32 contractByteCode = "6060604052341561000f57600080fd5b5b60c58061001e6000396000f30060606040526000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063990c8f7914603d575b600080fd5b3415604757600080fd5b604d606b565b60405180826000191660001916815260200191505060405180910390f35b6000807f5468652072657475726e2076616c75652100000000000000000000000000000090508091505b50905600a165627a7a7230582085a0e848cf9ce5844a1091a3728ce39561618f3c28ea801a589863550bf189f00029";
    
    /*************************************************************/
    // Option 1: define a contract in this file or import existing contract
    /*************************************************************/
    /** @dev Create a new instance of a contract
      * @param name name of the contract
      */
    function createContractOpt1 (bytes32 name) {
        // create contract
        address newContractAddress = new ReturnValue(name);
        // store address in an array
        contractsAddressesOpt1.push(newContractAddress);
    }

    /*************************************************************/
    // Option 2: provide ABI and binary code of a contract
    /*************************************************************/
    /** @dev Create a new instance of a contract
      * @param name name of the contract
      */
    function createContractOpt2 (bytes32 name) {
        // create contract
        address newContractAddress = new SelfDestruct(name);
        // store address in an array
        contractsAddressesOpt2.push(newContractAddress);
    }

    /** @dev Update the code of the contract to instantiated
      * @param contractABINew   Updated ABI
      * @param contractByteCodeNew   Updated byte code
      */
    function upgradeContract (bytes32 contractABINew, bytes32 contractByteCodeNew) {
        contractABI = contractABINew;
        contractByteCodeNew = contractByteCode;
    }
}

contract ReturnValue {
    /** @dev Returns a value
      */
    function returnValue () returns (bytes32) {
        bytes32 val = "The return value!";
        return val;
    }
}
