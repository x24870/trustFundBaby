// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import {console2} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";
import {WalletFactory} from "../src/WalletFactory.sol";

contract CreateWallet is Script {
    WalletFactory factory;

    function run() external returns (address) {
        vm.startBroadcast();
        bytes32 schemaUID = 0xbe92c980d4766a5d83d746cfec0b5eccc79f925e42d9215159f10c34ac6825fa;
        factory = WalletFactory(address(0xe2391eB61C96e8ff5570262606242716a3992783));
        address wallet = factory.createWallet();
        // console2.log("Wallet created at address: %s", wallet);
        vm.stopBroadcast();
        return wallet;
    }
}