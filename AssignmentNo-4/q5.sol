//Donation Smart Contract: Allows individuals to donate or transfer money from their personal accounts to various recipients.

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract DonationContract {
    // Event emitted when a donation is made
    event DonationMade(address indexed donor, address indexed recipient, uint256 amount);

    // Mapping to track donations made by an address
    // `donations[donor][recipient]` stores the amount donated by `donor` to `recipient`
    mapping(address => mapping(address => uint256)) public donations;

    // Function to make a donation to a specific recipient
    function donate(address recipient) external payable {
        // Ensure that the donation amount is greater than zero
        require(msg.value > 0, "Donation amount must be greater than zero");
        // Ensure that the recipient address is valid (not the zero address)
        require(recipient != address(0), "Invalid recipient address");

        // Update the donation mapping with the new donation amount
        donations[msg.sender][recipient] += msg.value;

        // Emit an event to log the donation
        emit DonationMade(msg.sender, recipient, msg.value);
    }

    // Function to withdraw funds from the contract
    // Only the contract owner should be able to call this function
    function withdraw(uint256 amount) external {
        // Ensure that the withdrawal amount is greater than zero
        require(amount > 0, "Withdrawal amount must be greater than zero");
        // Ensure that the contract has enough balance to cover the withdrawal
        require(address(this).balance >= amount, "Insufficient contract balance");

        // Transfer the specified amount to the caller
        payable(msg.sender).transfer(amount);
    }

    // Function to get the balance of the contract
    // Returns the current balance of the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Function to get the total amount donated by a specific donor to a recipient
    // Returns the donation amount from the specified donor to the specified recipient
    function getDonation(address donor, address recipient) external view returns (uint256) {
        return donations[donor][recipient];
    }
}
