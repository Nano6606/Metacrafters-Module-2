# Metacrafters-Module-2

# Enhanced Token Smart Contract

## Overview

This is an enhanced Solidity smart contract designed for token minting and burning. It includes additional features like events and modifiers to make the contract more robust and informative.

## Features

- **Token Details**: Public variables for storing token details like name, symbol, and total supply.
- **Events**: Events for tracking token minting (`Minted`) and burning (`Burned`).
- **Balance Mapping**: A mapping that keeps track of the balance for each address.
- **Minting**: Function for minting new tokens (`mintToken`).
- **Burning**: Function for burning tokens (`burnToken`).
- **Modifiers**: Custom modifier to check sufficient balance before burning tokens (`hasSufficientBalance`).

## Functions

### 1. Mint Token

To mint new tokens, call the `mintToken` function with the recipient's address and the amount to mint.

```solidity
mintToken(address _recipient, uint256 _amount);
```

### 2. Burn Token

To burn tokens, call the `burnToken` function with the holder's address and the amount to burn.

```solidity
burnToken(address _holder, uint256 _amount);
```

## Events

- `Minted`: Emitted when new tokens are minted.
- `Burned`: Emitted when tokens are burned.

## Modifiers

- `hasSufficientBalance`: Checks if the sender has sufficient balance before burning tokens.

