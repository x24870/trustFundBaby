// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Wallet.sol";

contract WalletFactory {
    address public eas;
    // Array to keep track of all created wallets
    Wallet[] public wallets;

    // Event for logging wallet creation
    event WalletCreated(address walletAddress, address owner);

    constructor(address _eas) {
        eas = _eas;
    }

    // Function to create a new wallet
    function createWallet() public returns (address) {
        Wallet wallet = new Wallet(msg.sender, eas);
        wallets.push(wallet);
        emit WalletCreated(address(wallet), msg.sender);
        return address(wallet);
    }

    // Function to get the total number of wallets created
    function getWalletCount() public view returns (uint) {
        return wallets.length;
    }
}
