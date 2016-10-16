let Animals = require('./animals.js');

class Dog extends Animals {

  constructor(name) {
    super(name);
    this.tail = 10;
  }

  woof() {
    console.log("woof woof")
  }
}

module.exports = Dog;
