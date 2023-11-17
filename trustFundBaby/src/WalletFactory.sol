// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Wallet.sol";

contract WalletFactory {
    // Array to keep track of all created wallets
    Wallet[] public wallets;

    // Event for logging wallet creation
    event WalletCreated(address walletAddress, address owner);

    // Function to create a new wallet
    function createWallet() public {
        Wallet wallet = new Wallet(msg.sender);
        wallets.push(wallet);
        emit WalletCreated(address(wallet), msg.sender);
    }

    // Function to get the total number of wallets created
    function getWalletCount() public view returns (uint) {
        return wallets.length;
    }
}
