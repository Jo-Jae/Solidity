// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract IRS {
    address[] BankList;

    function pushList(address _addr) public {
        BankList.push(_addr);
    }

    function getList() public view returns(address[] memory) {
        return BankList;
    }

    function predict() public view returns(uint) {
        uint sum;

        for(uint i=0; i<BankList.length; i++) {
            sum += Bank(payable (BankList[i])).getUser(msg.sender).balance;
        }
        return sum / 100;
    }



    function payTaxes() public payable {
        require(msg.value == predict(), "nope") ;

        for(uint i=0; i<BankList.length; i++){
            Bank(payable (BankList[i])).users(msg.sender).paid;
        }
    }
 }


contract Bank {
    struct User {
        address _addr;
        uint balance;
    }

    receive() external payable { }

    constructor(address _addr) {
        IRS(_addr).pushList(address(this));
       // (bool success, ) =  _addr.call(abi.encodeWithSignature("pushList(address)", address(this)));

    }

    mapping(address => User) public users;

    function getUser(address _addr) public view returns(User memory) {
        return users[_addr];
    }

    function signUp() public {
        users[msg.sender] = User(msg.sender, 0);
    }

    function deposit() public payable {
        users[msg.sender].balance += msg.value;
    }

    function _deposit(address _addr, uint _n) public {
        users[_addr].balance += _n;
    }

    function withDraw(uint _n) public {
        require(users[msg.sender].balance >= _n, "Not enough funds");
        users[msg.sender].balance -= _n;
        payable(msg.sender).transfer(_n);
    }

    // 은행간 송금 기능 1 - 사용자의 A 은행에서 B 은행으로 자금 이동 (자금의 주인만 가능하게)
    function transfer1(address payable _to, uint _n) public {
        // 조건
        require(Bank(_to).getUser(msg.sender)._addr != address(0));
        users[msg.sender].balance -= _n;
        _to.transfer(_n);
        // 잔액 변화
        Bank(_to)._deposit(msg.sender, _n);
    }

    function transfer2(address payable _bank, address _user, uint _n) public {
        require(Bank(_bank).getUser(_user)._addr != address(0));
        users[msg.sender].balance -= _n;
        _bank.transfer(_n);
        Bank(_bank)._deposit(_user, _n);
    }
}