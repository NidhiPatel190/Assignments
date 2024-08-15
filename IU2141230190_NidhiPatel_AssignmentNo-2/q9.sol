
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLedger {
    // Define a structure to hold ledger entries
        struct Entry {
                string description;
                        uint256 amount;
                            }

                                // State variable to hold the list of ledger entries
                                    Entry[] public ledger;

                                        // Function to add a new entry to the ledger
                                            function addEntry(string memory _description, uint256 _amount) public {
                                                    ledger.push(Entry(_description, _amount));
                                                        }

                                                            // Function to retrieve an entry by index
                                                                function getEntry(uint256 _index) public view returns (string memory, uint256) {
                                                                        require(_index < ledger.length, "Index out of bounds");
                                                                                Entry memory entry = ledger[_index];
                                                                                        return (entry.description, entry.amount);
                                                                                            }
                                                                                            }
                                                                                            