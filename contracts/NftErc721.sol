// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Contract for managing NFTs using the ERC721 standard
contract SimpleNFT is ERC721, Ownable {
    uint256 private _nextTokenId; // ID for the next token to be minted

    // Mapping to track tokens owned by each address
    mapping(address => uint256[]) private _ownedTokens;

    // Constructor initializing the token name, symbol, and setting the initial owner
    constructor() ERC721("SimpleNFT", "SNFT") Ownable(msg.sender) {
        _nextTokenId = 1; // Start the token ID counter
    }

    // Function to mint a new NFT
    function mint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId; // Get the next token ID
        _safeMint(to, tokenId); // Mint the token safely

        // Update the mapping with the new token for the recipient
        _ownedTokens[to].push(tokenId);

        _nextTokenId++; // Increment the token ID counter
    }

    // Function to retrieve the list of NFTs owned by a specific address
    function tokensOfOwner(address owner) public view returns (uint256[] memory) {
        return _ownedTokens[owner];
    }

    // Manual update of ownership mapping during token transfers
    function manualTransferUpdate(
        address from,
        address to,
        uint256 tokenId
    ) external onlyOwner {
        // Ensure the token exists
        require(ownerOf(tokenId) != address(0), "Token ID does not exist");
        // Verify that the `from` address is the current owner of the token
        require(ownerOf(tokenId) == from, "From address is not the owner");

        // Remove the token from the sender's ownership list
        uint256[] storage fromTokens = _ownedTokens[from];
        for (uint256 i = 0; i < fromTokens.length; i++) {
            if (fromTokens[i] == tokenId) {
                fromTokens[i] = fromTokens[fromTokens.length - 1]; // Replace with the last token
                fromTokens.pop(); // Remove the last element
                break;
            }
        }

        // Add the token to the recipient's ownership list
        _ownedTokens[to].push(tokenId);

        // Perform the token transfer
        _transfer(from, to, tokenId);
    }
}
