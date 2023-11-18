include .env
export $(shell sed 's/=.*//' .env)

SCROLL_SEPOLIA="https://scroll-sepolia.blockpi.network/v1/rpc/public"
deployFactoryScroll:
	forge script --rpc-url=${SCROLL_SEPOLIA} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/WalletFactory.s.sol --broadcast --verify -vvvv;
deployWalletScroll:
	forge script --rpc-url=${SCROLL_SEPOLIA} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/Wallet.s.sol --broadcast --verify -vvvv;

ARB_GOERLI="https://arbitrum-goerli.blockpi.network/v1/rpc/public"
deployFactoryArb:
	forge script --rpc-url=${ARB_GOERLI} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/WalletFactory.s.sol --broadcast --verify -vvvv;
deployWalletArb:
	forge script --rpc-url=${ARB_GOERLI} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/Wallet.s.sol --broadcast --verify -vvvv;

BASE_GOERLI="https://base-goerli.public.blastapi.io"
deployFactoryBase:
	forge script --rpc-url=${BASE_GOERLI} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/WalletFactory.s.sol --broadcast --verify -vvvv;
deployWalletBase:
	forge script --rpc-url=${BASE_GOERLI} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/Wallet.s.sol --broadcast --verify -vvvv;

LINEA_GOERLI="https://rpc.goerli.linea.build"
deployFactoryLinea:
	forge script --rpc-url=${LINEA_GOERLI} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/WalletFactory.s.sol --broadcast --verify -vvvv;
deployWalletLinea:
	forge script --rpc-url=${LINEA_GOERLI} --private-key=${GOERLI_PRIVATE_KEY} --legacy script/Wallet.s.sol --broadcast --verify -vvvv;



getAttestation:
	forge script --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} script/GetAttestation.s.sol --broadcast --verify -vvvv;

owner:
	cast call --rpc-url=${GOERLI} 0x1ADA6E5118ACdD74689Ea3bc1200039D1e29B3a5 "owner()(address)"

setTimePeriodLimit:
	cast send --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} 0xC41Cc24255e5F61cB84Fa541ab4cd95cF8e49483 "setTimePeriodLimit(uint256)" 5

transferOwnership:
	forge script --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} script/TransferOwnership.s.sol --broadcast --verify -vvvv;

withdraw:
	cast send --rpc-url=${GOERLI} --private-key=${GOERLI_PRIVATE_KEY} 0x1726Fff5d576A3185BBD56b1A1Df6AbD58383190 "withdraw(uint,uint)" 1 0