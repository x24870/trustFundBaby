// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {console2} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";
// prettier-ignore
import {
    Attestation,
    AttestationRequest,
    AttestationRequestData,
    DelegatedAttestationRequest,
    DelegatedRevocationRequest,
    IEAS,
    MultiAttestationRequest,
    MultiDelegatedAttestationRequest,
    MultiDelegatedRevocationRequest,
    MultiRevocationRequest,
    RevocationRequest,
    RevocationRequestData
} from "../src/IEAS.sol";

contract GetAttestation is Script {
    function run() external {
        vm.startBroadcast();
        bytes32 uid = 0xdd1ba51844b60276294490c24d3d272625c68868dba835ac9602c65a26149791;
        Attestation att = getAttestation();
        console2.log("Attestation: %s", att);
        vm.stopBroadcast();
        return wallet;
    }

    function getAttestation(bytes32 uid) external view returns (Attestation memory) {
        return _db[uid];
    }
}