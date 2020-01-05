pragma solidity ^0.4.17;

contract MultiAuth{
    
    address public requester;
    address public receiver; 
    approval[] public approvers;
    int n;
    
    constructor(address[] approversList, address receivedBy) public payable{
        
        requester = msg.sender;
        receiver = receivedBy;
        for(uint256 i=0;i<approversList.length;i++)
        {
            approval storage a;
            a.approver = approversList[i];
            a.isApproved = false;
            
            approvers.push(a);
        }
    } 
    
    function approve() public payable{
        bool isAllApproved=true;
        for(uint256 i=0;i<approvers.length;i++)
        {
            if(approvers[i].approver == msg.sender)
                approvers[i].isApproved = true;
            
            if(!approvers[i].isApproved)
                isAllApproved = false;
                
            
        }
        if(isAllApproved)   
              receiver.transfer(this.balance);  
    } 
    
    function getContractBalance() constant public returns(uint) {
     return this.balance;
    }
    
    struct approval{
        address approver;
        bool isApproved;
    }
}