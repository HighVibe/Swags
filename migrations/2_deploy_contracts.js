var swag = artifacts.require("./HighVibeSwag.sol");

module.exports = async (deployer, network, accounts) => {
  // deploy swag smart contract
  await deployer.deploy(swag);
};
