// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/token/ERC20/SafeMath.sol";

contract Lottery {
    address public owner;
    mapping(address => uint256) public balances; // Mapping to store user's balance
mapping (address=>bool)voterRegistry;

// Lockstep transaction modifier 
modifier lockstep() {
        require(msg.sender == tx.origin, "Reentrancy Protection");
        _;
}
    
constructor() payable { 
        owner = msg.sender;  // Set the deployer as the initial winner and owner.
    }

function addLiquidity(uint256 _amount) external onlyOwner {

require(_amount >0 &&_amount <=10000000,"Invalid Liquidity Amount");

balances[msg.sender] += _amount;
emit LiquityAdded(msg.sender, _amount);
}

// Function to pay Winner
modifier lockstep() {
        require(msg.sender == tx.origin, "Reentrancy Protection");
         _;}


function voteOnOdds(address payable voterAddress) public onlyVoter {

require(voterRegistry[voterAddress] );

balances[_winnerAddress] += msg.value;

emit VoteCast(msg.sender, voterAddress);
}

// Prevent duplicate payments
modifier preventDuplicatePayment() {
        require(balances[msg.sender] == 0, "Sender already has a balance");
    