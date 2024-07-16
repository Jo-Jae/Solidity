// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract TEST5 {

/*숫자를 시분초로 변환하세요.
예) 100 -> 1 min 40 sec
600 -> 10min 
1000 -> 16min 40sec
5250 -> 1hour 27min 30sec
3600 60
*/

    function getTime(uint _n) public pure returns(uint,string memory, uint, string memory,uint, string memory){
        if (_n >= 3600) {
            return ((_n/3600),"hour",(_n % 3600 / 60),"min",(_n % 60),"sec");
        } else if (_n >= 60) {
            return (0,"hour",( _n / 60) ,"min", (_n % 60) ,"sec");
        } else return (0,"hour",0,"min",_n,"sec");
    }

}