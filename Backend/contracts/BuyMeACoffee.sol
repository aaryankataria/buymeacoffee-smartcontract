//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// Deployed to goerli at 0x6e1858f3F7c70Ca98F278f57fB0490548A3890BF

contract BuyMeACoffee {
    // Event for a memo
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message);
   
    // Memo struct

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    
    //Memo's recieved
    Memo[] memos;

    //Owner's Address
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function buyCoffee(string memory _name, string memory _message) public payable {
        require(msg.value > 0, "Cant buy with 0 eth.");

        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );

    }
    function withdrawTips() public {
        address(this).balance;
        require(owner.send(address(this).balance));
    }
    function getMemos() public view returns(Memo[] memory) {
        return memos;
    }
}
