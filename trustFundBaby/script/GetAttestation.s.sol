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
        
        bytes32 uid = 0xd096cd12fe7584018409d33d476ec130ae78366b98f86d42576ff52e52e5e65d;
        IEAS eas = IEAS(address(0x4200000000000000000000000000000000000021));
        Attestation memory att = eas.getAttestation(uid);
        console2.log("Attestation: %s", string(abi.encodePacked(att.uid)));
        console2.log("Attestation ts: %s", att.time);
        console2.log("Valid: %s", eas.isAttestationValid(uid));
        console2.log("data: %s", bytesToHexString(att.data));
        console2.log("addr: %s", bytes32ToAddress(bytes32(att.data)));
        
        console2.log("schema: %s", string(abi.encodePacked(att.schema)));
        console2.log("attester: %s", att.attester);

        ISchemaRegistry registry = ISchemaRegistry(address(0x4200000000000000000000000000000000000020));
        bytes32 suid = 0xbe92c980d4766a5d83d746cfec0b5eccc79f925e42d9215159f10c34ac6825fa;
        SchemaRecord memory schema = registry.getSchema(suid);
        console2.log("Schema: %s", string(abi.encodePacked(schema.uid)));

        console2.log("TEST revocable: %s", (schema.revocable));

        // vm.stopBroadcast();
        return;
    }


    // Function to convert a single byte to a hexadecimal string
    function byteToHexChar(bytes1 b) internal pure returns (string memory) {
        bytes memory hexChars = "0123456789abcdef";
        bytes memory hexString = new bytes(2);
        hexString[0] = hexChars[uint8(b) >> 4];
        hexString[1] = hexChars[uint8(b) & 0x0f];
        return string(hexString);
    }

    // Function to convert bytes to a hexadecimal string
    function bytesToHexString(bytes memory data) public pure returns (string memory) {
        string memory hexString = "";

        for (uint i = 0; i < data.length; i++) {
            hexString = string(abi.encodePacked(hexString, byteToHexChar(data[i])));
        }

        return hexString;
    }

    function bytes32ToAddress(bytes32 b) public pure returns (address) {
        return address(uint160(uint256(b)));
    }


}

