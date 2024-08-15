// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Greeting {
    string private greetingMessage;

        function setGreeting(string memory _message) public {
                greetingMessage = _message;
                    }

                        function getGreeting() public view returns (string memory) {
                                return greetingMessage;
                                    }
                                    }
