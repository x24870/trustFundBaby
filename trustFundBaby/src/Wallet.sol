// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    address public owner;
    mapping(address => uint) public balances;
    mapping(address => uint) public nonces;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _owner) {
        owner = _owner;
    }

    function deposit(uint _nonce) public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        require(nonces[msg.sender] == _nonce, "Incorrect nonce");
        balances[msg.sender] += msg.value;
        nonces[msg.sender]++;
    }

    function withdraw(uint _amount, uint _nonce) public onlyOwner {
        require(balances[owner] >= _amount, "Insufficient balance");
        require(nonces[owner] == _nonce, "Incorrect nonce");
        payable(owner).transfer(_amount);
        balances[owner] -= _amount;
        nonces[owner]++;
    }

    function getBalance() public view returns (uint) {
        return balances[owner];
    }

    // Function to interact with other contracts
    function executeTransaction(address _to, uint _value, bytes memory _data, uint _nonce) public onlyOwner {
        require(nonces[owner] == _nonce, "Incorrect nonce");
        nonces[owner]++;
        (bool success, ) = _to.call{value: _value}(_data);
        require(success, "Transaction failed");
    }
}
