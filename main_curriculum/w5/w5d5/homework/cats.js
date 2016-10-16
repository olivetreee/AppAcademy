let Animals = require('./animals.js');

class Cat extends Animals {

  constructor(name) {
    super(name);
    this.tail = 7;
  }

  meow() {
    console.log("meow meow")
  }
}

module.exports = Cat;
