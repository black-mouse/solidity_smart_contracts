// SPDX-License-Identifier: MIT
pragma solidity <0.9.0;
import "./BonusCoin.sol";


contract PremiumBonusCoin is BonusCoin{

<<<<<<< HEAD
  function addBonusCoin(address _client, uint256 _amount) public pure override {
        sendBonusCoin(_client, _amount  * 2);    
    }

  //function Delivery250() public {
    //
  //}  
}
=======
  function addBonusCoin(address _client, uint256 _amount) public override {
        sendBonusCoin(_client, _amount  * 2);    
    }
}
>>>>>>> 8a205bf3d093fcff0f4b855e03e7969c6851606f
