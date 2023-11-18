// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import {console2} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";
import {WalletFactory} from "../src/WalletFactory.sol";

contract DeployWalletFactory is Script {
    function run() external returns (address) {
        vm.startBroadcast();
        address factory = deployWalletFactory();
        vm.stopBroadcast();
        return factory;
    }

    function deployWalletFactory() public returns (address) {
        address eas = address(0x4200000000000000000000000000000000000021);
        WalletFactory factory = new WalletFactory(eas);
        return address(factory);
    }


}