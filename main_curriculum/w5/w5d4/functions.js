class Clock {
  constructor() {
    // 1. Create a Date object.
    let time = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hour = time.getHours();
    this.minutes = time.getMinutes();
    this.seconds = time.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval( this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    let hourString = this.formatNumber(this.hour);
    let minuteString = this.formatNumber(this.minutes);
    let secondsString = this.formatNumber(this.seconds);
    // Use console.log to print it.
    console.log(`${hourString}:${minuteString}:${secondsString}`);
  }

  formatNumber(num) {
    return num > 9 ? `${num}` : `0${num}`;
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds++;
    if (this.seconds > 59) {
      this.seconds = 0;
      this.minutes++;
    };

    if (this.minutes > 59) {
      this.minutes = 0;
      this.hour++;
    };

    if (this.hour > 23) {
      this.hour = 0;
    };

    this.printTime();
    // 2. Call printTime.

  }
}

// const clock = new Clock();
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
function addNumbers(sum, numLeft, callback){
  if (numLeft === 0) {
    callback(sum);
    reader.close();
  }
  reader.question("Type a number > ", (num) => {
    let intNum = parseInt(num);
    sum += intNum;
    console.log(sum);
    addNumbers(sum, numLeft - 1, callback);
  })
}

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  let value;
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(`Is ${el1} > ${el2}? \r\n> `, (response) => {
    value = (response === 'yes') ? true : false;
    callback(value);
  })
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, sorted, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function(value) {
      if (value === true) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        innerBubbleSortLoop(arr, i+1, true, outerBubbleSortLoop);
      } else {
        innerBubbleSortLoop(arr, i+1, false, outerBubbleSortLoop);
      }
    })
  } else if (i == arr.length - 1) {
    outerBubbleSortLoop(sorted);
  }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps === true){
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}


// absurdBubbleSort([3, 2, 1], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

Function.prototype.myBind = function (context) {
  return () => {
    this.apply(context);
  }
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
   console.log("Turning on " + this.name);
}

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"
