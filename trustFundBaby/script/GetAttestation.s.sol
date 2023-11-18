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

import {
    ISchemaRegistry,
    SchemaRecord
} from "../src/ISchemaRegistry.sol";

contract GetAttestation is Script {
    function run() external {
        // vm.startBroadcast();
        
        bytes32 uid = 0xdd1ba51844b60276294490c24d3d272625c68868dba835ac9602c65a26149791;
        IEAS eas = IEAS(address(0x4200000000000000000000000000000000000021));
        Attestation memory att = eas.getAttestation(uid);
        console2.log("Attestation: %s", string(abi.encodePacked(att.uid)));
        console2.log("Attestation ts: %s", att.time);

        ISchemaRegistry registry = ISchemaRegistry(address(0x4200000000000000000000000000000000000020));
        bytes32 suid = 0xbe92c980d4766a5d83d746cfec0b5eccc79f925e42d9215159f10c34ac6825fa;
        SchemaRecord memory schema = registry.getSchema(suid);
        console2.log("Schema: %s", string(abi.encodePacked(schema.uid)));

        console2.log("TEST: %s", bytes32ToString(schema.uid));
        console2.log("TEST revocable: %s", (schema.revocable));

        // vm.stopBroadcast();
        return;
    }


    function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
    // Temporary memory buffer
    bytes memory buffer = new bytes(32);
    uint256 charCount = 0;

    // Copy only non-zero bytes
    for (uint256 i = 0; i < 32; i++) {
        if (_bytes32[i] != 0) {
            buffer[charCount] = _bytes32[i];
            charCount++;
        } else {
            break;
        }
    }

    bytes memory bytesBuffer = new bytes(charCount);
    for (uint256 i = 0; i < charCount; i++) {
        bytesBuffer[i] = buffer[i];
    }

    return string(bytesBuffer);
}


}

