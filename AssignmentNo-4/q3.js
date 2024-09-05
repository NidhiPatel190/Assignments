//What if I ask you to find a nonce for the following input -

//Dev => Karan | Rs 100
//Karan => Darsh | Rs 10

const crypto = require("crypto");

// Function to find a nonce for the given input string and prefix
function findNonce(inputString, prefix) {
  let nonce = 0; // Initialize the nonce counter to 0
  let hash;      // Declare a variable for the hash

  // Infinite loop to keep generating hashes with different nonces
  while (true) {
    // Append the current nonce to the input string
    let fullString = inputString + nonce.toString();

    // Generate a SHA-256 hash of the input string with the appended nonce
    hash = crypto.createHash("sha256").update(fullString).digest("hex");

    // Check if the generated hash starts with the specified prefix
    if (hash.startsWith(prefix)) {
      // If a matching hash is found, return the nonce and the hash
      return { nonce, hash };
    }

    // Increment the nonce for the next iteration
    nonce++;
  }
}

// Define the transaction input string
const transactionInput = `Dev => Karan | Rs 100\nKaran => Darsh | Rs 10`;

// Call the findNonce function with the transaction input and the prefix '00000'
const result = findNonce(transactionInput, "00000");

// Output the nonce and the matching hash
console.log(`Nonce: ${result.nonce}`);
console.log(`Hash: ${result.hash}`);
