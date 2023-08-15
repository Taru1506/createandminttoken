// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function burn(uint256 _amount) public {
        _burn(msg.sender, _amount);
    }

    function transfer(address _to, uint256 _amount) public override returns (bool) {
        require(_to != address(0), "Invalid address");
        super.transfer(_to, _amount);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) public override returns (bool) {
        require(_to != address(0), "Invalid address");
        super.transferFrom(_from, _to, _amount);
        return true;
    }
}