// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    struct Person {
        string name;
        int256 number;
    }
    int256 myFavouriteNumber;

    Person [] listOfPeople;

    mapping (string => int256) public nameToFavouriteNumber;

    function store (int256 _favouritenumber) public {
        myFavouriteNumber = _favouritenumber;
    }

    function retrieve () public view returns (int256) {
        return myFavouriteNumber;
    }

    function addPerson (string memory _name, int256 _number) public {
        listOfPeople.push (Person(_name, _number));
        nameToFavouriteNumber [_name] = _number;
    }
}
