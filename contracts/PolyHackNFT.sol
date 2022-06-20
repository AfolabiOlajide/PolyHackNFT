// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PolyHackNFT is ERC721, Ownable {
    uint256 public mintPrice;
    uint256 public totalSupply;
    uint256 public maxSupply;
    uint256 public mintPerWallet;
    bool public isPublicMintEnabled;
    string internal baseTokenUri;
    mapping(address => uint256) public walletMints;

    constructor() payable ERC721("PolyHackNFT", "PH") {
        mintPrice = 0.002 ether;
        totalSupply = 0;
        maxSupply = 1000;
        mintPerWallet = 3;
    }

    function setIsPublicMintEnabled(bool _isPublicMintEnabled)
        external
        onlyOwner
    {
        isPublicMintEnabled = _isPublicMintEnabled;
    }

    function setBaseUri(string calldata _baseTokenUri) external onlyOwner {
        baseTokenUri = _baseTokenUri;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override
        returns (string memory)
    {
        require(_exists(_tokenId), "Token does not exist");
        return
            string(
                abi.encodePacked(
                    baseTokenUri,
                    Strings.toString(_tokenId),
                    ".json"
                )
            );
    }

    function mint(uint256 _quantity) public payable {
        require(isPublicMintEnabled, "Public minting is disabled");
        require(msg.value == _quantity * mintPrice, "wrong mint value");
        require(totalSupply + _quantity <= maxSupply, "sold out");
        require(
            walletMints[msg.sender] + _quantity <= mintPerWallet,
            "exceeded max wallet"
        );

        for (uint256 i = 0; i < _quantity; i++) {
            uint256 newTokenId = totalSupply + i + 1;
            totalSupply++;
            walletMints[msg.sender]++;
            _safeMint(msg.sender, newTokenId);
        }
    }
}
