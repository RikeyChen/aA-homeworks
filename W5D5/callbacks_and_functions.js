// Let's write a simple setTimeout function!
//
// First, set a simple timeout for 5000 ms (use window.setTimeout). Pass in a callback function that calls alert('HAMMERTIME').
//
// Open up Chrome Devtools and copy your code into the console to test it. (Open a chrome window then press cmd + option + i. Press esc to show the console.)
//
// Note: while we're waiting for our timeout, we can still scroll around the website and interact with it normally. Is setTimeout synchronous or asynchronous?

// window.setTimeout(() => {
//   alert('HAMMERTIME!');
// }, 5000);
//
// // Next, we are going to write a function hammerTime that takes in one argument - time. When the function is run, it should set a timeout on the window. Pass a callback to the timeout that creates an alert ${time} is hammertime!.
// //
// // Notice that the callback function closed over the time variable in the outer scope of hammerTime.
//
// function hammerTime(time) {
//   window.setTimeout(() => {
//     alert(`${time} is hammertime!`);
//   }, time);
// };
//
// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// function teaAndBiscuits () {
//   reader.question('Would you like some tea?', (res1) => {
//     console.log(`You replied ${res1}.`);
//     reader.question('Would you like some biscuits?', (res2) => {
//       console.log(`You replied ${res2}.`);
//       const first = (res1 === 'yes') ? 'do' : 'don\'t';
//       const second = (res2 === 'yes') ? 'do' : 'don\'t';
//
//       console.log(`So you ${first} want tea and you ${second} want biscuits.`);
//       reader.close();
//     });
//   });
// };
//
// teaAndBiscuits();



function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);
Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);
