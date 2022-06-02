pragma solidity ^0.4.16;

import "./score.sol";

interface Medal {
    function awardItem(address player, string memory tokenURI) public returns (uint256);
}

contract Sport is Score(100000000) {

    uint constant walkingC = 405;
    uint constant runningC = 677;
    uint constant bikingC = 415;
    uint constant swimmingC = 550;
    uint constant fitnessTrainingC = 660;

    Medal medalContract;

    function Sport(address medal) {
        medalContract = Medal(medal);
    }

    function _scoreDistribution(uint calories) private {
        _transfer(this, msg.sender, 10 * (calories / 100));
    }

    function exchange() external payable {
        transfer(this, 1000);
        medalContract.awardItem(msg.sender, "");
    }

    function doWalking(uint time) external {
        uint calories = walkingC * time;
        _scoreDistribution(calories);
    }
    function doRunning(uint time) external {
        uint calories = runningC * time;
        _scoreDistribution(calories);
    }
    function doBiking(uint time) external {
        uint calories = bikingC * time;
        _scoreDistribution(calories);
    }
    function doSwimming(uint time) external {
        uint calories = swimmingC * time;
        _scoreDistribution(calories);
    }
    function doFitnessTraining(uint time) external {
        uint calories = fitnessTrainingC * time;
        _scoreDistribution(calories);
    }

}
