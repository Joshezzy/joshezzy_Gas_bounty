// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10]; //fixed size
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        uint sum = 0;
        uint length = numbers.length;  // to Cache the state variable
        for (uint i = 0; i < length; i++) {
            unchecked { // this unchecked block is to skip integer overflow checks
                sum += numbers[i];
            }
            numbers[i] = 0; // resets the element in the fixedSizeNumbers array to 0 after adding it to the sum.
        }
    }
}
    // For Loop Increment Syntax
    // Using a different for loop increment syntax can help reduce gas consumption.
    // In this example, we use a while loop with manual increment.
    /*function optimizedFunction() public {
        uint256 sum = 0; // Corrected data type to uint256
        uint256 length = numbers.length;
        uint i = 0;
        while (i < length) {
            unchecked { // Use unchecked block to skip integer overflow checks
                sum += numbers[i];
            }
            numbers[i] = 0; // Reset the element in the fixedSizeNumbers array to 0 after adding it to the sum.
            i++; // Manually increment the loop counter
        }
    }*/
 
