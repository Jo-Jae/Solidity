// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract TEST6 {
/*
숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
--------------------------------------------------------------------------------------------
문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
*/


    uint[] public numbers;

    function push(uint _n) public {
        assembly {
            let length := sload(numbers.slot)
            mstore(0x0, numbers.slot)

            let slot := add(keccak256(0x0,0x20), length)

            sstore(slot, _n)

            sstore(numbers.slot, add(length, 1))
        }
    }

    function getNum() public view returns(uint, uint) {
        assembly {
          
        }
    }

    function setnum(uint _n)public pure returns(uint){
        uint i;
        for (i=1; i < _n; 10**i)
        
    }


}