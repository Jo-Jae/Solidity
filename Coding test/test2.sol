// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Test2 {
/* 학생 점수관리 프로그램입니다.
여러분은 한 학급을 맡았습니다.
학생은 번호, 이름, 점수로 구성되어 있고(구조체)
가장 점수가 낮은 사람을 집중관리하려고 합니다.

* 가장 점수가 낮은 사람의 정보를 보여주는 기능,
* 총 점수 합계, 총 점수 평균을 보여주는 기능,
* 특정 학생을 반환하는 기능 -> 학생 정보
---------------------------------------------------
* 가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)*/

struct student {
    string name;
    uint num;
    uint score;
}

student[] students;

   
    mapping(uint => student[]) students2;
    mapping(string => student) students3;
    mapping(uint => student) students4;

//가장 점수가 낮은 사람의 정보를 보여주는 기능
    function lowscore() public view returns(student memory) {
        uint a;
        uint i;

          for (i=0; i<students.length + 1; i++ )
        {   while (students(i).score < students(i+1).score}){
            
        }
    }//갈피를 못잡겠음..


//총 점수 합계, 총 점수 평균을 보여주는 기능
    function getScores(uint i) public view returns(uint) {
        return students4[i].score;
    }

    function Average() public view returns(uint) {
        uint sum;
        uint i;

        for (i=0; i<students.length + 1; i++) {
         sum = sum + getScores(i);
        }
        return sum / students.length;
    }


//특정 학생을 반환하는 기능 -> 학생 정보

    function getstudentNum(uint _num) public view returns(student[] memory) {
        return students2[_num];
    }

   
//학생 전체를 반환하는 기능
    function getAllStudent() public view returns(student[] memory) {
        return students;
    }

}