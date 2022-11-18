// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";
import "./ERC721Metadata.sol";
import "./ERC721Enumerable.sol";


contract UniRing is ERC721Enumerable {
string public constant BASE_URI ="https://raw.githubusercontent.com/l-m-s/UniRing/main/json/"; // add "Ring_Bas_02.json" for spezific  
    // array to store our nfts
    string [] public UniRings;
    uint internal nftAcounter;

    mapping(string => bool) _UniRingsExists;

    function mint(string memory _UniRing) public {

        require(!_UniRingsExists[_UniRing],'Error - UniRing already exists');
        // this is deprecated - uint _id = UniRingz.push(_UniRing);
        UniRings.push(_UniRing);
        uint _id = UniRings.length - 1;

        // .push no longer returns the length but a ref to the added element
        _mint(msg.sender, _id);
        _UniRingsExists[_UniRing] = true;

    }
    constructor() ERC721("UniRing", "URNG") {
        nftAcounter = 0;
    }
    /*
      function mintNft() public {
        _safeMint(msg.sender, nftAcounter);
        emit DogMinted(nftAcounter);
        nftAcounter = nftAcounter + 1;
    }
    
    //Todo:  how to save URI ? 
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return BASE_URI;
    }
    */
    function getTokenCounter() public view returns (uint256) {
        return nftAcounter;
    }

}

/*
// ---- Hasoshi.sol 
// Warning: For educational purposes only. Do not use with real funds.

pragma solidity ^0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.7.2/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Hasoshi is ERC721Enumerable {
    using Strings for uint256;

    uint internal tokenCount;
    string internal baseURI;
    mapping(uint => uint) public tokenVariant; // Map tokenId to the tokenVariant

    constructor() ERC721("Hasoshi", "HAS") {
        baseURI = "https://raw.githubusercontent.com/cifunibas/Smart-Contracts-DeFi/main/assets/hasoshi/json/";
    }

    function mint() public {
        // Determine which of the 10 variants is minted
        // 1% chance for variant 10, equal chance for variants 1-9
        uint d100 = block.timestamp % 100; // "random" number from 0-99
        uint variant = d100 % 10 + 1;
        if (variant == 10) {
            variant = d100 / 10 + 1;
        }
        uint tokenId = ++tokenCount;
        tokenVariant[tokenId] = variant;
        _safeMint(msg.sender, tokenId);
    }

    function tokenURI(uint tokenId) public view override returns (string memory) {
        _requireMinted(tokenId);
        uint variant = tokenVariant[tokenId];
        return string(
            abi.encodePacked(
                baseURI,
                variant.toString(),
                ".json"
            )
        );
    }

}
*/