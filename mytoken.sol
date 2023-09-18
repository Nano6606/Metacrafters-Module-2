// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    // Events
    event Minted(address indexed to, uint value);
    event Burned(address indexed from, uint value);

    // Public variables
    string public tokenName = "META";
    string public tokenAbbrv = "MTA";
    uint public totalSupply;
    address public owner;

    // Mapping from address to balance
    mapping(address => uint) public balances;

    // Constructor
    constructor(uint _initialSupply) {
        owner = msg.sender;
        totalSupply = _initialSupply;
        balances[owner] = _initialSupply;
    }

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Mint function
    function mint(address _to, uint _value) public onlyOwner {
        totalSupply += _value;
        balances[_to] += _value;
        emit Minted(_to, _value);
    }

    // Burn function
    function burn(address _from, uint _value) public onlyOwner {
        require(balances[_from] >= _value, "Insufficient balance");
        totalSupply -= _value;
        balances[_from] -= _value;
        emit Burned(_from, _value);
    }
}
