pragma solidity ^0.8.0;

import "./SubBridgeToken.sol";

contract SubFaucetToken is SubBridgeToken {
    uint8 constant decimal = 6; //same as usdt

    constructor(
        address _subBridge,
        address _mainToken,
        string memory _name,
        string memory _symbol
    ) SubBridgeToken(_subBridge, _mainToken, _name, _symbol) {}

    function decimals() public view override returns (uint8) {
        return decimal;
    }
}