// assignment.js

// 1: Write a function `isAnagram` which takes 2 parameters and returns true/false if those are anagrams or not.

function isAnagram(str1, str2) {
  // Remove non-alphanumeric characters, convert to lowercase, sort characters, and compare
  const formatStr = (str) => str.replace(/[^\w]/g, '').toLowerCase().split('').sort().join('');
  return formatStr(str1) === formatStr(str2);
}


// 2: Implement a function `calculateTotalSpentByCategory` which takes a list of transactions as parameter
// and returns a list of objects where each object is unique category-wise and has total price spent as its value.

function calculateTotalSpentByCategory(transactions) {
  const result = {};
  // Loop through each transaction
  transactions.forEach(({ category, price }) => {
    if (!result[category]) {
      result[category] = 0; // Initialize if category doesn't exist
    }
    result[category] += price; // Add the price to the category
  });
  // Convert the result object to an array of objects
  return Object.keys(result).map((category) => ({ category, totalSpent: result[category] }));

}

// 3: Write a function `findLargestElement` that takes an array of numbers and returns the largest element.

function findLargestElement(numbers) {
  return Math.max(...numbers); // Use Math.max to find the largest number
}


// 4: Implement a function `isPalindrome` which takes a string as argument and returns true/false as its result.

function isPalindrome(str) {
  // Remove non-alphanumeric characters and convert to lowercase
  const formattedStr = str.replace(/[^A-Za-z0-9]/g, '').toLowerCase();
  // Compare the string with its reversed version
  return formattedStr === formattedStr.split('').reverse().join('');
}


// 5: Write a function that calculates the time (in seconds) it takes for the JS code to calculate sum from 1 to n, given n as the input.

function calculateTime(n) {
  const start = performance.now(); // Start timer
  let sum = 0;
  for (let i = 1; i <= n; i++) {
    sum += i; // Calculate sum
  }
  const end = performance.now(); // End timer
  return (end - start) / 1000; // Return time in seconds
}

// 6: Implement a function `countVowels` that takes a string as an argument and returns the number of vowels in the string.

function countVowels(str) {
  const vowels = 'aeiouAEIOU';
  // Filter the vowels in the string and count them
  return str.split('').filter(char => vowels.includes(char)).length;
}


// 7: Write a function `sumArray` that takes an array of numbers as input and returns the sum of all the numbers.

function sumArray(numbers) {
  // Use reduce to sum up all numbers in the array
  return numbers.reduce((acc, num) => acc + num, 0);
}


// 8: Implement a function `filterEvenNumbers` that takes an array of numbers and returns a new array containing only the even numbers.

function filterEvenNumbers(numbers) {
  // Use filter to get only even numbers
  return numbers.filter(num => num % 2 === 0);
}


// 9: Write a function `findSmallestElement` that takes an array of numbers and returns the smallest element.

function findSmallestElement(numbers) {
  return Math.min(...numbers); // Use Math.min to find the smallest number
}


// 10: Create a function `reverseString` that takes a string and returns the string reversed.

function reverseString(str) {
  // Split the string into characters, reverse them, and join them back
  return str.split('').reverse().join('');
}


// 11: Write a function `fibonacci` that takes a number `n` and returns the `n`th number in the Fibonacci sequence.

function fibonacci(n) {
  if (n <= 1) return n; // Base case
  let a = 0, b = 1, temp;
  // Iterate to find the nth Fibonacci number
  for (let i = 2; i <= n; i++) {
    temp = a + b;
    a = b;
    b = temp;
  }
  return b;
}


// 12: Implement a function `removeDuplicates` that takes an array and returns a new array with duplicate values removed.

function removeDuplicates(arr) {
  // Use Set to remove duplicates and convert back to an array
  return [...new Set(arr)];
}


// 13: Write a function `countOccurrences` that takes a string and a character and returns the number of times the character appears in the string.

function countOccurrences(str, char) {
  // Split the string by the character and count the parts
  return str.split(char).length - 1;
}


// 14: Create a function `findCommonElements` that takes two arrays and returns a new array containing the elements that are present in both arrays.

function findCommonElements(arr1, arr2) {
  // Filter elements that are present in both arrays
  return arr1.filter(element => arr2.includes(element));
}


// 15: Implement a function `sortStrings` that takes an array of strings and returns the array sorted in alphabetical order.

function sortStrings(arr) {
  return arr.sort(); // Use default sort function to sort strings
}


// Example Usage and Outputs

console.log(isAnagram('listen', 'silent')); // true
console.log('\n');

console.log(JSON.stringify(calculateTotalSpentByCategory([{ category: 'food', price: 10 }, { category: 'food', price: 20 }, { category: 'travel', price: 30 }])), '\n'); 
// [{category: "food", totalSpent: 30}, {category: "travel", totalSpent: 30}]

console.log(findLargestElement([1, 2, 3, 4, 5])); // 5
console.log('\n');

console.log(isPalindrome('A man, a plan, a canal, Panama')); // true
console.log('\n');

console.log(calculateTime(1000000)); // Time in seconds (e.g., 0.002)
console.log('\n');

console.log(countVowels('hello world')); // 3
console.log('\n');

console.log(sumArray([1, 2, 3, 4, 5])); // 15
console.log('\n');

console.log(JSON.stringify(filterEvenNumbers([1, 2, 3, 4, 5, 6])), '\n'); // [2, 4, 6]

console.log(findSmallestElement([1, 2, 3, 4, 5])); // 1
console.log('\n');

console.log(reverseString('hello')); // 'olleh'
console.log('\n');

console.log(fibonacci(10)); // 55
console.log('\n');

console.log(JSON.stringify(removeDuplicates([1, 1, 2, 2, 3, 4])), '\n'); // [1, 2, 3, 4]

console.log(countOccurrences('hello world', 'o')); // 2
console.log('\n');

console.log(JSON.stringify(findCommonElements([1, 2, 3], [2, 3, 4])), '\n'); // [2, 3]

console.log(JSON.stringify(sortStrings(['banana', 'apple', 'cherry'])), '\n'); // ['apple', 'banana', 'cherry']
