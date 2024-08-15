// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageStorage {
    mapping(address => string) private messages;

        function storeMessage(string memory _message) public {
                messages[msg.sender] = _message;
                    }

                        function retrieveMessage() public view returns (string memory) {
                                return messages[msg.sender];
                                    }
                                    }
                                    