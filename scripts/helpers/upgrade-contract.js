// Dependencies
const Web3 = require('web3');

// Artifacts
const RocketStorage = artifacts.require('./contract/RocketStorage');
const RocketUpgrade = artifacts.require('./contract/RocketUpgrade');

// Checkin node
module.exports = async (done) => {

    // Get command-line arguments (remove args from truffle)
    let args = process.argv.splice(4);

    // Validate arguments
    if (args.length != 1) done('Incorrect number of arguments. Please enter: contract artifact name.');

    // Parse arguments
    let [artifactName] = args;

    // Get contract dependencies
    const rocketStorage = await RocketStorage.deployed();
    const rocketUpgrade = await RocketUpgrade.deployed();

    // Get contract artifact
    let Artifact;
    try { Artifact = artifacts.require('./contract/' + artifactName); }
    catch (e) { done('Could not find the specified contract artifact.'); }

    // Deploy new contract
    let deployResult = await Artifact.new(rocketStorage.address);

    // Upgrade contract in network
    let upgradeResult = await rocketUpgrade.upgradeContract('rocketUser', deployResult.address, false, false);

    // Complete
    done('Contract successfully upgraded: ' + args.join(', '));

};

