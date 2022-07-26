// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;

contract BonusCoin{
    address private _addr;

    mapping(address => uint256) internal bonusBalances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    constructor() {
		bonusBalances[tx.origin] = 1000000;
	}

    function getBonusBalance(address addr) public view returns(uint256){
        return bonusBalances[addr];
    }

    function sendBonusCoin(address receiver, uint256 amount) public returns(bool sufficient) {
		if (bonusBalances[msg.sender] < amount) return false;
		bonusBalances[msg.sender] -= amount;
		bonusBalances[receiver] += amount;
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

    function addBonusCoin(address _client, uint256 _amount) public virtual  {
        //sendBonusCoin(_client, _amount);    
    }

    function getAddress() public view returns(address){
        return _addr;
    }

    function getAddressPayable() public view returns(address payable){
        return payable(msg.sender);
    }
}
