pragma solidity ^0.8.0;
import "./IERC20.sol";
import "./IERC165.sol";

interface ISubBridgeToken {
    function mainToken() external returns (address);

    function mint(address _to, uint256 _amount) external;

    function burn(address _from, uint256 _amount) external;
}