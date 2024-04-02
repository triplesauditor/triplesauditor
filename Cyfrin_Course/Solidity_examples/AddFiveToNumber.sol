// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "contracts/simplestorage.sol";

contract AddFiveToNumber is SimpleStorage {
    function store (int256 _newNumber) public override {
        myFavouriteNumber = _newNumber + 5;
    }
}
