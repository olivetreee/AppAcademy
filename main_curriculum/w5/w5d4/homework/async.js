//Testing out ASYNC functions
function hammerTime(time) {
  window.setTimeout(() => {
    alert(`${time} is hammertime!`)
  }, time * 1000);
}

// hammerTime(3);

/*
Ask the user if they'd like tea.
console.log their response.
Ask the user if they'd like biscuits.
console.log their complete response: So you ${firstAns} want tea and you ${secondAns} want coffee.
Close the reader.
*/

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits (callback) {
  let first, second;

  reader.question('Would you like some tea?', (first) => { //Waits for the first input to arrive
    reader.question('Would you like some biscuits?', (second) => { //Waits for second input
    console.log(`You replied ${first}.`);
    console.log(`You replied ${second}.`);

    callback(first, second) //Passes both inputs to callback
    });
  });

}

teaAndBiscuits((first, second) => {
  const firstRes = (first === 'yes') ? 'do' : 'don\'t';
  const secondRes = (second === 'yes') ? 'do' : 'don\'t';
  console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
  reader.close();
});

// reader.question("Would you like some tea?", (response) => {
//   console.log(response);
//   reader.close();
// })
