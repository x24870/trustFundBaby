// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {console2} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";

import {Wallet} from "../src/Wallet.sol";

contract TransferOwnership is Script {
    function run() external {
        vm.startBroadcast();
        
        // bytes32 uid = 0xd096cd12fe7584018409d33d476ec130ae78366b98f86d42576ff52e52e5e65d;
        bytes32 uid = 0x1d15a1d8103426ea851cf68415cf0d5ff3d8ab402fa9bdf9eb668056e53914b0;
        Wallet wallet = Wallet(payable(address(0xf3627C77B2D04Df5C6D0ECd6db86Fb32f961dDBf)));
        wallet.transferOwnership(uid);

        vm.stopBroadcast();
        return;
    }
}

