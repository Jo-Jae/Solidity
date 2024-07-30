// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract TEST12 {
/*
주차정산 프로그램을 만드세요. 주차시간 첫 2시간은 무료, 그 이후는 1분마다 200원(wei)씩 부과합니다. 
주차료는 차량번호인식을 기반으로 실행됩니다.
주차료는 주차장 이용을 종료할 때 부과됩니다.
----------------------------------------------------------------------
차량번호가 숫자로만 이루어진 차량은 20% 할인해주세요.
차량번호가 문자로만 이루어진 차량은 50% 할인해주세요.
*/
    
    enum Parking{
        IN,
        OUT
    }

    struct Car {
        string carNum;
        uint inTime;
        Parking status;
    }

    Car public parkingCar;
    Car[] public cars;



        function parkIn(string memory _carNum) public {
            // parkingCar.status = parkingCar.IN;
           
            cars.push(Car(_carNum, block.timestamp, parkingCar.In));
        }
 }   