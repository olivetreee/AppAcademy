const Util = {
  inherits (childClass, parentClass) {
    const Surrogate = function() {};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate;
    childClass.prototype.constructor = childClass;
  },
  randomVec(length) {
    a = Math.random() * length;
    b = Math.pow(Math.pow(length,2) - Math.pow(a,2), 0.5);
    return [a,b];
  }
}


module.exports = Util;
