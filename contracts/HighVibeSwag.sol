pragma solidity ^0.4.24;

import "./token/ERC721/ERC721Full.sol";
import "./token/ERC721/ERC721MetadataMintable.sol";
import "./token/ERC721/ERC721Pausable.sol";
import "./ownership/Ownable.sol";

contract HighVibeSwag is ERC721Full("HighVibe Swag", "SWAG"), ERC721MetadataMintable, ERC721Pausable, Ownable {
    event LogAddress(string msg, address output);
    event LogId(string msg, uint256 output);

    constructor() public {
        // prevent users from selling/transferring their attendance token
        pause();
    }

    /**
    * @dev Mints a single token to a unique address with a tokenURI.
    * @param _to address of the future owner of the token
    * @param _tokenURI token URI for the token
    * @return newly generated token id 
    */
    function mintSwag(
        address _to,
        string  _tokenURI
    ) public onlyOwner returns (uint256) {
        // ensure 1 token per user
        require(super.balanceOf(_to) == 0, "total supply of available tokens is exhausted");

        uint256 _tokenId = totalSupply().add(1); 
        mintWithTokenURI(_to, _tokenId, _tokenURI);
        return _tokenId;
    }

    /** @dev Sets token metadata URI.
    * @param _tokenId token ID
    * @param _tokenURI token URI for the token
    */
    function setTokenURI(
        uint256 _tokenId, string _tokenURI
    ) public onlyOwner {
        super._setTokenURI(_tokenId, _tokenURI);
    }
}