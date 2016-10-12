function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`)
}

// madLib("make","best","chocolate")

function isSubstring(searchString, subString) {
  if (searchString.indexOf(subString) >=0) {
    return true;
  } else {
    return false
  }
}

// console.log(isSubstring("time to program", "time"))
// console.log(isSubstring("Jump for joy", "joys"))

function fizzBuzz(arr) {
  var result = [];
  for (i=0;i<=arr.length;i++) {
    if ((i%3 === 0 || i%5 === 0) && i%15 != 0) {
      result.push(i)
    }
  }
  return result
}

// console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]))

function isPrime(num) {
  for (var i=num-1;i>=2;i--) {
    if (num%i === 0) return false;
  }
  return true;
}

// console.log(isPrime(3))


function firstNPrimes(num) {
  var result = [];
  var factor = 1;
  while (result.length < num) {
    if (isPrime(factor)) result.push(factor);
    factor++;
  }
  return result
}

console.log(firstNPrimes(5))

function sumOfNPrimes(num) {
  return firstNPrimes(num).reduce ((sum,number) => sum+number);
}

console.log(sumOfNPrimes(5))
