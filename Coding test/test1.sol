// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract TEST1 {
/*여러분은 선생님입니다. 학생들의 정보를 관리하려고 합니다. 
학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.

번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.

학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.

필요한 기능들은 아래와 같습니다.

* 학생 추가 기능 - 특정 학생의 정보를 추가
* 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
* 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
* 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
* 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
* 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
* 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
* 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
* 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
-------------------------------------------------------------------------------
* S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)

기입할 학생들의 정보는 아래와 같습니다.

Alice, 1, 85
Bob,2, 75
Charlie,3,60
Dwayne, 4, 90
Ellen,5,65
Fitz,6,50
Garret,7,80
Hubert,8,90
Isabel,9,100
Jane,10,70*/

struct student {
    string name;
    uint num;
    uint score;
    string grade;
    string[] class;
}

student[] Students;

//* 학생 추가 기능 - 특정 학생의 정보를 추가
    function pushStudent(string memory _name, uint _score, string[] memory _class) public {
        Students.push(student(_name, Students.length, _score, setGrade(_score), _class));
    }


    function setGrade(uint _score) public pure returns(string memory){
        if ( _score <= 100 && _score >= 90 ) {
            return "A";
        } else if ( _score < 90  && _score >= 80 ) {
            return "B";
        } else if ( _score < 80  && _score >= 70 ) {
            return "C";
        } else if  ( _score < 70  && _score >= 60 ) {
            return "D";
        } else {
            return "F";
        }
    }

    mapping(string => student[]) students1;
    mapping(uint => student[]) students2;
    mapping(string => student) students3;
    mapping(uint => student) students4;

//* 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getstudentNum(uint _num) public view returns(student[] memory) {
        return students2[_num];
    }

//* 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getstudentName(string memory _name) public view returns(student[] memory) {
        return students1[_name];
    }

//* 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getScore(string memory _name) public view returns(uint) {
        return students3[_name].score;
    } // 잘 모르겠음..

//* 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getLength() public view returns(uint) {
        return Students.length;
    }

//* 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudent() public view returns(student[] memory) {
        return Students;
    }


//* 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
     function getScores(uint i) public view returns(uint) {
        return students4[i].score;
    }

    function Average() public view returns(uint) {
        uint sum;
        uint i;

        for (i=0; i<Students.length + 1; i++) {
         sum = sum + getScores(i);
        }
        return sum / Students.length;
    } //잘 모르겠음..


//* 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환

    function teach() public view returns(bool){
        if (Average() >= 70) {
            return true;
        } else {
            return false;
        }
    } 

//* 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환

    function GradeF() public view returns(uint, student[] memory){
        uint a; // f학점받은 학생 수 설정
        uint i;

        for (i=0; i<Students.length + 1; i++ )
          if (keccak256(abi.encodePacked(students4[i].grade)) == keccak256(abi.encodePacked("F"))) {
            return 
          }
    }
}





//해설

  struct Student {
    string name;
    uint num;
    uint score;
    string grade;
    string[] class;
}

Student[] Students;

//* 학생 추가 기능 - 특정 학생의 정보를 추가
    function pushStudent(string memory _name, uint _score, string[] memory _class) public {
        Students.push(student(_name, Students.length + 1, _score, setGrade(_score), _class));
    } //length +1을 안함..



    function setGrade(uint _score) public pure returns(string memory){ //internal로 내부에서만 확인하면 좋음
        if ( score >= 90 ) {
            return "A";
        } else if (  _score >= 80 ) {
            return "B";
        } else if ( _score >= 70 ) {
            return "C";
        } else if  (_score >= 60 ) {
            return "D";
        } else {
            return "F";
        }
    }

    mapping(string => student[]) students1;
    mapping(uint => student[]) students2;
    mapping(string => student) students3;
    mapping(uint => student) students4;

//* 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
    function getstudentNum(uint _num) public view returns(Student memory) {
        return students2[_num];
    }

//* 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
    function getstudentName(string memory _name) public view returns(Student memory) {
       for(uint i=0; i<students.length; i++) {
        if(keccak256(abi.encodePacked(_name)==keccak256(abi.encodePacked(students[i].name))) {
            return students[i];
        }
       }
    }

contract STRING {
    function hash(string memory _name) public pure return(bytes32){
        return keccak256(abi.encodePacked(_name));
    }
    function hash_string(string memory _n) public view returns(bool){
        if(keccak256(abi.encodePacked(_n)==keccak256("alice"))) {
            return true;
        } else {
            return false;
        }
    }
}

//* 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
    function getScore(string memory _name) public view returns(uint) {
        return students3[_name].score;
    } // 잘 모르겠음..

//* 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
    function getLength() public view returns(uint) {
        return Students.length;
    }

//* 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
    function getAllStudent() public view returns(student[] memory) {
        return Students;
    }


//* 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
     function getScores(uint i) public view returns(uint) {
        return students4[i].score;
    }

    function Average() public view returns(uint) {
        uint sum;
        uint i;

        for (i=0; i<Students.length; i++) {
         sum = sum + getScores(i);
        }
        return sum / Students.length;
    } //잘 모르겠음..


//* 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환

    function teach() public view returns(bool){
        if (Average() >= 70) {
            return true;
        } else {
            return false;
        }
    } 

//* 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환

    function GradeF() public view returns(uint, student[] memory){
        uint f=0; // f학점받은 학생 수 설정


        for (i=0; i<Students.length + 1; i++ )
          if (keccak256(abi.encodePacked(students4[i].grade)) == keccak256(abi.encodePacked("F"))) {
            return 
          }
    }
}


contract ARRAY { //어레이를 지역변수로 다루기 1. 길이가 정해진 어레이 2. 동적이지만 나중에 길이를 정해주는 것
    function setArray(uint _n) public pure returns(uint[] memory) { //오류
        uint[] memory numbers;
        numbers.push(_n);
        return numbers;
    }

     function setArray(uint _n) public pure returns(uint[] memory) {//오류 정적어레이에 푸시 불가능
        uint[4] memory numbers;
        numbers.push(_n);
        return numbers;
    }

     function setArray(uint _n) public pure returns(uint[] memory) { //가능
        uint[4] memory numbers;
        numbers[0] = _n;
        return numbers;
    }

    function setArray2() public pure returns(uint[] memory){
        uint[] memory numbers = new uint[] (_n); //동적배열을 선언. 길이가 _n인 배열.
        //numbers.push() //불가
}
