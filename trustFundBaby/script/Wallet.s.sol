// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {console2} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";
import {WalletFactory} from "../src/WalletFactory.sol";

contract CreateWallet is Script {
    WalletFactory factory;

    function run() external returns (address) {
        vm.startBroadcast();
        factory = WalletFactory(address(0x5FbDB2315678afecb367f032d93F642f64180aa3));
        address wallet = factory.createWallet();
        console2.log("Wallet created at address: %s", wallet);
        vm.stopBroadcast();
        return wallet;
    }
}