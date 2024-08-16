## Submission Details
Submitting Date: 16-08-2024

## RollNo.:- IU2141230190

**1. Hello World Contract:
**
**Overview:** This is a basic contract designed to return a static string message, "Hello, World!".

**Explanation:** The contract has a single function, sayHello, that is marked as public and pure, meaning it doesn't modify the contract state and can be called externally. When invoked, it simply returns the string "Hello, World!".

**2. Simple Storage:
**
**Overview:** This contract allows users to store and retrieve a single integer value.

**Explanation:** It contains a private state variable storedValue to keep the integer. The set function updates this value, and the get function retrieves it. This demonstrates basic state management in smart contracts.

**3. Greeting Contract:
**
**Overview: **This contract allows users to set and get a personalized greeting message.

**Explanation:** It uses a private state variable greetingMessage to store the message. The setGreeting function allows users to update this message, while getGreeting retrieves it. This shows how to handle and store string data.

**4. Simple Counter:
**
**Overview:** This contract maintains a count and allows it to be incremented.

**Explanation:** It uses a private state variable count to keep track of the count. The increment function increases the count by one, and the getCount function returns the current count. This is useful for tracking simple metrics or state changes.

**5. Name Storage:**

**Overview:** This contract stores and retrieves a user's name based on their address.

**Explanation:** It employs a mapping from Ethereum addresses to strings to store names. The setName function allows users to set their name, and the getName function retrieves the name for the caller’s address. This demonstrates mapping and user-specific data storage.

**6. Basic Voting:**

**Overview:** This contract allows users to vote for candidates and keeps track of votes.

**Explanation:** It uses a mapping to record votes for each candidate and an array to store candidate names. The vote function increases the vote count for a specified candidate. This basic voting mechanism can be expanded for more complex voting scenarios.

**7. Owner Access:
**
**Overview:** This contract restricts certain functions to the contract owner only.

**Explanation:** It uses a state variable owner to store the address of the contract creator. The onlyOwner modifier checks if the caller is the contract owner before executing certain functions. This pattern ensures that only authorized users can access specific functionalities.

**8. Event Logging:
**
**Overview:** This contract demonstrates how to log events for actions performed in the contract.

**Explanation:** It defines an event ActionPerformed that logs the address of the performer and the action description. The performAction function emits this event, allowing external applications to listen and react to these events. This is useful for tracking actions and integrating with external systems.

**9. Simple Ledger:**

**Overview:** This contract maintains a simple ledger of transactions with basic entries.

**Explanation:** It defines a Transaction struct to store transaction details and an array ledger to keep all transactions. The addEntry function adds new transactions, while getEntry retrieves details of a specific transaction by index. This provides a basic ledger functionality for recording and accessing transaction history.

**10. Message Storage:**

**Overview:** This contract allows users to store and retrieve a message string.

**Explanation:** It includes a private state variable message to hold the message string. The setMessage function updates the message, and the getMessage function retrieves it. This demonstrates basic string storage and retrieval in a smart contract.

