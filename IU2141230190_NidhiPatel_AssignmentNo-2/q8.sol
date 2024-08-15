// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogging {
    event MessageChanged(string newMessage);

        string public message;

            function setMessage(string memory _message) public {
                    message = _message;
                            emit MessageChanged(_message);
                                }
                                }
                                