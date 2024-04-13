// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import "contracts/getpricelibrary.sol";

contract FundMe {
    uint256 public constant MINIMUM_FUND = 5 * 10 ** 18;
    using getEthPriceInUsd for uint256;
    mapping (address => uint256) DonorList;
    address [] public Donors;
    uint256 public totalBalance;
    address public Owner;
    uint256 public balance;

    constructor () {
        Owner = msg.sender;
    }

    function fund() public payable {
        require (msg.value.ethToUsd() > MINIMUM_FUND, "not enough fund");
        totalBalance += msg.value;
        DonorList [msg.sender] = msg.value;
        Donors . push (msg.sender);
    }

    modifier OnlyOwner () {
        require (msg.sender == Owner);
        _;
    }
    function withdraw() public payable OnlyOwner {
        for (uint256 i=0;i<Donors.length; i++) {
            DonorList [Donors[i]] = 0;
            totalBalance = 0;
        }
        Donors = new address [](0);
        balance = viewBalance();
        //(bool callSuccess, )= payable(Owner).call{value : address(this).balance}("");
        //require (callSuccess, "Withdraw failed");
        payable(Owner).transfer (address(this).balance);
    }

    function viewBalance() public view returns (uint256){
        return address(this).balance;
    }

    fallback() external payable { 
        fund();
    }

    receive() external payable { 
        fund();
    }
}
