// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EnhancedToken {
   
    // Public variables to store token details
    string public name = "Enhanced Meta Asset";
    string public symbol = "EMA";
    uint256 public totalSupply = 0;
   
    // Event declarations
    event Minted(address indexed to, uint256 value);
    event Burned(address indexed from, uint256 value);
   
    // Mapping of address to balance
    mapping(address => uint256) public balanceOf;
   
    // Modifier to check sufficient balance
    modifier hasSufficientBalance(address _address, uint256 _value) {
        require(balanceOf[_address] >= _value, "Insufficient balance");
        _;
    }

    // Function to mint new tokens
    function mintToken(address _recipient, uint256 _amount) public {
        totalSupply += _amount;
        balanceOf[_recipient] += _amount;
        emit Minted(_recipient, _amount);
    }
   
    // Function to burn tokens
    function burnToken(address _holder, uint256 _amount) public hasSufficientBalance(_holder, _amount) {
        totalSupply -= _amount;
        balanceOf[_holder] -= _amount;
        emit Burned(_holder, _amount);
    }
}
