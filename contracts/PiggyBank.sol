// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract PiggyBank{

    struct Account{
        uint256 amount;
        uint256 unlocktime;
    }

    event Deposit(address indexed _user, uint256 _amount);
    event Withdraw(address indexed _user, uint256 _amount);
    mapping(address => Account)public accounts ;


    function deposit(uint256 _unlockTimeInSeconds)public payable {
        require(_unlockTimeInSeconds > 0,"can't unlock for zero");
        require(msg.value>0, "please send valid amount");
        accounts[msg.sender] = Account({amount: msg.value, unlocktime:block.timestamp+_unlockTimeInSeconds});

        emit Deposit(msg.sender, _unlockTimeInSeconds);


    }

function withdraw()public {
    require(accounts[msg.sender].amount >0 ,"no balance");
    require(block.timestamp> accounts[msg.sender].unlocktime,"can't withdraw");
   
   uint256 _amount = accounts[msg.sender].amount;
   accounts[msg.sender].amount = 0;
   payable(msg.sender).transfer(_amount);
   emit Withdraw(msg.sender,_amount);

}

function getRemainingTime()external  view returns (uint256){
    return accounts[msg.sender].unlocktime - block.timestamp;
}

}