const MarketPlace = artifacts.require("MarketPlace");

module.exports = function(deployer) {
  deployer.deploy(MarketPlace, { gas: 5000000 });
};
