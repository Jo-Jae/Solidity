// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract TEST9 {
    /*흔히들 비밀번호 만들 때 대소문자 숫자가 각각 1개씩은 포함되어 있어야 한다 
    등의 조건이 붙는 경우가 있습니다. 그러한 조건을 구현하세요.

    입력값을 받으면 그 입력값 안에 대문자, 
    소문자 그리고 숫자가 최소한 1개씩은 포함되어 있는지 여부를 
    알려주는 함수를 구현하세요.
    */

    bool a;
    bool b;
    bool c;


    function setPW(string memory _pw) public  pure returns(string[] memory){
        uint _length = bytes(_pw).length;
        string[] memory _Pw = new string[](_length);

        bytes1[] memory _b = new bytes1[](_length);

        for(uint i = 0; i < _length; i++) {
            _b[i] = bytes(_pw)[i];
           require(_b[i] >= bytes1("A") && _b[i] <= bytes1("Z"), "Need Capital letters");
           require(_b[i] >= bytes1("a") && _b[i] <= bytes1("z"), "Need Small letters");
           require(_b[i] >= bytes1("0") && _b[i] <= bytes1("9"), "Need Number");
            _Pw[i] = string(abi.encodePacked(_b[i]));
        }
        return _Pw;
    }
}

contract BITWISE1 {
    //and, or xor


    //and
    function op1(uint a, uint b) public pure returns(uint) {
        return a&b;
    }

     //or
    function op2_or(uint a, uint b) public pure returns(uint) {
        return a | b;
    }

     //xor
    function op3_xor(uint a, uint b) public pure returns(uint) {
        return a ^ b; //2진수로 생각하기.
    }

    function  op4(uint a, uint b, uint c) public pure returns(uint,uint,uint) {
        return (a&b&c, a|b|c, a^b^c);
    }

   function  op5(uint a, uint b, uint c, uint d) public pure returns(uint,uint,uint) {
        return (a&b&c&d, a|b|c|d, a^b^c^d);
    }

}

/*
101101 = 45
011011 = 27

and = 001001
or  = 111111
xor = 110110






*/