pragma solidity 0.5.16;

contract Contest{

   // creating structure to model the contestant

   struct Contestant{

   	uint id;
   	string name;
   	uint voteCount;
   }

   // use mapping to get or fetch contestant details

   mapping(uint=>Contestant) public contestants;

   // add a public state variable to keep track of contestant count

   mapping(address=>bool) public voters;
   uint public contestantCount;

    event votedEvent(
      uint indexed _contestantId
   );

   // add a function to add contestant

   constructor() public{
   	addContestant("Tom");
   	addContestant("Jerry");
   }

   function addContestant(string memory _name) private{
   	contestantCount++;
   	contestants[contestantCount]=Contestant(contestantCount,_name,0);
   }

   function vote(uint _contestantId)public{

      require(!voters[msg.sender]);

      // require that vote is casted to contestant

      require(_contestantId>0&&_contestantId<=contestantCount);
      contestants[_contestantId].voteCount++;
      voters[msg.sender]=true;

       emit votedEvent(_contestantId);
   }
} 