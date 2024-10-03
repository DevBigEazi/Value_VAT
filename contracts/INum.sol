// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface INumber {
    function getVATvalue() external view returns (uint256);
    function addValue(uint, address) external returns (bool);
    function getUserBalance(address) external view returns (uint256);
}

contract Interaction {
    address numberContractAdress;

    constructor(address _contractAddress) {
        numberContractAdress = _contractAddress;
    }

    function getVAT() public view returns (uint256) {
        return INumber(numberContractAdress).getVATvalue();
    }

    function fund(uint _amount, address _addr) public returns (bool) {
        return INumber(numberContractAdress).addValue(_amount, _addr);
    }

    function userBalance(address _addr) public view returns (uint256) {
        return INumber(numberContractAdress).getUserBalance(_addr);
    }
}