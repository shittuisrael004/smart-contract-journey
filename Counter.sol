// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Counter {

    // Stores the current counter value.
    uint count;

    // Stores the address of the contract deployer.
    // Used for access control on restricted functions.
    address owner;

    /// @notice Sets the initial counter value and assigns the deployer as the owner.
    /// @param _iniValue Initial value for the counter.
    constructor(uint _iniValue) {
        owner = msg.sender;
        count = _iniValue;
    }

    /// @notice Returns the current value of the counter.
    function getCount() external view returns (uint) {
        return count;
    }

    /// @notice Returns the address of the contract owner.
    function getOwner() external view returns (address) {
        return owner;
    }

    /// @notice Increments the counter by 1.
    function increment() public {
        count += 1;
    }

    /// @notice Increments the counter by a specified value.
    /// @param _value Amount to add to the counter.
    function incrementBy(uint _value) public {
        count += _value;
    }

    /// @dev Error raised when attempting to decrement while counter is zero.
    error CountAlreadyZero();

    /// @notice Decrements the counter by 1.
    /// @dev Reverts if the counter is already zero.
    function decrement() public {
        if (count == 0) revert CountAlreadyZero();
        count -= 1;
    }

    /// @notice Decrements the counter by a specified value.
    /// @param _value Amount to subtract from the counter.
    /// @dev Reverts if the value exceeds the current counter.
    function decrementBy(uint _value) public {
        require(count >= _value, "Decrease amount exceeds counter value");
        count -= _value;
    }

    /// @dev Error raised when a non-owner attempts to call an owner-only function.
    error NotOwner();

    /// @notice Resets the counter back to zero.
    /// @dev Only the owner can call this function.
    function reset() public {
        if (msg.sender != owner) revert NotOwner();
        count = 0;
    }
}
