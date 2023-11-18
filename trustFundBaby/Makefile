include .env
export $(shell sed 's/=.*//' .env)

deployFactory:
	forge script --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} script/WalletFactory.s.sol --broadcast --verify -vvvv;

deployWallet:
	forge script --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} script/Wallet.s.sol --broadcast --verify -vvvv;

getAttestation:
	forge script --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} script/GetAttestation.s.sol --broadcast --verify -vvvv;

owner:
	cast call --rpc-url=${GOERLI} 0xf3627C77B2D04Df5C6D0ECd6db86Fb32f961dDBf "owner()(address)"

setTimePeriodLimit:
	cast send --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} 0xf3627C77B2D04Df5C6D0ECd6db86Fb32f961dDBf "setTimePeriodLimit(uint256)" 5

transferOwnership:
	forge script --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} script/TransferOwnership.s.sol --broadcast --verify -vvvv;