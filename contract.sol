// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract coffee {


    struct Memos {
        string name;
        //this can accept any amount  
        string message;
        uint timestamp;
        address from;
    
    }

    Memos[] private memos;
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function  buymecoffee(string calldata name,string calldata message) external payable {
        require(msg.value > 0,"You need to pay more eth for coffee");
        owner.transfer(msg.value);  
        //after paying we need to push the entry into the memos array
        memos.push((Memos(name, message, block.timestamp, msg.sender)));
    }

    //for getting the memos

    function getmemos() public view returns(Memos[] memory){
        return memos;
    }

}