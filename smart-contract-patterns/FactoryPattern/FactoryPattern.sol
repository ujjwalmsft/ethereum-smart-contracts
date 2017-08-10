pragma solidity 0.4.9;

contract FactoryPattern {
    // Documentation of a contract
    /** @title Implement factory pattern
      * @author Dr. Dolittle
      */
    
    /** @dev Create a new instance of a contract
      */
    function createContractOpt1 (bytes32 name) {
        // create contract
        address newContractAddress = new ReturnValue(name);
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
