-include .env

.PHONY: build test deploy-manatoken deploy-mana deploy-local-mana deploy-local-manatoken clean install format

# Build all contracts
build:
	forge build

# Run all tests
test:
	forge test

# Deploy ManaToken to a local network (e.g., anvil)
deploy-local-manatoken:
	@forge script script/DeployManaToken.s.sol:DeployManaToken --fork-url http://127.0.0.1:8545 --broadcast --private-key $(LOCAL_PRIVATE_KEY) --legacy

# Deploy MANA to a local network (e.g., anvil)
deploy-local-mana:
	@forge script script/DeployMANA.s.sol:DeployMANA --fork-url http://127.0.0.1:8545 --broadcast --private-key $(LOCAL_PRIVATE_KEY) --legacy

# Deploy ManaToken to Aurora Testnet
deploy-manatoken:
	@forge script script/DeployManaToken.s.sol:DeployManaToken --rpc-url $(AURORA_TESTNET_RPC_URL) --broadcast --private-key $(PRIVATE_KEY) --legacy

# Deploy MANA to Aurora Testnet
deploy-mana:
	@forge script script/DeployMANA.s.sol:DeployMANA --rpc-url $(AURORA_TESTNET_RPC_URL) --broadcast --private-key $(PRIVATE_KEY) --legacy

# Clean build artifacts
clean:
	forge clean

# Install dependencies
install:
	forge install foundry-rs/forge-std

# Format Solidity files
format:
	forge fmt
