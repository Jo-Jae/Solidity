// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Q11 {
    /*  uint 형이 들어가는 array를 선언하고, 짝수만 들어갈 수 있게 걸러주는 함수를 구현하세요.  */

    uint[] numbers;

    function pushEven(uint _n) public {
        if (_n % 2 == 0) {
        numbers.push(_n);
        }
    }

}

contract Q12 {
    /*  숫자 3개를 더해주는 함수, 곱해주는 함수 그리고 순서에 따라서 a*b+c를 반환해주는 함수 3개를 각각 구현하세요.  */

    function add(uint _a, uint _b, uint _c) public pure returns(uint) {
       return _a + _b + _c;
    }

    function mul(uint _a, uint _b, uint _c) public pure returns(uint) {
       return _a * _b * _c;
    }

    function cal(uint _a, uint _b, uint _c) public pure returns(uint) {
       return _a * _b + _c;
    }
}

contract Q13 {
    /*  3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.  */

    function a(uint _a) public pure returns(string memory) {
        if ( _a % 3 == 0) {
            return "A";
        } else if ( _a % 3 == 1) {
            return "B";
        } else if ( _a % 3 == 2) {
            return "C";
        }
    }
}

contract Q14 {
    /*  학번, 이름, 듣는 수험 목록을 포함한 학생 구조체를 선언하고 학생들을 관리할 수 있는 array를 구현하세요. 
    array에 학생을 넣는 함수도 구현하는데 학생들의 학번은 1번부터 순서대로 2,3,4,5 자동 순차적으로 증가하는 
    기능도 같이 구현하세요.  */

    struct student {
        string name;
        uint number;
        string[] class;
    }

    student[] students;

    function pushStudent(string memory _name, string[] memory _class) public {
      students.push(student(_name, students.length + 1, _class));
    }

    function getS() public view returns(student[] memory){
        return students;}

}

contract Q15 {
    /* 배열 A를 선언하고 해당 배열에 0부터 n까지 자동으로 넣는 함수를 구현하세요.   */

    uint[] A;

    function pushNum(uint _n) public {
        uint i;

        for (i=0; i < _n + 1; i++) {
            return A.push(i);
        }
    }

}

contract Q16 {
    /*  숫자들만 들어갈 수 있는 array를 선언하고 해당 array에 숫자를 넣는 함수도 구현하세요. 
    또 array안의 모든 숫자의 합을 더하는 함수를 구현하세요.  */

    uint[] num;

    function pushNum(uint _n) public {
        num.push(_n);
    }

    function sumNum() public view returns(uint){
        uint a;
        uint i;

        for(i=0; i < num.length + 1; i++) {
            a = a + num[i];
        }
        return a;
    }
}

contract Q17 {
    /*  string을 input으로 받는 함수를 구현하세요. 
    이 함수는 true 혹은 false를 반환하는데 Bob이라는 이름이 들어왔을 때에만 true를 반환합니다.   */

    function a(string memory _name) public pure returns(bool) { 
       if (keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Bob"))) { 
            return true;
       }
        return false;
       }
    }


contract Q18 {
    /*  이름을 검색하면 생일이 나올 수 있는 자료구조를 구현하세요. 
    (매핑) 해당 자료구조에 정보를 넣는 함수, 정보를 볼 수 있는 함수도 구현하세요.  */

    mapping(string => string) birth;

    function setbirth(string memory _name, string memory _birth) public {
        birth[_name] = _birth;
    }

    function getbirth(string memory _name) public view returns(string memory){
        return birth[_name];
    }
}

contract Q19 {
    /*  숫자를 넣으면 2배를 반환해주는 함수를 구현하세요. 
    단 숫자는 1000이상 넘으면 함수를 실행시키지 못하게 합니다.  */

    function twice(uint _n) public pure returns(uint){
      require(_n<1000, "Less than 1000");
            return _n*2;
        } 
    }


contract Q20 {
    /*  숫자만 들어가는 배열을 선언하고 숫자를 넣는 함수를 구현하세요. 
    15개의 숫자가 들어가면 3의 배수 위치에 있는 숫자들을 초기화 시키는(3번째, 6번째, 9번째 등등) 함수를 구현하세요. 
    (for 문 응용 → 약간 까다로움)  */
    
    //문제에 대한 질문이 있습니다
    //숫자가 15개까지만 들어가는 건가요.. 
    //15개 이상이 들어갈 수 있는데 숫자 15개마다 3의배수 자리에 있는 것들만 초기화 하는건가요?

    uint[] num;

    function pushNum(uint _n) public {
        num.push(_n);
    }

    function pushNum2() public{
        uint i;

        for (i=1; i<16; i++){
            num.push(i);
        }
    }
//15개의 숫자가 들어가면 3의 배수 위치에 있는 숫자들을 초기화 시키는(3번째, 6번째, 9번째 등등) 함수를 구현
    function setNum() public { //어찌저찌해서 풀었는데 맞는 풀이인지는 도저히 모르겠음... 
        uint i;

     if (num.length == 15){
       for(i=2; i < num.length; i+=3){
          delete num[i];
            }
       }
    }

    function getNum() public view returns(uint[] memory) {
        return num;
    }

     function getNum2() public view returns(uint) {
        return num.length;
    }
}