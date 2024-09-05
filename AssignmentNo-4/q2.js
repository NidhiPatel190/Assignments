// What if I ask you that the input string should start with nidhpatel2626 ? How would the code change?

const crypto = require("crypto");

function findHashWithPrefix(prefix) {
    let input = 0;

    while (true) {
        // Construct the input string starting with 'nidhipatel26'
        let inputStr = "nidhipatel26" + input.toString();
        // Corrected the missing `=` in the hash assignment
        let hash = crypto.createHash('sha256').update(inputStr).digest('hex');

        // Check if the hash starts with the given prefix
        if (hash.startsWith(prefix)) {
            return { input: "nidhipatel26" + input, hash: hash };
        }

        input++;
    }
}

const res = findHashWithPrefix('00000');
console.log(`Input: ${res.input}`);  // Corrected the template literal syntax
console.log(`Hash: ${res.hash}`);    // Corrected the template literal syntax
