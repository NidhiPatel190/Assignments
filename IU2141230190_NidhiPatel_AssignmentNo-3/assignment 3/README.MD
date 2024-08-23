IU2141230190

BLOCKCHAIN

■ Lottery Smart Contract

□ Overview

This is a simple Ethereum lottery smart contract written in Solidity. The contract allows users to enter a lottery by sending a minimum amount of Ether, with the contract manager being able to pick a random winner who will receive the entire balance of the contract.

□ Features

- Manager Role: The address that deploys the contract is designated as the manager and has exclusive rights to pick the winner.

- Player Entry: Users can participate in the lottery by sending at least 1 Ether to the contract.

- Winner Selection: The contract uses a pseudo-random number generator to select a winner from the pool of participants.

- Resetting Players: After picking a winner, the list of players is cleared for a new lottery round.
Check Players: Users can view the list of participants in the lottery.
Requirements

- Solidity version: >=0.7.0 <0.9.0
Ethereum client or testnet for deployment and interaction.
Contract Details

□ Variables

- address public manager: Stores the address of the manager (deployer).
address payable[] public players: Array of addresses representing the players who have entered the lottery.
Functions

□ Constructor

- constructor(): Initializes the contract with the deployer's address as the manager.
Entry Function

- function enter() payable public: Allows users to enter the lottery. Requires:
Sender is not the manager.
Sender has not already entered.
A minimum amount of 1 Ether is sent.
Winner Selection

- function pickWinner() public: Picks a random winner and transfers the contract balance to them. Only callable by the manager.
Utility Functions

- function alreadyEntered() view private returns(bool): Checks if the caller has already entered the lottery.

- function random() view private returns(uint): Generates a pseudo-random number based on block data and player addresses.

- function getPlayers() view public returns(address payable[] memory): Returns the current list of players.
Deployment and Usage

• Deploy the Contract: Deploy the Lottery contract using an Ethereum development environment (e.g., Remix, Truffle, Hardhat).

- Enter the Lottery: Send at least 1 Ether to the contract address using the enter function.

- Pick a Winner: The manager can call pickWinner to select a random winner and transfer the prize.

- View Participants: Call getPlayers to view the list of participants.
Security Considerations

The pseudo-random number generator is not truly random and may not be secure for high-stakes lotteries. For better randomness, consider integrating a secure randomness source like Chainlink VRF.
Ensure to handle gas costs and transaction limits appropriately to avoid failures during execution.
License

