let Animals = require('./animals.js');
let Dog = require ('./dogs.js');
let Cat = require ('./cats.js');

let d = new Dog("Corgie");
d.woof();

let c = new Cat("HP");
console.log(c.name);
c.meow();

d.eat();
c.eat();
