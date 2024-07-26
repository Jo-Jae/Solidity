// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

/*은행에 관련된 어플리케이션을 만드세요.
은행은 여러가지가 있고, 유저는 원하는 은행에 넣을 수 있다. 
국세청은 은행들을 관리하고 있고, 세금을 징수할 수 있다. 
세금은 간단하게 전체 보유자산의 1%를 징수한다. 세금을 자발적으로 납부하지 않으면 강제징수한다. 

* 회원 가입 기능 - 사용자가 은행에서 회원가입하는 기능
* 입금 기능 - 사용자가 자신이 원하는 은행에 가서 입금하는 기능
* 출금 기능 - 사용자가 자신이 원하는 은행에 가서 출금하는 기능
* 은행간 송금 기능 1 - 사용자의 A 은행에서 B 은행으로 자금 이동 (자금의 주인만 가능하게)
* 은행간 송금 기능 2 - 사용자 1의 A 은행에서 사용자 2의 B 은행으로 자금 이동
* 세금 징수 - 국세청은 주기적으로 사용자들의 자금을 파악하고 전체 보유량의 1%를 징수함. 세금 납부는 유저가 자율적으로 실행. 
  (납부 후에는 납부 해야할 잔여 금액 0으로)
-------------------------------------------------------------------------------------------------
* 은행간 송금 기능 수수료 - 사용자 1의 A 은행에서 사용자 2의 B 은행으로 자금 이동할 때 
A 은행은 그 대가로 사용자 1로부터 1 finney 만큼 수수료 징수.
* 세금 강제 징수 - 국세청에게 사용자가 자발적으로 세금을 납부하지 않으면 강제 징수. 
은행에 있는 사용자의 자금이 국세청으로 강제 이동
*/


contract A_Bank {
    mapping(address => uint) Abalance;

     function deposit(address bank_addr) public payable virtual{
        Abalance[msg.sender] += msg.value;
    }

    function viewDeposit() public view virtual returns(uint) {
        return Abalance[msg.sender];
    }

    function withDraw( uint _n) public virtual{
        require(Abalance[msg.sender] >= _n, "nope");
        Abalance[msg.sender] -= _n;
        payable(msg.sender).transfer(_n);
    }

}

contract B_Bank {
    mapping(address => uint) Bbalance;

     function deposit(address bank_addr) public payable virtual{
        Bbalance[msg.sender] += msg.value;
    }

    function viewDeposit() public view virtual returns(uint) {
        return Bbalance[msg.sender];
    }

    function withDraw( uint _n) public virtual{
        require(Bbalance[msg.sender] >= _n, "nope");
        Bbalance[msg.sender] -= _n;
        payable(msg.sender).transfer(_n);
    }

}

contract A_tax is A_Bank,B_Bank{

    function deposit() public payable {}


    function viewDepositA() public view override(A_Bank,B_Bank) returns(uint) {
        return A_Bank.Abalance[msg.sender];
    }

     function viewDepositB() public view override(A_Bank,B_Bank) returns(uint) {
        return  B_Bank.Bbalance[msg.sender];
    }


    function withDrawA() public override(A_Bank,B_Bank){
        require(Abalance[msg.sender] > 0, "nope");
        Abalance[msg.sender] -= Abalance * 99 / 100;
        payable(msg.sender).transfer(Abalance * 99 / 100);
    }
    
    function withDrawB() public override(A_Bank,B_Bank){
        require(Bbalance[msg.sender] > 0, "nope");
        Bbalance[msg.sender] -= Bbalance * 99 / 100;
        payable(msg.sender).transfer(Bbalance * 99 / 100);
    }
}

contract User{

    mapping(address => mapping(address => uint)) balance;

    function deposit(address _addr) public payable {
        balance[_addr][msg.sender] += msg.value;
    }

    function viewDeposit(address _addr) public view returns(uint) {
        return balance[_addr][msg.sender];
    }

    function withDraw(address _addr, uint _n) public {
        require(balance[_addr][msg.sender] >= _n, "nope");
        balance[_addr][msg.sender] -= _n;
        payable(msg.sender).transfer(_n);
    }



}


