rm -rf ~/.bccli ~/.bcd/
bcd init validator --chain-id band-consumer

bccli keys add validator --keyring-backend test
bccli keys add user --keyring-backend test
bccli keys add faucet --keyring-backend test

bcd add-genesis-account validator 10000000000000stake,1000000producttoken --keyring-backend test
bcd add-genesis-account user 10000000000000stake,1000000producttoken --keyring-backend test
bcd add-genesis-account faucet 1000000000000000stake,1000000producttoken --keyring-backend test


bccli keys add jack --keyring-backend test
bccli keys add alice --keyring-backend test

bcd add-genesis-account jack 10000000000000stake,1000000producttoken --keyring-backend test
bcd add-genesis-account alice 10000000000000stake,1000000producttoken --keyring-backend test


bccli config chain-id band-consumer
bccli config output json
bccli config indent true
bccli config trust-node true
bccli config keyring-backend test

bcd gentx --name validator --keyring-backend test
bcd collect-gentxs

bcd start --rpc.laddr=tcp://0.0.0.0:26657 --pruning=nothing
