# SimpleNFT - Smart Contract for ERC721 NFTs

**SimpleNFT** is a smart contract built on the Ethereum blockchain using the ERC721 standard for creating Non-Fungible Tokens (NFTs). This contract allows users to mint, transfer, and manage NFTs easily while providing full control over the token ownership and metadata.

## Features

- **Minting NFTs**: The contract allows the owner to mint new NFTs to specified addresses.
- **Ownership Tracking**: You can retrieve the list of all tokens owned by any address.
- **Manual Token Transfers**: A function that allows the owner to manually update ownership mapping when transferring tokens.
- **Security**: Built using OpenZeppelin’s ERC721 and Ownable contracts for secure and reliable operations.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Contract Functions](#contract-functions)
- [Testing](#testing)
- [License](#license)

## Installation

To deploy and interact with this contract, you will need:

1. **Remix IDE** (recommended for testing and deployment).
2. **MetaMask** or any Ethereum wallet connected to Remix for interacting with the contract.
3. **Solidity** compiler version `^0.8.0` (or higher) installed.

To get started, clone the repository and open the `SimpleNFT.sol` file in Remix IDE.

1. Clone this repository:
    ```bash
    git clone https://github.com/your-username/NftErc721.git
    cd realstate-contract
    ```

