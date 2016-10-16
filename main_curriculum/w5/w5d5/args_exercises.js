function sum() {
  numbers = Array.from(arguments);
  return numbers.reduce((sum,num) => sum + num)
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

function sumSplat(...args) {
  return args.reduce((sum,num) => sum + num)
}
// console.log(sumSplat(1, 2, 3, 4));

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

Function.prototype.myBind = function(obj) {
  return (...values) => {
    args = Array.from(arguments).concat(values); //Concat to pass both to apply function. If values is empty, all args are in arguments. Same for values.
    args.splice(0,1);
    this.apply(obj, args)
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!

function curriedSum(numArgs) {
  let numbers = [];

  // const _curriedSum = (num) => {

  // return (num) => _curriedSum(num)

  // return function(num) {
  //   return _curriedSum(num)
  // }

  return function _curriedSum(num) {  //We can return this too, but comment out the line above
    console.log(num);
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((sum, el) => sum+el);
    } else {
      return _curriedSum; //This has to be a function object, which will be called with the next set of parens. It shouldn't be the function invocation
    }
  }
  // return _curriedSum;
}
// console.log(curriedSum(2)(5)(30));
// const sums = curriedSum(4);
// console.log(curriedSum(3)(30)(20)(1)); // => 56
function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

Function.prototype.curry = function(numArgs) {
  let args = [];
  let that = this
  return function _argAdder(arg) {
    args.push(arg)
    // console.log(args);
    if (args.length === numArgs){
      return that.apply(null, args); //Similar to question from  before. Calling what would be the reduce (which is now defined as that) and applying that to null
    } else {
      return _argAdder;
    }
  }
}

Function.prototype.curry2 = function(numArgs) {
  let args = [];
  let that = this
  return function _argAdder(arg) {
    args.push(arg)
    // console.log(args);
    if (args.length === numArgs){
      return that(...args); //Similar to question from  before. Calling what would be the reduce (which is now defined as that) and passing it a spread operator
    } else {
      return _argAdder;
    }
  }
}

console.log(sumThree.curry(3)(4)(20)(6));
