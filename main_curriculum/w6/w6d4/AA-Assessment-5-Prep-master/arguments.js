// Write a sum function that takes any number of arguments:

function mySum() {
  arr = Array.prototype.slice.call(arguments);
  return arr.reduce((sum, num) => sum+=num);
}

// console.log(mySum(1, 2, 3, 4) === 10);
// console.log(mySum(1, 2, 3, 4, 5) === 15);



//Write a curriedSum function that takes an integer (how many numbers to sum) and returns a function that can be successively called with single arguments until it finally returns a sum. That is:

// has outer function (main) and inner function
// inner function takes in the new number
// when numArr is big enough, return the sum or function passed in

function curriedSum(num) {
  let numbers = [];

  const _curriedSum = function(arg) {
    numbers.push(arg);
    if (numbers.length === num) {
      return numbers.reduce((sum, el) => sum+=el);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// console.log(curriedSum(4)(3));
const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

// Add curried sum to Function.prototype

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

Function.prototype.curriedApplied = function(num) {
  numbers = [];
  debugger;
  callerFunction = this;
  const innerCurry = function(arg) {
    numbers.push(arg);
    if (numbers.length === num) {
      return callerFunction.apply(this, numbers);
    } else {
      return innerCurry;
    }
  }
  return innerCurry;
}

console.log(sumThree.curriedApplied(3)(30)(20)(1));
