// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract Q81 {
/*
Contract에 예치, 인출할 수 있는 기능을 구현하세요. 
지갑 주소를 입력했을 때 현재 예치액을 반환받는 기능도 구현하세요.  
*/
    mapping(address => uint) balance;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

     function viewDeposit() public view returns(uint) {
        return balance[msg.sender];
    }

    function withdraw(address _addr) public {
        require(msg.sender == _addr);
        payable(_addr).transfer(viewDeposit());
    }
}

contract Q82 {
/*
특정 숫자를 입력했을 때 그 숫자까지의 3,5,8의 배수의 개수를 알려주는 함수를 구현하세요.
*/

    function getNum(uint n) public pure returns(uint,uint,uint) {
        return (n/3 , n/5 , n/8 );
    }

}

contract Q83 {
/*
이름, 번호, 지갑주소 그리고 숫자와 문자를 연결하는 mapping을 가진 구조체 사람을 구현하세요. 
사람이 들어가는 array를 구현하고 array안에 push 하는 함수를 구현하세요.
*/
    struct A {
        string name;
        uint number;
        address addr;
        mapping(uint => string) b;
    }

    A[] As;

    function pushA() public {
        As.push();
    }
}

contract Q84 {
/*
2개의 숫자를 더하고, 빼고, 곱하는 함수들을 구현하세요. 
단, 이 모든 함수들은 blacklist에 든 지갑은 실행할 수 없게 제한을 걸어주세요.
*/

    address[] blacklist;



    function add(uint a, uint b) public view returns(uint) {
      

     

    }
}

contract Q85 {
/*
숫자 변수 2개를 구현하세요. 한개는 찬성표 나머지 하나는 반대표의 숫자를 나타내는 변수입니다. 
찬성, 반대 투표는 배포된 후 20개 블록동안만 진행할 수 있게 해주세요.
*/

    uint a;
    uint b;

    function vote(string memory _IsAgree) public {
        require(block.number +20 > block.number);

        if (keccak256(abi.encodePacked(_IsAgree)) == keccak256(abi.encodePacked("yes"))) {
            a++;
        } else if ((keccak256(abi.encodePacked(_IsAgree)) == keccak256(abi.encodePacked("no")))) {
            b++;
        }

    }

}

contract Q86 {
/*
숫자 변수 2개를 구현하세요. 한개는 찬성표 나머지 하나는 반대표의 숫자를 나타내는 변수입니다. 
찬성, 반대 투표는 1이더 이상 deposit한 사람만 할 수 있게 제한을 걸어주세요.
*/

    uint a;
    uint b;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    mapping(address => uint) balance;

    function vote(string memory _IsAgree) public {
        require(balance[msg.sender] > 1 ether);

          if (keccak256(abi.encodePacked(_IsAgree)) == keccak256(abi.encodePacked("yes"))) {
            a++;
        } else if ((keccak256(abi.encodePacked(_IsAgree)) == keccak256(abi.encodePacked("no")))) {
            b++;
        }
    }

}

contract Q87 {
/*
visibility에 신경써서 구현하세요.   
숫자 변수 a를 선언하세요. 해당 변수는 컨트랙트 외부에서는 볼 수 없게 구현하세요. 
변화시키는 것도 오직 내부에서만 할 수 있게 해주세요.
*/

    uint internal a;

    function setA(uint _a) internal{
       a = _a;
    }

    function changeA(uint _a) public {
        setA(_a);
    }
    

}





contract OWNER {
	address private owner;

	constructor() {
		owner = msg.sender;
	}

    function setInternal(address _a) internal {
        owner = _a;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}

contract Q88 is OWNER {
/*
아래의 코드를 보고 owner를 변경시키는 방법을 생각하여 구현하세요.

contract OWNER {
	address private owner;

	constructor() {
		owner = msg.sender;
	}

    function setInternal(address _a) internal {
        owner = _a;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}
힌트 : 상속
*/

    function changeOwner(address _addr) public returns(address) {
        setInternal(_addr);
    }

}

contract Q89 {
/*
이름과 자기 소개를 담은 고객이라는 구조체를 만드세요. 
이름은 5자에서 10자이내 자기 소개는 20자에서 50자 이내로 설정하세요. 
(띄어쓰기 포함 여부는 신경쓰지 않아도 됩니다. 더 쉬운 쪽으로 구현하세요.)
*/

    struct User {
        string name;
        string introduce;
    }

    User s1;
    function setUser(string memory _name, string memory _introduce) public {
        require(bytes(_name).length <=10 && bytes(_name).length >= 5);
        require(bytes(_introduce).length <= 50 && bytes(_introduce).length >= 20 );

        s1 = User(_name, _introduce);
    }

}

contract Q90 {
/*
당신 지갑의 이름을 알려주세요. 아스키 코드를 이용하여 byte를 string으로 바꿔주세요.
*/

}