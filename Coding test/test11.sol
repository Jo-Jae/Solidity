// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract TEST11 {
/*로또 프로그램을 만드려고 합니다. 
숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 맞으면 0.75이더, 
4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

참가 금액은 0.05이더이다.

예시 1 : 8,2,4,7,D,A
예시 2 : 9,1,4,2,F,B*/

    function deposit() public payable  {}

    function withdraw() public payable {
        
    }

    function Lottery(string memory _l) public pure returns(uint) {

        uint sign;

        for(uint i=0; bytes(_l).length > i; i++){
            bytes1 l = bytes(_l)[i];
        if(l == bytes1(uint8(8+48)) ) {
            sign |= 32;
        } else if (l == bytes1(uint8(2+48))) {
            sign |= 16;
        } else if (l == bytes1(uint8(4+48))) {
            sign |= 8;
        } else if (l == bytes1(uint8(7+48))) {
            sign |= 4;
        } else if (l == bytes1("D")) {
            sign |= 2;
        } else if (l == bytes1("A")) {
            sign |= 1;
        } 
        }
        return sign;
    }
}