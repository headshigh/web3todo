// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
contract todo{
    struct Task{
        uint id;
        string taskText;
        bool deleted;
    }
    Task [] private tasks;
    event AddTask(address recepient,uint taskid);
    event DeleteTask(uint taskId,bool deleted);
    mapping(uint=>address) taskToOwner;

    function addTask(string memory taskText,bool isDeleted) external  {
        uint id=tasks.length;
        tasks.push(Task(id,taskText,isDeleted));
        taskToOwner[id]=msg.sender;
        emit AddTask(msg.sender,id);
    }
    function deleteTask(uint taskId) public {
        require(taskId<tasks.length,"Index out of bounds");
        tasks[taskId].deleted=true;
        emit DeleteTask(taskId,true);
    }
     function getMyTasks() external view returns (Task[] memory) {
        Task[] memory temporary = new Task[](tasks.length);
        uint counter = 0;
        for(uint i=0; i<tasks.length; i++) {
            if(taskToOwner[i] == msg.sender && tasks[i].deleted == false) {
                temporary[counter] = tasks[i];
                counter++;
            }
        }

        Task[] memory result = new Task[](counter);
        for(uint i=0; i<counter; i++) {
            result[i] = temporary[i];
        }
        return result;
    }
}