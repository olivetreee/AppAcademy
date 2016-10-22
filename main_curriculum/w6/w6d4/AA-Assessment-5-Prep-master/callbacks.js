Function.prototype.myBind = function(obj) {
  //.bind executes whatever's calling it on the passed in obj
  return () => this.apply(obj);
}



// Write your own myBind(context) method. Add it to Function.prototype.
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

// const boundTurnOn = turnOn.bind(lamp);
// const blabla = turnOn.call(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// blabla(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"
