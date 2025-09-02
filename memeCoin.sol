//  SPDX License-Identifier: MIT
pragma solidity ^0.8.17;

contract MyToken {
    // mapping varibale to store the balance of each address
    mapping(address => uint256) private balances;

    uint256 public initialSupply = 0;
    uint256 public totalSupply;
    address private owner;

    constructor() {
        mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

    function mint(address recipient, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can Perform this action");
        balances[recipient] += amount;
        totalSupply += amount;
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(amount <= balances[msg.sender], "Not enough balance.");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }
}
