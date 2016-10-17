// Create an unique method for arrays
//

function myUniq(arr) {
  result = [];
  arr.forEach((el) => {
    if (!result.includes(el)) result.push(el);
  })
  return result;
}
console.log(myUniq([1, 1, 2, 2, 3, 3, 4, 4, 5, 5]) === [1,2,3,4,5]); // [1,2,3,4,5]

// Write a unique method for arrays directly on the array class
//

Array.prototype.myUnique = function () {
  return myUniq(this);
}

console.log([1, 1, 2, 2, 3, 3, 4, 4, 5, 5].myUnique() === [1, 2, 3, 4, 5]); // [1,2,3,4,5]


// Write a new twoSum(Array) method that finds all pairs of
// positions where the elements at those positions sum to zero.
//
//

function twoSum(arr) {
  result = [];
  for (let i=0; i<arr.length-1; i++) {
    for (let j=i+1; j<arr.length; j++) {
      if (arr[i] + arr[j] === 0) result.push([i, j])
    }
  }
  return result
}

console.log(twoSum([-1, 0, 2, -2, 1]) === [[0, 4], [2, 3]]); // => [[0, 4], [2, 3]]

// Write a Two sum

Array.prototype.twoSum = function () {
  return twoSum(this);
}

console.log([-1, 0, 2, -2, 1].twoSum()); // => [[0, 4], [2, 3]]

// Write a method, my_transpose, which will convert between the
// row-oriented and column-oriented representations.
//
//

function myTranspose(arr) {

}

console.log(myTranspose([
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8]
 ]));
// => [[0, 3, 6],
//    [1, 4, 7],
//    [2, 5, 8]]
