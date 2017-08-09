pragma solidity ^0.4.8;

contract SimpleStorage {
    uint storedData;

    function SimpleStorage() {
        //...
    }

    function set(uint x) {
        storedData = x;
    }

    function get() returns (uint) {
        return storedData;
    }
}