// Recursion Practice

// Write a recursive method, range, that takes a start and an end and
// returns an array of all numbers between.
//

function range(start, end) {

}

// console.log(range(1,10)); // [2,3,4,5,6,7,8,9]

// Write a recursive and an iterative Fibonacci method.
// The method should take in an integer n and return the first n Fibonacci
// numbers in an array.
//

function fib(n) {

}

// console.log(fib(6)) // [1,1,2,3,5,8]


// Write a recursive Binary Search. Note that binary search only works on
// sorted arrays. Make sure to return the location of the found object
// (or nil if not found!).

// Hint: you will probably want to use subarrays.
//

function bsearch(arr, target) {
  // splits into two arrays
  // checks if target is bigger or smaller than right[0]
  // if bigger, apply bsearch on right side. if smaller, apply on left side
  // DONT FORGET TO ADD THE INDEXES

  if (arr.length === 0) return -1;
  // if (arr.length === 1 && arr[0] !== target) return -1;

  const pivotIdx = Math.floor(arr.length/2);
  // 5 => pI = 2: 4 => [1,3] [4,5,9] (R)
  // 3 => pI = 1: 5 => [4] [5,9]
  const leftHalf = arr.slice(0, pivotIdx);
  const rightHalf = arr.slice(pivotIdx+1);
  // debugger;
  if (target === arr[pivotIdx]) {
    return pivotIdx;
  } else if (target < arr[pivotIdx]) {
    return bsearch(leftHalf, target);
  } else {
    const result = bsearch(rightHalf, target);
    return (result === -1) ? -1 : result + pivotIdx + 1;
  }
}

console.log("BSearch:");
console.log(bsearch([1, 2, 3], 1)) // => 0
console.log(bsearch([2, 3, 4, 5], 3)) // => 1
console.log(bsearch([2, 4, 6, 8, 10], 6)) // => 2
console.log(bsearch([1, 3, 4, 5, 9], 5)) // => 3
console.log(bsearch([1, 2, 3, 4, 5, 6], 6)) // => 5
console.log(bsearch([1, 2, 3, 4, 5, 6], 0)) // => nil
console.log(bsearch([1, 2, 3, 4, 5, 7], 6)) // => nil

// Write a recursive MergeSort
// hint: The base cases are for arrays of length zero or one.

function mergeSort(array) {
  // split into two arrs
  if (array.length === 0) return [];
  if (array.length === 1) return array;

  const half = Math.floor(array.length/2);

  let leftHalf = mergeSort(array.slice(0, half));
  let rightHalf = mergeSort(array.slice(half, array.length));

  return merge(leftHalf, rightHalf);

}

function merge(left, right) {
  let result = [];
  while (right.length > 0 && left.length > 0) {
    if (left[0] <= right[0]) {
      result.push(left.shift())
    } else {
      result.push(right.shift())
    }
  }
  return result.concat(left).concat(right);
}

console.log("Merge Sort:");
console.log(mergeSort([192,28,43,29,1,2,200,4])); // [1,2,4,28,29,43,192,200]


// Write a method, subsets, that will return all subsets of an array.
//

function subsets(array) {

}

subsets([]) // => [[]]
subsets([1]) // => [[], [1]]
subsets([1, 2]) // => [[], [1], [2], [1, 2]]
subsets([1, 2, 3]) // => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
