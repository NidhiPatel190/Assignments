# IU2141230190

# BLOCKCHAIN

# Solidity Smart Contracts: Crowdfunding & Voting System

This repository contains two smart contracts written in Solidity: one for a **Crowdfunding Platform** and another for a **Voting System**. These contracts are designed to work with Solidity version `0.8.0` or later.

## 1. Crowdfunding Contract

### Overview
The Crowdfunding contract allows users to create and participate in crowdfunding campaigns. Campaign creators can set a target amount and deadline for their campaigns. Participants can contribute funds, and if the target amount is met before the deadline, the funds are released to the campaign creator. If the target isn't met, participants can withdraw their contributions.

### Features
- **Create Campaign**: Anyone can create a campaign with a target amount and deadline.
- **Contribute to Campaigns**: Users can contribute ETH to any active campaign.
- **Finalization**: After the deadline, the campaign creator can finalize the campaign, releasing the funds if the target is met.
- **Withdrawals**: If the target is not met, contributors can withdraw their funds.
- **Campaign Data**: Retrieve details of any campaign, such as the creator, target, deadline, total contributions, and whether it has been finalized.

### How to Use
1. **Deploy the Contract**: Use any Solidity-compatible environment (like Remix or Truffle) to deploy the contract.
2. **Create a Campaign**: Call `createCampaign(uint256 _targetAmount, uint256 _duration)` with a target amount in wei and a duration in seconds.
3. **Contribute to a Campaign**: Call `contribute(uint256 _campaignId)` and send ETH to contribute to an active campaign.
4. **Finalize Campaign**: The campaign creator can call `finalizeCampaign(uint256 _campaignId)` after the deadline to release funds or close the campaign.
5. **Withdraw Contributions**: If a campaign fails to reach its target, contributors can withdraw their funds by calling `withdrawFunds(uint256 _campaignId)`.

### Functions

#### `createCampaign(uint256 _targetAmount, uint256 _duration)`
- **Purpose**: Creates a new crowdfunding campaign with a specified target amount and duration.
- **Parameters**: 
  - `_targetAmount`: The amount of ETH (in wei) the campaign needs to raise.
  - `_duration`: The campaign’s duration (in seconds).
- **Functionality**: This function initializes a new campaign and sets its creator, target amount, deadline, and finalized state to false. It increments the `campaignCount` for each new campaign.
- **Events**: Emits `CampaignCreated`.

#### `contribute(uint256 _campaignId)` (Payable)
- **Purpose**: Allows users to contribute ETH to a campaign.
- **Parameters**: 
  - `_campaignId`: The ID of the campaign to which the contribution is made.
- **Functionality**: This function enables users to send ETH to a campaign. It verifies that the campaign is active and that the contribution amount is greater than zero. It tracks each contributor's contribution amount.
- **Events**: Emits `ContributionMade`.

#### `finalizeCampaign(uint256 _campaignId)`
- **Purpose**: Allows the campaign creator to finalize the campaign after its deadline.
- **Parameters**: 
  - `_campaignId`: The ID of the campaign to be finalized.
- **Functionality**: This function finalizes a campaign by checking if the target amount has been reached. If the target is met, the funds are transferred to the campaign creator. If not, contributors can withdraw their funds.
- **Events**: Emits `CampaignFinalized`.

#### `withdrawFunds(uint256 _campaignId)`
- **Purpose**: Allows contributors to withdraw their contributions if the campaign failed.
- **Parameters**: 
  - `_campaignId`: The ID of the campaign from which to withdraw funds.
- **Functionality**: If a campaign has failed (i.e., the target amount was not met), contributors can withdraw their funds using this function.
- **Events**: Emits `RefundIssued`.

#### `getCampaign(uint256 _campaignId)`
- **Purpose**: Retrieves the details of a specific campaign.
- **Parameters**: 
  - `_campaignId`: The ID of the campaign to view.
- **Returns**: 
  - The campaign’s creator, target amount, deadline, total contributions, and finalized state.
- **Functionality**: This is a read-only function that provides detailed information about a specific campaign for users to view.

---

## 2. Voting System Contract

### Overview
The Voting System contract allows users to propose new options (proposals) and cast votes on them. Each address can vote only once per proposal. The contract tracks the total number of votes for each proposal and allows users to retrieve the winning proposal based on the highest number of votes.

