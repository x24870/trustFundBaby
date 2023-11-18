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
        bytes32 schemaUID = 0xbe92c980d4766a5d83d746cfec0b5eccc79f925e42d9215159f10c34ac6825fa;
        WalletFactory factory = new WalletFactory(eas, schemaUID);
        return address(factory);
    }


}