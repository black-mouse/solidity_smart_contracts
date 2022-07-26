// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.25 < 0.9.15;

library ConvertLib{
	function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}
