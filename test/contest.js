var Contest=artifacts.require("./Contest.sol");

contract("Contest",function(accounts){

	// to check if initialized correctly
	it("initializes with two contestants",function(){
		return Contest.deployed().then(function(instance){
			return instance.contestantCount();
		}).then(function(count){
			assert.equal(count,2);
		});
	});

	it("it initializes the contestants with correct values",function(){
		return Contest.deployed().then(function(instance){
			contestInstance=instance;
			return contestInstance.contestants(1);
		}).then(function(contestant){
			assert.equal(contestant[0],1,"correct id");
			assert.equal(contestant[1],"Tom","correct name");
			assert.equal(contestant[2],0,"vote count correct");

			return contestInstance.contestants(2);
		}).then(function(contestant){
			assert.equal(contestant[0],2,"correct id");
			assert.equal(contestant[1],"Jerry","correct name");
			assert.equal(contestant[2],0,"vote count correct");

			// return contestInstance.contestants(2);
	});
	});

});
