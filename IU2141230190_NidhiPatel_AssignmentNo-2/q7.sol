// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerRestricted {
    address private owner;

        modifier onlyOwner() {
                require(msg.sender == owner, "Not the owner");
                        _;
                            }

                                constructor() {
                                        owner = msg.sender;
                                            }

                                                function restrictedFunction() public onlyOwner {
                                                        // Only the owner can call this function
                                                            }
                                                            }
                                                            