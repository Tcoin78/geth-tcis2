// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.0;

interface RocketDAONodeTrustedSettingsRewardsInterface {
    function getNetworkEnabled(uint256 _network) external view returns (bool);
}
