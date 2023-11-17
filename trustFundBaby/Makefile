include .env
export $(shell sed 's/=.*//' .env)

deployFactory:
	forge script --rpc-url=${LOCALHOST} --private-key=${PRIVATE_KEY} script/WalletFactory.s.sol --broadcast --verify -vvvv;

deployWallet:
	forge script --rpc-url=${LOCALHOST} --private-key=${PRIVATE_KEY} script/Wallet.s.sol --broadcast --verify -vvvv;