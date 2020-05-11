pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; // CEO
    address payable employee_two; // CTO
    address payable employee_three; // BOB

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        // Step 2: Add the `amount` to `total` to keep a running total
        // Step 3: Transfer the `amount` to the employee
        amount = points * 60; 
        total += amount;
        employee_one.transfer(amount);
        // @TODO: Repeat the previous steps for `employee_two` and `employee_three`    
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);


        employee_one.transfer(msg.value - total); // CEO gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
// address payable employee_one = 0x0C92DD2D2AB724B399De63F0a8AeE732d81c1369; Ganaache Index 5 / CEO
// address payable employee_two = 0x7440Cc49CE3F22f8501d4aea76f6Da2a59Bc03a5; Ganaache Index 6 / CTO
// address payable employee_three = 0x0b624d7518e0BC1E284B29AF338c1894C543BbE5  Ganaache Index 7 / BOB