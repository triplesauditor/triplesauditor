// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library getEthPriceInUsd {

    function getprice () internal view returns (uint256) {
        AggregatorV3Interface pricefeed = AggregatorV3Interface (0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer,,,) = pricefeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    function ethToUsd (uint256 amount) internal view returns (uint256) {
        uint256 price = getprice();
        return uint256 ((amount * price / 1e18));
    }
}
