// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Wallet.sol";

contract WalletFactory {
    address public eas;
    bytes32 public schemaUID;
    // Array to keep track of all created wallets
    Wallet[] public wallets;

    // Event for logging wallet creation
    event WalletCreated(address walletAddress, address owner);

    constructor(address _eas, bytes32 _schemaUID) {
        eas = _eas;
        schemaUID = _schemaUID;
    }

    // Function to create a new wallet
    function createWallet() public returns (address) {
        Wallet wallet = new Wallet(msg.sender, eas, schemaUID);
        wallets.push(wallet);
        emit WalletCreated(address(wallet), msg.sender);
        return address(wallet);
    }

    // Function to get the total number of wallets created
    function getWalletCount() public view returns (uint) {
        return wallets.length;
    }
}
