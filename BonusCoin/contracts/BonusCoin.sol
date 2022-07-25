// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract BonusCoin{
    address private _addr;

    mapping(address => uint256) internal bonusBalances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function getBonusBalance(address addr) internal view returns(uint256){
        return bonusBalances[addr];
    }

    function sendBonusCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (bonusBalances[msg.sender] < amount) return false;
		bonusBalances[msg.sender] -= amount;
		bonusBalances[receiver] += amount;
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

    function getAddress() public view returns(address){
        return _addr;
    }

    function getAddressPayable() public view returns(address payable){
        return payable(msg.sender);
    }
}