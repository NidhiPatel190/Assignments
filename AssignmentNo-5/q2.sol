// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // Structure to represent each proposal
    struct Proposal {
        string description;  // Description of the proposal
        uint256 voteCount;   // Number of votes this proposal has received
    }

    address public owner;  // The owner of the contract
    Proposal[] public proposals;  // Dynamic array to store all proposals

    // Mapping to track whether an address has voted on a specific proposal
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    // Events to signal actions taken in the contract
    event ProposalCreated(uint256 proposalId, string description);
    event Voted(uint256 proposalId, address voter);

    // Constructor to set the owner of the contract to the address that deploys it
    constructor() {
        owner = msg.sender;
    }

    // Function to create a new proposal
    function propose(string calldata _description) external {
        require(bytes(_description).length > 0, "Description cannot be empty");

        // Add the new proposal to the proposals array
        proposals.push(Proposal({
            description: _description,
            voteCount: 0
        }));

        // Emit event to indicate a new proposal has been created
        emit ProposalCreated(proposals.length - 1, _description);
    }

    // Function to vote on a proposal
    function vote(uint256 _proposalId) external {
        // Ensure that the proposal ID is valid
        require(_proposalId < proposals.length, "Invalid proposal ID");
        // Ensure the sender has not already voted on this proposal
        require(!hasVoted[_proposalId][msg.sender], "Address has already voted for this proposal");

        // Mark the sender as having voted for this proposal
        hasVoted[_proposalId][msg.sender] = true;
        // Increment the vote count for the selected proposal
        proposals[_proposalId].voteCount += 1;

        // Emit event to indicate a vote has been cast
        emit Voted(_proposalId, msg.sender);
    }

    // Function to get the total number of proposals
    function getProposalsCount() external view returns (uint256) {
        return proposals.length;
    }

    // Function to get details of a specific proposal
    function getProposal(uint256 _proposalId) external view returns (string memory description, uint256 voteCount) {
        // Ensure that the proposal ID is valid
        require(_proposalId < proposals.length, "Invalid proposal ID");
        
        // Fetch the requested proposal
        Proposal storage proposal = proposals[_proposalId];
        return (proposal.description, proposal.voteCount);
    }

    // Function to determine the proposal with the most votes
    function getWinningProposal() external view returns (uint256 winningProposalId) {
        require(proposals.length > 0, "No proposals available");

        uint256 winningVoteCount = 0;
        winningProposalId = 0;

        // Iterate through all proposals to find the one with the most votes
        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposalId = i;
            }
        }
    }
}
