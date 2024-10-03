// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface INumber {
    function getVATvalue() external view returns (uint256);
    function addValue() external returns (bool);
    function getUserBalance() external view returns (uint256);
}

contract Interaction {
    address numberContractAdress;

    constructor(address _contractAddress) {
        numberContractAdress = _contractAddress;
    }

    function getVAT() public view returns (uint256) {
        return INumber(numberContractAdress).getVATvalue();
    }

    function fund() public returns (bool) {
        return INumber(numberContractAdress).addValue();
    }

    function userBalance() public view returns (uint256) {
        return INumber(numberContractAdress).getUserBalance();
    }
}