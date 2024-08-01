// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;


contract Q91 {
/*
배열에서 특정 요소를 없애는 함수를 구현하세요. 
예) [4,3,2,1,8] 3번째를 없애고 싶음 → [4,3,1,8]
*/
    uint[] a;

    function popNum(uint _n) public view returns(uint[] memory) {
     uint[] memory _a = new uint[](a.length -1);
      
       for(uint i = 0; i < a.length; i++) {
        if (a[_n] != a[i]) { 
            _a[i] = a[i];
        }}

        return _a;

    } 

    
}

contract Q92 {
/*
특정 주소를 받았을 때, 그 주소가 EOA인지 CA인지 감지하는 함수를 구현하세요.
*/



}

contract Q93 {
/*
다른 컨트랙트의 함수를 사용해보려고 하는데, 그 함수의 이름은 모르고 methodId로 추정되는 값은 있다. 
input 값도 uint256 1개, address 1개로 추정될 때 해당 함수를 활용하는 함수를 구현하세요.
*/  



    function CALL(address addr, bytes4 _method, uint n, address _addr) public {
       (bool success, ) = addr.call(abi.encodeWithSelector(_method, n, _addr));
    }


}

contract Q94 {
/*
inline - 더하기, 빼기, 곱하기, 나누기하는 함수를 구현하세요.
*/

    function Add(uint _a, uint _b) public pure returns(uint) {
        assembly {
            mstore(0x80, add(_a,_b))
            return(0x80, 32)
        }
    }

    function Sub(uint _a, uint _b) public pure returns(uint) {
        assembly {
            mstore(0x80, sub(_a,_b))
            return(0x80, 32)
        }
    }
    function Mul(uint _a, uint _b) public pure returns(uint) {
        assembly {
            mstore(0x80, mul(_a,_b))
            return(0x80, 32)
        }
    }

    function Div(uint _a, uint _b) public pure returns(uint) {
        assembly {
            mstore(0x80, div(_a,_b))
            return(0x80, 32)
        }
    }
}

contract Q95 {
/*
inline - 3개의 값을 받아서, 더하기, 곱하기한 결과를 반환하는 함수를 구현하세요.
*/

    function Add(uint a, uint b, uint c) public pure returns(uint) {
        assembly {
            mstore(0x80, add(a,b))
            let sum := mload(0x80)
            mstore(0xa0, add(sum, c))
          
            return(0xa0, 32)
        }
    }

     function Sub(uint a, uint b, uint c) public pure returns(uint) {
        assembly {
            mstore(0x80, add(a,b))
            let sum := mload(0x80)
            mstore(0xa0, sub(sum, c))
          
            return(0xa0, 32)
        }
    }

     function Mul(uint a, uint b, uint c) public pure returns(uint) {
        assembly {
            mstore(0x80, add(a,b))
            let sum := mload(0x80)
            mstore(0xa0, mul(sum, c))
          
            return(0xa0, 32)
        }
    }

     function Div(uint a, uint b, uint c) public pure returns(uint) {
        assembly {
            mstore(0x80, add(a,b))
            let sum := mload(0x80)
            mstore(0xa0, div(sum, c))
          
            return(0xa0, 32)
        }
    }

}

contract Q96 {
/*
inline - 4개의 숫자를 받아서 가장 큰수와 작은 수를 반환하는 함수를 구현하세요.
*/

}

contract Q97 {
/*
inline - 상태변수 숫자만 들어가는 동적 array numbers에 push하고 pop하는 함수 그리고 전체를 반환하는 구현하세요.
*/

    uint[] public num;

    function push(uint n) public {
        assembly {
            let length := sload(num.slot)
            mstore(0x0, num.slot)

            let nslot := add(keccak256(0x0, 0x20), length)

            sstore(nslot, n)
            sstore(num.slot, add(length, 1))
        }
    }

    function pop() public {
        assembly {
            let length := sload(num.slot)
            mstore(0x0, num.slot)

            let slot := add(keccak256(0x0,0x20), sub(length, 1))

            sstore(slot, 0)
            sstore(num.slot, sub(length, 1))
        }
    }

}

contract Q98 {
/*
inline - 상태변수 문자형 letter에 값을 넣는 함수 setLetter를 구현하세요.
*/

    string letter;

    function setLetter(string memory _letter) public {

    }
}

contract Q99 {
/*
inline - 4개의 숫자를 받아서 가장 큰수와 작은 수를 반환하는 함수를 구현하세요.
*/

}

contract Q100 {
/*
inline - 4개의 숫자를 받아서 가장 큰수와 작은 수를 반환하는 함수를 구현하세요.
*/

}
