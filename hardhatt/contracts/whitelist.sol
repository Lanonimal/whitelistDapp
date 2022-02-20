//SPDX-License-Identifier: Unlicense 
pragma solidity ^0.8.0;

contract whitelist {
    uint8 public maxWhitelistAddresses;
    uint8 public numWhitelistAddresses;
    
    mapping(address => bool) public whitelistAddresses;

    constructor(uint8 _maxWhitelistAddresses){
        maxWhitelistAddresses = _maxWhitelistAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistAddresses[msg.sender], "Sender has already been whitelisted"); //"You have already been whitelisted" 
        require(numWhitelistAddresses < maxWhitelistAddresses, "Maximum amount of whitelisted addresses has already been reached.");
        whitelistAddresses[msg.sender] = true;
        numWhitelistAddresses += 1;
    }
}
