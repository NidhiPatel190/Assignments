# IU2141230190
# Assignment-4
# Submission Date: 05-09-2024


## 1. Finding SHA-256 Hash with Specific Prefix

**Question**: Give me an input string that outputs a SHA-256 hash that starts with `00000`. How will you do it?

**Description**: To find an input string that results in a SHA-256 hash starting with `00000`, you would use a brute-force search approach. This involves generating SHA-256 hashes for various input strings and checking if the hash begins with the desired prefix. The process typically involves:

1. Starting with an initial input string.
2. Iteratively appending numbers (or other variations) to the input string.
3. Hashing the resulting string using SHA-256.
4. Checking if the hash starts with `00000`.
5. Continuing the process until you find a matching hash.

This approach is computationally intensive but ensures that you eventually find a valid input string.

## 2. Input String Starting with Specific Prefix

**Question**: What if I ask you that the input string should start with `devadnani26`? How would the code change?

**Description**: If the input string must start with a specific prefix, such as `devadnani26`, you need to modify the input generation logic. The revised process involves:

1. Setting a fixed prefix (e.g., `devadnani26`).
2. Appending a variable part (e.g., a nonce or number) to this prefix.
3. Generating the SHA-256 hash of the combined string.
4. Checking if the hash starts with the desired prefix (e.g., `00000`).

By fixing the starting part of the input string and varying only the appended part, you tailor the brute-force approach to the new requirement.

## 3. Finding a Nonce for a Given Input

**Question**: What if I ask you to find a nonce for the following input:

Dev => Karan | Rs 100 Karan => Darsh | Rs 10


**Description**: To find a nonce for this input, you need to:

1. Append a nonce (a number) to the input string.
2. Generate the SHA-256 hash of the resulting string.
3. Ensure that the hash meets the desired criteria (e.g., starting with a certain prefix).

The nonce is essentially a value that is varied to alter the hash output. The process involves:

1. Starting with the base input string.
2. Iteratively appending different nonce values and hashing the result.
3. Checking if the hash meets the specified condition (e.g., a certain prefix).

## 4. CryptoZombies Lesson 1

**Question**: Go to [CryptoZombies](https://cryptozombies.io/en/solidity), create an account, complete Lesson 1: Making the Zombie Factory, and share a screenshot.

**Description**: CryptoZombies is an educational platform for learning Solidity through interactive lessons. Lesson 1 involves creating a smart contract that acts as a "zombie factory," allowing you to deploy and manage zombie characters. To complete the lesson:

1. Visit [CryptoZombies](https://cryptozombies.io/en/solidity).
2. Create an account if you don't already have one.
3. Complete Lesson 1: Making the Zombie Factory, which includes writing and deploying a basic smart contract.
4. Capture a screenshot of your completion status.
5. Share the screenshot as required.

## 5. Donation Smart Contract

**Description**: The `DonationContract` is a Solidity smart contract designed for managing donations. It allows users to donate Ether to various recipients and provides several features:

1. **Donation Function**: Users can send Ether to a specified recipient. The contract tracks these donations and emits an event each time a donation is made.
2. **Withdrawal Function**: Allows the contract owner to withdraw Ether from the contract balance. The contract ensures that sufficient balance is available before allowing withdrawals.
3. **Balance Checking**: Provides functions to check the current contract balance and to view the total amount donated by a specific donor to a specific recipient.
4. **Event Logging**: Emits events for donations to provide a transparent record of transactions.

This contract is useful for scenarios where individuals want to contribute funds to different recipients while maintaining a record of donations.

