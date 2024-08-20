IU2141230190

BLOCKCHAIN

Explanation (README.md)

Lottery System Smart Contract


▶Overview
The Lottery smart contract is a simple decentralized lottery system deployed on the Ethereum blockchain. The contract allows participants to enter the lottery by sending Ether, and a manager can pick a winner to receive the entire balance of the contract.


▶Features

→ Manager Control: Only the manager (the contract creator) can pick a winner.
→ Player Participation: Anyone can participate by sending a fixed amount of Ether.
→ Random Winner Selection: A winner is selected based on a pseudo-random number generated using block properties and hash.


▶Contract Functions

→ Constructor (constructor)
Initializes the contract, setting the manager variable to the address that deploys the contract.

→ Enter (enter)
Allows users to enter the lottery by sending exactly 0.01 ETH. If the amount sent is not 0.01 ETH, the transaction will revert.
Adds the sender's address to the players array.

→ Random (random)
A private function that generates a pseudo-random number using keccak256 hash function.
The randomness is based on the hash of the previous block, the current block timestamp, and the list of players.

→ Pick Winner (pickWinner)
Restricted to the manager using a modifier.
Selects a random winner from the players array and transfers the entire contract balance to this winner.
Resets the players array after selecting a winner by using the delete keyword.

→ Get Players (getPlayers)
Public view function that returns the list of current players in the lottery.


▶Modifiers
– Restricted (restricted)
Ensures that only the manager can call certain functions. This modifier checks if the sender of the transaction (msg.sender) is the manager.


▶Security Considerations

→ Randomness: The random function uses blockhash and other block properties for generating a pseudo-random number. This method is not secure against 
manipulation. For production environments, consider using a more secure randomness source such as Chainlink VRF.

→ Ether Amount: The fixed entry amount (0.01 ETH) is hardcoded. Adjust this value as needed based on the desired lottery size.

▶Deployment
–To deploy this contract, use a development environment like Remix, Truffle, or Hardhat.


▶Example Usage

→Deploy the contract.
– Enter the lottery by sending 0.01 ETH to the enter function.
– Pick a winner by calling the pickWinner function from the manager's address.
– Check players at any time using the getPlayers function.
– This contract serves as a basic template for a lottery system on Ethereum. For real-world applications, further enhancements and security considerations should be made.
