// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Number {
    uint32 public VAT = 100;

    mapping (address => uint256) acct;
    mapping (address => uint256) vatPayment;

    function getVATvalue() public view returns(uint32) {
        return VAT;
    }

    function addAmount(uint256 _num) public returns (bool) {
        require(_num > VAT, "Not enough");

        uint res = _num - VAT;

        vatPayment[msg.sender]+= VAT;

        acct[msg.sender] += res;

        return true;
    }

    function getUserBalance() public view returns (uint256) {
        return acct[msg.sender];
    }

}

