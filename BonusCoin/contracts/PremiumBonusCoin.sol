// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;
import "./BonusCoin.sol";


contract PremiumBonusCoin is BonusCoin{

  function addBonusCoin(address _client, uint256 _amount) public pure override {
        sendBonusCoin(_client, _amount  * 2);    
    }

  //function Delivery250() public {
    //
  //}  
}