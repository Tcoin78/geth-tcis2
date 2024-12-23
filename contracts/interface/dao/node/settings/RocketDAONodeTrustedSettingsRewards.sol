// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "./RocketDAONodeTrustedSettings.sol";
import "../../../../interface/dao/node/settings/RocketDAONodeTrustedSettingsRewardsInterface.sol";

contract RocketDAONodeTrustedSettingsRewards is RocketDAONodeTrustedSettings, RocketDAONodeTrustedSettingsRewardsInterface {
    using SafeMath for uint;

    constructor(RocketStorageInterface _rocketStorageAddress)
        RocketDAONodeTrustedSettings(_rocketStorageAddress, "rewards")
    {
        version = 2;
        if (!getBool(keccak256(abi.encodePacked(settingNameSpace, "deployed")))) {
            setSettingBool("rewards.network.enabled", true);
            setBool(keccak256(abi.encodePacked(settingNameSpace, "deployed")), true);
        }
    }

    function getNetworkEnabled(uint256 _network)
        external
        view
        override
        returns (bool)
    {
        return getBool(keccak256(abi.encodePacked(settingNameSpace, "rewards.network.enabled", _network)));
    }

    function setSettingBool(string memory _settingPath, bool _value)
        override
        public
        onlyDAONodeTrustedProposal
    {
        setBool(keccak256(abi.encodePacked(settingNameSpace, _settingPath)), _value);
    }
}
