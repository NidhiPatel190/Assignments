// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    // Structure to define a campaign
    struct Campaign {
        address creator;              // Creator of the campaign
        uint256 targetAmount;         // The amount the campaign is trying to raise
        uint256 deadline;             // Deadline (timestamp) for the campaign
        uint256 totalContributions;   // Total contributions received so far
        bool finalized;               // Whether the campaign has been finalized
        mapping(address => uint256) contributions;  // Mapping to track contributions by each participant
    }

    // Mapping to store campaigns with a unique campaign ID
    mapping(uint256 => Campaign) public campaigns;

    // Counter to assign a unique ID to each campaign
    uint256 public campaignCount;

    // Events to emit for important actions in the contract
    event CampaignCreated(uint256 campaignId, address creator, uint256 targetAmount, uint256 deadline);
    event ContributionMade(uint256 campaignId, address contributor, uint256 amount);
    event CampaignFinalized(uint256 campaignId, bool success);
    event RefundIssued(uint256 campaignId, address contributor, uint256 amount);

    // Function to create a new campaign
    function createCampaign(uint256 _targetAmount, uint256 _duration) external {
        require(_targetAmount > 0, "Target amount must be greater than zero");
        require(_duration > 0, "Duration must be greater than zero");

        // Increment the campaign counter to generate a new ID
        campaignCount++;
        
        // Initialize the new campaign and store in the mapping
        Campaign storage newCampaign = campaigns[campaignCount];
        newCampaign.creator = msg.sender;
        newCampaign.targetAmount = _targetAmount;
        newCampaign.deadline = block.timestamp + _duration;  // Set the deadline using current timestamp + duration
        newCampaign.finalized = false;

        // Emit an event to signal that a new campaign has been created
        emit CampaignCreated(campaignCount, msg.sender, _targetAmount, newCampaign.deadline);
    }

    // Function to contribute funds to an active campaign
    function contribute(uint256 _campaignId) external payable {
        Campaign storage campaign = campaigns[_campaignId];

        // Ensure the campaign is still ongoing and accepting contributions
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(msg.value > 0, "Contribution must be greater than zero");
        require(!campaign.finalized, "Campaign is finalized");

        // Update the campaign's total contributions and the contributor's amount
        campaign.totalContributions += msg.value;
        campaign.contributions[msg.sender] += msg.value;

        // Emit an event to signal that a contribution was made
        emit ContributionMade(_campaignId, msg.sender, msg.value);
    }

    // Function to finalize a campaign after its deadline
    function finalizeCampaign(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];

        // Only the creator of the campaign can finalize it
        require(msg.sender == campaign.creator, "Only the creator can finalize the campaign");
        require(block.timestamp >= campaign.deadline, "Campaign is still ongoing");
        require(!campaign.finalized, "Campaign is already finalized");

        // Mark the campaign as finalized
        campaign.finalized = true;

        if (campaign.totalContributions >= campaign.targetAmount) {
            // If the target amount was met, transfer the funds to the creator
            payable(campaign.creator).transfer(campaign.totalContributions);
            emit CampaignFinalized(_campaignId, true);
        } else {
            // If the target wasn't met, the funds won't be transferred
            emit CampaignFinalized(_campaignId, false);
        }
    }

    // Function to allow contributors to withdraw funds if the campaign failed
    function withdrawFunds(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        uint256 contribution = campaign.contributions[msg.sender];

        // Ensure the campaign has been finalized and the user has contributed funds
        require(campaign.finalized, "Campaign is not finalized");
        require(contribution > 0, "No funds to withdraw");

        if (campaign.totalContributions < campaign.targetAmount) {
            // If the target was not met, contributors can withdraw their funds
            campaign.contributions[msg.sender] = 0;
            payable(msg.sender).transfer(contribution);

            // Emit an event to signal that a refund has been issued
            emit RefundIssued(_campaignId, msg.sender, contribution);
        }
    }

    // Function to retrieve campaign details
    function getCampaign(uint256 _campaignId) external view returns (
        address creator,
        uint256 targetAmount,
        uint256 deadline,
        uint256 totalContributions,
        bool finalized
    ) {
        Campaign storage campaign = campaigns[_campaignId];
        return (
            campaign.creator,
            campaign.targetAmount,
            campaign.deadline,
            campaign.totalContributions,
            campaign.finalized
        );
    }
}
