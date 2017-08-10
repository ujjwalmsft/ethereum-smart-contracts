pragma solidity 0.4.9;

contract SelfDestruct {
    // Documentation of a contract
    /** @title Self destruction of contracts
      * @author Dr. Dolittle
      * @dev Include a SelfDestruct function to destroy existing Smart Contracts. 
      * This is basically the only way to make them unavailable.
      * It clears all the contract's data, frees up space and send Ether stored in the contract to an address specified.
      */

    address owner;

    modifier onlyOwner () {
        if (msg.sender != owner) {
            // Cancels the state-changes in the current call but outputs data to the caller
            // Returns remaining gas
            revert();
        }
        _;
    }

    /** @dev Constructor
      */
    function SelfDestruct () {
        owner = msg.sender;
    }

    /** @dev Function to self destruct the contract
      * @param addressForRepay Address to send the remaining Ether to
      */
    function selfdestruct (address addressForRepay) onlyOwner {
        selfdestruct(addressForRepay);
    }

    /**@dev Function that is executed if there is not function that matches the name of the function called
      */
    function () {
        //...
    }
}
