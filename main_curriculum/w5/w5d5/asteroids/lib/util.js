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

    multiplyer = (Math.random() < 0.5) ? -1 : 1;
    a *= multiplyer

    multiplyer = (Math.random() < 0.5) ? -1 : 1;
    b *= multiplyer

    return [a,b];
  }
}


module.exports = Util;
