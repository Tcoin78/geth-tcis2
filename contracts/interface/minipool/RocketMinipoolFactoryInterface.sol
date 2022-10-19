pragma solidity >0.5.0 <0.9.0;

// SPDX-License-Identifier: GPL-3.0-only

import "../../types/MinipoolDeposit.sol";

interface RocketMinipoolFactoryInterface {
    function getMinipoolBytecode() external pure returns (bytes memory);
    function deployContract(address _nodeAddress, uint256 _salt) external returns (address);
}