### Features
- **Create Proposals**: Anyone can propose a new option with a description.
- **Vote on Proposals**: Users can vote on any existing proposal, but they can only vote once per proposal.
- **Retrieve Proposal Count**: Get the total number of proposals.
- **Check Proposal Details**: View the description and vote count for a given proposal.
- **Determine Winning Proposal**: Retrieve the proposal with the highest number of votes.

### How to Use
1. **Deploy the Contract**: Use any Solidity-compatible environment (like Remix or Truffle) to deploy the contract.
2. **Propose a New Option**: Call `propose(string calldata _description)` to propose a new option.
3. **Vote on a Proposal**: Call `vote(uint256 _proposalId)` to vote on a specific proposal.
4. **Get Total Proposals**: Call `getProposalsCount()` to get the number of proposals.
5. **Get Proposal Details**: Call `getProposal(uint256 _proposalId)` to retrieve the description and vote count of a specific proposal.
6. **Determine Winning Proposal**: Call `getWinningProposal()` to get the ID of the proposal with the most votes.

### Functions

#### `propose(string calldata _description)`
- **Purpose**: Allows users to create new proposals.
- **Parameters**: 
  - `_description`: A string representing the description of the proposal.
- **Functionality**: This function allows anyone to propose a new voting option by submitting a description. It pushes the new proposal into the `proposals` array and initializes the vote count to 0.
- **Events**: Emits `ProposalCreated`.

#### `vote(uint256 _proposalId)`
- **Purpose**: Allows users to vote on a proposal.
- **Parameters**: 
  - `_proposalId`: The ID of the proposal the user wants to vote for.
- **Functionality**: Users can vote for any proposal by its ID. This function ensures that each address can only vote once per proposal by checking the `hasVoted` mapping. The vote count for the selected proposal is incremented.
- **Events**: Emits `Voted`.

#### `getProposalsCount()`
- **Purpose**: Returns the total number of proposals.
- **Functionality**: This function returns the length of the `proposals` array, which represents the total number of proposals submitted to the contract.

#### `getProposal(uint256 _proposalId)`
- **Purpose**: Retrieves the details of a specific proposal.
- **Parameters**: 
  - `_proposalId`: The ID of the proposal to view.
- **Returns**: 
  - The description and vote count of the selected proposal.
- **Functionality**: This function is used to get detailed information about a specific proposal, including its description and the number of votes it has received.

#### `getWinningProposal()`
- **Purpose**: Returns the ID of the proposal with the most votes.
- **Functionality**: This function loops through all proposals and compares their vote counts. The proposal with the highest vote count is considered the winner, and its ID is returned.

---


## Prerequisites

To deploy and interact with the contracts, you will need:
- **Solidity Compiler** (`>= 0.8.0`)
- **Ethereum Wallet** (e.g., MetaMask)
- **Development Environment** (e.g., Remix, Hardhat, or Truffle)
- **Testnet/Local Blockchain** (e.g., Ganache, Ropsten)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/solidity-crowdfunding-voting.git
   ```
2. Install dependencies if needed (for example, in Hardhat or Truffle).
3. Deploy the contracts using Remix, Truffle, or any Ethereum-compatible environment.

---

## Usage Instructions

### For Crowdfunding Contract
- **Deploy**: Once deployed, you can create crowdfunding campaigns by calling `createCampaign` with the target amount and duration.
- **Contribute**: Anyone can contribute by calling the `contribute` function and sending ETH to a campaign.
- **Finalization**: After the deadline, the campaign creator can finalize the campaign to either claim funds or close the campaign.
- **Withdraw**: Contributors can withdraw funds from failed campaigns by calling `withdrawFunds`.

### For Voting System Contract
- **Deploy**: Deploy the contract and propose new voting options.
- **Propose**: Call `propose` with a description of the proposal.
- **Vote**: Users can vote on proposals, and the contract ensures only one vote per proposal.
- **Check Results**: Use `getWinningProposal` to check the proposal with the most votes.

---

## Security Considerations
- **Reentrancy**: The contracts have basic checks to prevent reentrancy vulnerabilities, but further testing is advised.
- **Finalization**: Only the creator of a campaign can finalize it after the deadline.
- **Single Voting**: The `hasVoted` mapping ensures that each address can vote only once per proposal.

