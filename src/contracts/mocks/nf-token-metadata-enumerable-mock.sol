pragma solidity ^0.4.24;

import "../tokens/nf-token-metadata.sol";
import "../tokens/nf-token-enumerable.sol";
import "../ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with enumerable and metadata
 * extensions.
 */
contract NFTokenMetadataEnumerableMock is
  NFTokenEnumerable,
  NFTokenMetadata,
  Ownable
{

  /**
   * @dev Contract constructor.
   * @param _name A descriptive name for a collection of NFTs.
   * @param _symbol An abbreviated name for NFTokens.
   */
  constructor(
    string _name,
    string _symbol
  )
    public
  {
    nftName = _name;
    nftSymbol = _symbol;
  }

  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   */
  function mint(
    address _to,
    uint256 _tokenId,
    string _uri
  )
    onlyOwner
    external
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }

  /**
   * @dev Removes a NFT from owner.
   * @param _tokenId Which NFT we want to remove.
   */
  function burn(
    uint256 _tokenId
  )
    onlyOwner
    external
  {
    super._burn(_tokenId);
  }

}
