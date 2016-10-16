Function.prototype.inherits = function(parentClass) {
  childClass = this;
  const Surrogate = function() {};
  Surrogate.prototype = parentClass.prototype;
  childClass.prototype = new Surrogate;
  childClass.prototype.constructor = childClass;
}

function MovingObject () {};

MovingObject.prototype.move = function() {
  console.log("Moved");
}

function Ship () {};
Ship.inherits(MovingObject);

function Asteroid () {};
Asteroid.inherits(MovingObject);
