// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Test13 {
/*가능한 모든 것을 inline assembly로 진행하시면 됩니다.
1. 숫자들이 들어가는 동적 array number를 만들고 1~n까지 들어가는 함수를 만드세요.
2. 숫자들이 들어가는 길이 4의 array number2를 만들고 여기에 4개의 숫자를 넣어주는 함수를 만드세요.
3. number의 모든 요소들의 합을 반환하는 함수를 구현하세요. 
4. number2의 모든 요소들의 합을 반환하는 함수를 구현하세요. 
5. number의 k번째 요소를 반환하는 함수를 구현하세요.
6. number2의 k번째 요소를 반환하는 함수를 구현하세요.
*/

    uint[] public _num;
    uint[4] public _num2;

    function pushNum(uint _n) public pure{
      
         assembly {
            let start := add(_num.slot, 0x20)
            for {let i:=0} lt(i,_n) {i:=add(i,1)} {
                mstore(add(start, mul(i,0x20)), add(i,1))
            }
        }
    }

    function pushNum2(uint _n) public pure {
       
        assembly {
         let start :=  mstore(_num2, )
    }
}

}