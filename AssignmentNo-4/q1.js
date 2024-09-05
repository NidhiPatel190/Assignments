// What if I ask you the following question — Give me an input string that outputs a SHA-256 hash that starts with 00000 . How will you do it?

// Import the built-in crypto module in Node.js for cryptographic functions
const crypto = require("crypto");

// Function to find a hash that starts with the specified prefix
function findHash(prefix) {
  let input = 0; // Initialize the input counter to 0
  let inputStr, hash; // Declare variables for input string and hash

  // Infinite loop to keep generating hashes until the desired one is found
  while (true) {
    // Convert the current input number to a string
    inputStr = input.toString();

    // Generate a SHA-256 hash of the input string
    hash = crypto.createHash("sha256").update(inputStr).digest("hex");

    // Check if the generated hash starts with the specified prefix
    if (hash.startsWith(prefix)) {
      // If a matching hash is found, return the input and the hash
      return { input, hash };
    }

    // Increment the input counter for the next iteration
    input++;
  }
}

// Call the findHash function with the prefix '00000' to find a hash that starts with five zeros
const res = findHash("00000");

// Output the matching input and hash
console.log(`Input: ${res.input}`); // Log the input that produced the matching hash
console.log(`Hash: ${res.hash}`);   // Log the matching hash

