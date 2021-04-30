// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KeykoNFT is ERC721,Ownable{
    
  mapping(address => bool) public isMinter;
  mapping(uint256 => TokenData) public tokenData;
  uint public tokensLength;

  struct TokenData{
    
    string name;
    uint mintedTimestamp;
    string hairColor;
    string eyesColor;
    uint height;
    uint age;

  }

  modifier onlyMinter(){
    require(isMinter[msg.sender],"only minters can do this operation");
    _;
  }

  constructor(string memory name_,string memory symbol_) ERC721(name_,symbol_){
  }

  function grantMinter(address minter) external onlyOwner{
    isMinter[minter]=true;
  }

  function removeMinter(address exMinter) external onlyOwner{
    isMinter[exMinter]=false;
  }

  function mintToken(string memory name,string memory hairColor,string memory eyesColor,uint height,uint age) external onlyMinter{
      TokenData memory newToken;
      newToken.name=name;
      newToken.age=age;
      newToken.hairColor=hairColor;
      newToken.eyesColor=eyesColor;
      newToken.height=height;
      newToken.mintedTimestamp=block.timestamp;
      tokenData[tokensLength]=newToken;
      _safeMint(msg.sender,tokensLength,"");
      tokensLength++;
  }

  function changeName(uint tokenId,string memory name) external{
      require(ownerOf(tokenId)==msg.sender,"only token owner can change it's property");
      tokenData[tokenId].name=name;
  }

  function changeAge(uint tokenId,uint age) external{
      require(ownerOf(tokenId)==msg.sender,"only token owner can change it's property");
      tokenData[tokenId].age=age;
  }

  function changeHeight(uint tokenId,uint height) external{
      require(ownerOf(tokenId)==msg.sender,"only token owner can change it's property");
      tokenData[tokenId].height=height;
  }

  function changeHairColor(uint tokenId,string memory hairColor) external{
      require(ownerOf(tokenId)==msg.sender,"only token owner can change it's property");
      tokenData[tokenId].hairColor=hairColor;
  }

  function changeEyesColor(uint tokenId,string memory eyesColor) external{
      require(ownerOf(tokenId)==msg.sender,"only token owner can change it's property");
      tokenData[tokenId].eyesColor=eyesColor;
  }

}
