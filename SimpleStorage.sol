// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19 <0.9.0;

// when deployed it gets it own address on the EVM
contract SimpleStorage{

    // this is an unsigned integer state variable that is stored in the database slot of the contract address
    uint storedData;

    // this function sets the storedData to any integer data it is given
    function set(uint data) public{
        storedData = data;
    }

    // this function returns the value of the data in storedData
    function get() public view returns (uint){
        return storedData;
    }

}
