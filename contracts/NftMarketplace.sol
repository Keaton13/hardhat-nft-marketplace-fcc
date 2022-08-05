// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

error NftMarketplace_PriceMustBeAboveZero();
error NftMarketplace_NotApprovedForMarketplace();

contract NftMarketplace {
    ////////////////////
    // Main Functions //
    ///////////////////
    function listItem(
        address nftAddress,
        uint256 tokenId,
        uint256 price
    ) external {
        if (price <= 0){
            revert NftMarketplace_PriceMustBeAboveZero();
        }
        // 1. Send the NFT to the contract. Transfer -> Contract "hold" the NFT.
        // 2. Owners can still hold their NFT, and give the marketplace approval
        // to sell the NFT for them.
        IERC721 nft = IERC721(nftAddress);
        if (nft.getApproved(tokenId) != address(this)){
            revert NftMarketplace_NotApprovedForMarketplace();
        }
        //
    }
}

//1. Create a decentralized NFT Marketplace
//  1. `listitem`: List NFTs on the marketplace
//  2. `buyItem`: Buy the NFTs
//  3. `cancelItem`: Cancel a listing
//  4. `updateListing`: Update Price
//  5. `withdawProceeds`: Withdraw payment for my bought NFTs
