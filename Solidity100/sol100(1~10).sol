// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Q1 {
    /* 
        더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환하는 계산기를 만드세요. 
    */

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    function sub(uint _a, uint _b) public pure returns(uint) {
        return _a - _b;
    }

    function mul(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }

    function div(uint _a, uint _b) public pure returns(uint) {
        return _a /_b;
    }

      function pow(uint _a) public pure returns(uint) {
        return _a **2;
    }


}

contract Q2 {
    /* 
        2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오. 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.
    */

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    function sub(uint _a, uint _b) public pure returns(uint) {
        return _a - _b;
    }

    function mul(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }

    function div(uint _a, uint _b) public pure returns(uint, uint) {
        return (_a / _b, _a % _b);
    }
}

contract Q3 {
    /* 
        1개의 Input값을 가지고 1개의 output값을 가지는 2개의 함수를 만드시오. 각각의 함수는 제곱, 세제곱을 반환합니다.
    */

    function pow(uint _a) public pure returns(uint) {
        return _a**2;
    }

    function pow2(uint _a) public pure returns(uint) {
        return _a**3;
    }
}

contract Q4 {
    /* 
        이름(string), 번호(uint), 듣는 수업 목록(string[])을 담은 student라는 구조체를 만들고 그 구조체들을 관리할 수 있는 array, students를 선언하세요.
    */

    struct student {
        string name;
        uint number;
        string[] sub;
    }

    student[] students;



}

contract Q5 {
    /* 
        아래의 함수를 만드세요
        1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
        4~6을 입력하면 입력한 수의 2배를 반환받습니다.
        7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.
    */

    function num(uint _a) public pure returns(uint) {
        if (_a<=3 && _a>=1) {
            return _a **2;
        } else if ( _a<=6 && _a >=4) {
            return _a*2;
        } else if (_a <= 9 && _a >= 7) {
            return _a % 3;
        }

    }

}

contract Q6 {
    /* 
        숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 9까지 자동으로 채우는 함수를 구현하세요.(for 문)
    */

    uint[] numbers;

    function push() public{
        uint i;

        for(i=0; i<=9; i++) {
           numbers.push(i);
        }
     }
}

contract Q7 {
    /* 
        숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 5까지 자동으로 채우는 함수와 array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)
    */
    uint[] numbers;

    function pushA() public {
        uint i;

        for(i=0; i<=5; i++){
            numbers.push(i);
        }
    }

    function sumA() public view returns(uint) {
        uint a;
        uint i;

        for(i=0; i<numbers.length; i++){
           a = a + numbers[i];
        } 
        return a;
    }
}

contract Q8 {
    /* 
        아래의 함수를 만드세요
        1~10을 입력하면 “A” 반환받습니다.
        11~20을 입력하면 “B” 반환받습니다.
        21~30을 입력하면 “C” 반환받습니다.
    */

    function grade(uint _a) public pure returns(string memory) {
    
        if (_a >=1 && _a<=10) {
            return "A";
        } else if (_a >= 11 && _a<=20) {
            return "B";
        } else if (_a >= 21 && _a<=30) {
            return "C";
        }
     }
}

        


contract Q9 {
    /* 
        문자형을 입력하면 bytes 형으로 변환하여 반환하는 함수를 구현하세요.
    */

    function change(string memory _a) public pure returns(bytes memory) {
        return bytes(_a);
    }
}

contract Q10 {
    /* 
        숫자만 들어가는 array numbers를 선언하고 숫자를 넣고(push), 빼고(pop), 특정 n번째 요소의 값을 볼 수 있는(get)함수를 구현하세요.
    */

    uint[] numbers;

    function pushA(uint _a) public {
        numbers.push(_a);
    }

    function popA() public {
        numbers.pop();
    }

     function getNumber(uint _a) public view returns(uint) {
        return numbers[_a-1];
     }
}


