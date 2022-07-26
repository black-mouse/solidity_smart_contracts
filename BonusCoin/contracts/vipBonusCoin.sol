// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;
import "./BonusCoin.sol";


contract vipBonusCoin is BonusCoin{
    
  function addBonusCoin(address _client, uint256 _amount) public override {
        sendBonusCoin(_client, _amount  * 5);    
    }
}
