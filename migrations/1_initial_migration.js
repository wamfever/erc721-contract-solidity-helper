const KeykoNFT = artifacts.require("KeykoNFT");

module.exports = function (deployer) {
  deployer.deploy(KeykoNFT,"KeykoNFT","KYK");
};
