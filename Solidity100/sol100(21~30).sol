// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Q21 {
    /* 
        3의 배수만 들어갈 수 있는 array를 구현하세요.
    */

    uint[] num;

    function setNum(uint _n) public{

    if( _n % 3 == 0 ){
        num.push(_n);
    } 
    }

    function getNum() public view returns(uint[] memory){
        return num;
    }
}

contract Q22 {
    /* 
        뺄셈 함수를 구현하세요. 
        임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.    
        예) 2,5 input → 5-2=3(output)
    */

    function Min(uint _a, uint _b) public pure returns(uint) {
        if( _a > _b) {
            return _a - _b;
        } else {
            return _b - _a;
        }
    }
}

contract Q23 {
    /* 
        3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
    */

    function Grade(uint _a) public pure returns(string memory) {
        if (_a % 3 == 0){
            return "A";
        } else if (_a % 3 == 1) {
            return "B";
        } else if (_a % 3 == 2) {
            return "C";
        }
    }
}

contract Q24 {
    /* 
        string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
    */

    //간단하게바꾸기...
    function a(string memory _name) public pure returns(bool) { 
       if (keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Alice"))) { 
            return true;
       }
        return false;
       }
    }
    

contract Q25 {
    /* 
        배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요.  
    */

    uint[] A;

    function setNum() public {
        uint i;
        uint n;

        for(i=0; i < n; i++) {
            A.push(i);
        }
    }
}

contract Q26 {
    /* 
        홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 숫자를 넣었을 때 
        자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
    */

    uint[] odd;
    uint[] even;

    function setA(uint _n) public {
        if (_n % 2 == 0) {
            even.push(_n);
        } else {
            odd.push(_n);
        }
    }

    function getOdd() public view returns(uint[] memory) {
        return odd;
    }

     function getEven() public view returns(uint[] memory) {
        return even;
    }
}

contract Q27 {
    /* 
        string과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요. 해당 mapping에 정보를 넣고, 
        지우고 불러오는 함수도 같이 구현하세요. 
    */

    mapping (string => bytes32) m;

    function setM(string memory _a) public view returns(bytes32){
       return m[_a]; 
    }
}

contract Q28 {
    /* 
        ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
    */

    function hash(string memory _ID, string memory _PW) public pure returns(bytes32){
       return keccak256(abi.encodePacked(string.concat(_ID,_PW)));
    }
}

contract Q29 {
    /* 
        숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
    */
    
    //질문.. 'A의 값으로 배포 직후 설정', 이 문장이 이해가 잘 안갑니다
    uint a;
    string b;
    string c;

    constructor (string memory _A) {
        a = 10;
        b = "10";
        c = _A;
    }

    function getC() public view returns(string memory) {
        return c;
    }
}

contract Q30 {
    /* 
        10. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
        (sorting 코드 응용 → 약간 까다로움)    
        예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
    */

    uint[] num;
    uint[] num2 = [2,6,7,4,5,1,9];

    function pushNum(uint _a) public {
        num.push(_a);
    }

  

     function decending() public view returns(uint[] memory) {
        uint[] memory _num = num;
        for(uint i=0; i<num.length; i++) {
            for(uint j=i+1; j<num.length; j++) {
                if(_num[i] < _num[j]) {
                    (_num[i], _num[j]) = (_num[j], _num[i]);
                }
            }
        }

        return _num;
    }
}