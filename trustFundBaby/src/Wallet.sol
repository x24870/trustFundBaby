// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {
    IEAS,
    Attestation
} from "./EAS.sol";

contract Wallet {
    address public owner;
    uint public nonce; // Single nonce for the owner
    uint public lastTransactionTime; // Variable to store the timestamp of the last transaction
    uint public transactionTimeLimit; // User-defined time period limit
    IEAS eas;
    bytes32 schemaUID;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // Modifier to check if the last transaction was beyond the user-defined time period
    modifier lastTransactionBeyondLimit() {
        require(block.timestamp - lastTransactionTime > transactionTimeLimit, "Last transaction within the time limit");
        _;
    }

    constructor(address _owner, address _eas, bytes32 _schemaUID) {
        owner = _owner;
        transactionTimeLimit = 365 days; // Default to 1 year, can be changed by owner
        lastTransactionTime = block.timestamp; // Set the last transaction time to the current block timestamp
        eas = IEAS(_eas);
        schemaUID = _schemaUID;
    }

    // Function for owner to set the time period
    function setTimePeriodLimit(uint _timeLimit) public onlyOwner {
        transactionTimeLimit = _timeLimit;
    }

    // Function for depositing Ether into the wallet
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        lastTransactionTime = block.timestamp; // Update the last transaction time
    }

    // Function for the owner to withdraw Ether from the wallet
    function withdraw(uint _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient balance");
        payable(owner).transfer(_amount);
        lastTransactionTime = block.timestamp; // Update the last transaction time
    }

    // Function to check the balance of the wallet
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Function to interact with other contracts
    function executeTransaction(address _to, uint _value, bytes memory _data, uint _nonce) public onlyOwner {
        require(_nonce == nonce, "Incorrect nonce"); // Validate nonce
        nonce++; // Increment the nonce
        (bool success, ) = _to.call{value: _value}(_data);
        require(success, "Transaction failed");
        lastTransactionTime = block.timestamp;
    }


    // Function to transfer ownership if the last transaction is beyond the limit
    function transferOwnership(bytes32 attestUID) public lastTransactionBeyondLimit {
        // verify attestation
        require(eas.isAttestationValid(attestUID), "Attestation is not valid");
        Attestation memory att = eas.getAttestation(attestUID);
        require(att.attester == owner, "Attestation not from owner");
        // transfer ownership
        address newOwner = getTargetAddress(att);
        require(newOwner != address(0), "New owner cannot be the zero address");
        owner = newOwner;
    }

    // Helper function to get the target address from an attestation
    function getTargetAddress(Attestation memory att) internal returns (address) {
        // check schema UID
        require(att.schema == schemaUID, "Schema UID does not match");
        // parse attestation data
        return bytes32ToAddress(bytes32(att.data));
    }

    // Helper function to convert bytes32 to address
    function bytes32ToAddress(bytes32 b) private pure returns (address) {
        return address(uint160(uint256(b)));
    }

    // Receive function to handle receiving Ether with no data
    receive() external payable {}

    // Fallback function to handle receiving Ether with data
    fallback() external payable {}
}
