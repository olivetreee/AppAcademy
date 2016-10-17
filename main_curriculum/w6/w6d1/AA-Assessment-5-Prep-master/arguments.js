// Write a sum function that takes any number of arguments:

function mySum() {
  args = Array.from(arguments);
  return args.reduce((sum, num) => sum+= num)
}

console.log(mySum(1, 2, 3, 4) === 10);
console.log(mySum(1, 2, 3, 4, 5) === 15);
