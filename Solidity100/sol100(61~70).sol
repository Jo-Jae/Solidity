// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Q61 {
/*
a의 b승을 반환하는 함수를 구현하세요.
*/

    function get(uint a, uint b) public pure returns(uint) {
        return a**b;
    }
}

contract Q62 {
/*
2개의 숫자를 더하는 함수, 곱하는 함수 a의 b승을 반환하는 함수를 구현하는데 
3개의 함수 모두 2개의 input값이 10을 넘지 않아야 하는 조건을 최대한 효율적으로 구현하세요.
*/

    function Add_Mul_Sq(uint a, uint b) public pure returns(uint, uint, uint) {
        require(a < 10 && b < 10, "less than 10");
        return (a + b, a*b ,a**b );
    }


    
}

contract Q63 {
/*
2개 숫자의 차를 나타내는 함수를 구현하세요.
*/

    function gap(uint a, uint b) public pure returns(uint) {
        if (a < b) {
            return b - a;
        } else { return a - b;}
    }

}

contract Q64 {
/*지갑 주소를 넣으면 5개의 4bytes로 분할하여 반환해주는 함수를 구현하세요.
*/

    function separate(string memory addr) public pure returns(string[] memory) {
        uint _length = bytes(addr).length;
        string[] memory _letters = new string[](_length);

        bytes4[] memory _b = new bytes4[](_length);

        for(uint i=2; i<_length; i++) {
            _b[i] = bytes(addr)[i];
            _letters[i] = string(abi.encodePacked(_b[i]));    
        }
    
        return  _letters;
    }


}

contract Q65 {
/*숫자 3개를 입력하면 그 제곱을 반환하는 함수를 구현하세요. 그 3개 중에서 가운데 출력값만 반환하는 함수를 구현하세요.
예) func A : input → 1,2,3 // output → 1,4,9 | func B : output 4 (1,4,9중 가운데 숫자)
*/
    function sq(uint a, uint b, uint c) public pure returns(uint) {
    uint _a = a**2;
    uint _b = b**2;
    uint _c = c**2;
    uint[3] memory num = [_a,_b,_c];
     for(uint i=0; i < num.length; i++) {
            for(uint j=i+1; j < num.length; j++) {
                if(num[i] < num[j]) {
                    (num[i], num[j]) = (num[j], num[i]);
                }
            }
        }

        return num[1];
    }
    
}

contract Q66 {
/*특정 숫자를 입력했을 때 자릿수를 알려주는 함수를 구현하세요. 
추가로 그 숫자를 5진수로 표현했을 때는 몇자리 숫자가 될 지 알려주는 함수도 구현하세요.
*/

    function get(uint a) public pure returns(uint,uint) {
        uint length = 0;
        uint temp_a = a;

        while(temp_a != 0) {
            length ++;
            temp_a /=10;
        }

        uint r_length = length;

        length = 0;
        temp_a = a;

        while(temp_a != 0) {
            length ++;
            temp_a /=5;
        }

        uint f_length =length;

        return (r_length, f_length);
    }

}


contract Q67B{
    address payable b;

    function Transfer(address _Addr,uint n) public  {
      
        payable(_Addr).transfer(n);

    }
}

contract Q67A is Q67B {
/*자신의 현재 잔고를 반환하는 함수를 보유한 Contract A와 다른 주소로 돈을 보낼 수 있는 Contract B를 구현하세요.
 B의 함수를 이용하여 A에게 전송하고 A의 잔고 변화를 확인하세요.
*/
    mapping(address => uint) balance;
    address public A;

    function setA(address payable _addr) public {
        A = _addr;
    }

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
       return balance[msg.sender];
    }


}




contract Q68 {
/*계승(팩토리얼)을 구하는 함수를 구현하세요. 계승은 그 숫자와 같거나 작은 모든 수들을 곱한 값이다. 
예) 5 → 1*2*3*4*5 = 60, 11 → 1*2*3*4*5*6*7*8*9*10*11 = 39916800
    
 while을 사용해보세요
*/
    function Factorial(uint n) public pure returns(uint) {
        uint i;
        uint a = 1;
        for (i =0; i<n; i++) {
         a = (a * (n-i));
        }
        return a;
    }

}


import "@openzeppelin/contracts/utils/Strings.sol";
contract Q69 {
/*숫자 1,2,3을 넣으면 1 and 2 or 3 라고 반환해주는 함수를 구현하세요.
    
 힌트 : 7번 문제(시,분,초로 변환하기)
*/

   function getHMS(uint a, uint b, uint c) public pure returns(string memory) {
        return string(abi.encodePacked(Strings.toString(a), "and", Strings.toString(b), "or", Strings.toString(c)));
    }

}

contract Q70 {
/*번호와 이름 그리고 bytes로 구성된 고객이라는 구조체를 만드세요. 
bytes는 번호와 이름을 keccak 함수의 input 값으로 넣어 나온 output값입니다. 
고객의 정보를 넣고 변화시키는 함수를 구현하세요.
*/
    struct user {
        uint num;
        string name;
        bytes32 Bytes;
    }

    user[] users;

    function setUser(uint n, string memory _name) public {
      bytes32 _bytes;
       _bytes = keccak256(abi.encodePacked(n,_name));

       users.push(user(n,_name,_bytes));

    }
}