# AnonAA

*This project is built at the ETHGlobal Istanbul hackathon.  

## Overview


## Problems & Solutions

## Technologies

- [EAS](https://attest.sh/), ethereum attestation service

### Inspiration & Credit

## Deployed Contracts

Here is the list of the Wallet Factory contract addresses deployed on each network.

| Chain           | Address                                    |
| --------------- | ------------------------------------------ |
| Optimism Goerli | 0xBe53e82C30A90fcb20fB3b08ae0B0F9a2E1c64d3 |
| Arbitrum Goerli | 0xCd3933B359A73DEBbDcfd0E6C3a6BB36f114E187 |
| Base Goerli     | 0x2A6120978D3F868299AA020303b93B9a90f257CF |
| Scroll sepolia  | 0xCd3933B359A73DEBbDcfd0E6C3a6BB36f114E187 |
| Linea Goerli    | 0xCd3933B359A73DEBbDcfd0E6C3a6BB36f114E187 |

## Deployments

##### get into contract folder
```shell
cd trustFundBaby
```

##### compile

```shell
forge compile
```

##### deploy Wallet Factory

```shell
$ make deployFactoryArb
```

##### Deploy Wallet
##### NOTE: please create the attestation and deploy wallet factory before deploy wallet
#####       also update the schema uid and wallet factory address in script/TransferOwnership.s.sol

```shell
$ make deployWalletArb
```