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

import "openzepplin/contracts/utils/Strings.sol";

contract BASE {
    function S_concat(string memory _a, string memory _b) public pure returns(string memory){
        return string.concat(_a,_b);
    }
}

contract Test5 {

    function convert(uint _n) public pure returns(uint, uint, uint) {
        return (_n/3600, (_n%3600)/60, _n%60);
    }

    function getHMS(uint  _n) public pure returns(string memory){
        (uint a, uint b, uint c) = convert(_n);
        return string(abi.encodePacked(Strings.toString(a), uincode"시간", Strings.toString(b), uincode"min", Strings.toString(c), unicode"sec");

    }


}