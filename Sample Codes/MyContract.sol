pragma solidity >=0.5.1 <0.6.0;

contract MyContract {
    // Value is stored on the block chainm
    string public constant stringValue = "myValue"; // public provides a free getter
    bool public myBool = true;
    int public myInt = -1;
    uint public myUint = 1;
    uint8 public myUint8 = 8;
    uint256 public myUint256 = 99999;

    // Use of enum
    enum State { Waiting, Ready, Active }
    State public state;

    // Use of Struct
    Person [] public people;
    uint256 public peopleCount;
    struct Person {
        string _firstName;
        string _lastName;
    }

    // Use of mapping
    mapping(uint => Human) public Humans;
    uint256 public humanCount;
    address owner;
    uint256 openingTime = 1564068993;

    modifier onlyOwner () {
        // Evalutes false, an error will be thrown
        require(msg.sender == owner);
        _;
    }

    modifier onlyWhileOpen() {
         require(block.timestamp >= openingTime);
        _;
    }

    struct Human {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() public {
        state = State.Waiting;
        owner = msg.sender;
    }

    function activate() public {
        state = State.Active;
    }

    function isActive() public view returns (bool) {
        return state == State.Active;
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
        people.push(Person(_firstName, _lastName));
        peopleCount += 1;
    }

    //  Function can only be called after opening time
    function addHuman(string memory _firstName, string memory _lastName) public onlyWhileOpen {
        incrementCount();
        Humans[humanCount] = Human(peopleCount, _firstName, _lastName);
    }

    // Only accessible within the contract
    function incrementCount() internal {
        humanCount +=1;
    }
}
