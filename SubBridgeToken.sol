pragma solidity ^0.8.0;

import "./ERC20.sol";
import "./ISubBridgeToken.sol";

abstract contract SubBridgeToken is ISubBridgeToken, ERC20 {
    address public override mainToken;
    address subBridge;

    constructor(
        address _subBridge,
        address _mainToken,
        string memory _name,
        string memory _symbol
    ) ERC20(_name, _symbol) {
        mainToken = _mainToken;
        subBridge = _subBridge;
    }

    modifier onlySubBridge() {
        require(msg.sender == subBridge, "Only sub Bridge allowed");
        _;
    }

    function supportsInterface(bytes4 _interfaceId) public pure returns (bool) {
        bytes4 firstSupportedInterface = bytes4(keccak256("supportsInterface(bytes4)")); // ERC165
        bytes4 secondSupportedInterface = ISubBridgeToken.mainToken.selector ^
            ISubBridgeToken.mint.selector ^
            ISubBridgeToken.burn.selector;
        return _interfaceId == firstSupportedInterface || _interfaceId == secondSupportedInterface;
    }

    function mint(address _to, uint256 _amount) public virtual onlySubBridge {
        _mint(_to, _amount);
    }

    function burn(address _from, uint256 _amount) public virtual onlySubBridge {
        _burn(_from, _amount);
    }
}