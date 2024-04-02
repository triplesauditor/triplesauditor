// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "contracts/simplestorage.sol";

contract StorageFactory {
    SimpleStorage public mySimpleStorage;

    function createSimpleStorage () public {
        mySimpleStorage = new SimpleStorage();
    }
}
