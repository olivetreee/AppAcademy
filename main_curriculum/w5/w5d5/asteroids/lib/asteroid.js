const Util = require ('./util.js');
const MovingObject = require ('./moving_object.js');

function Asteroid(params) {
  params.color = params.color || "#2c3e50";
  params.rad = params.rad || 30;
  params.vel = Util.randomVec(30);
  MovingObject.call(this, params)
}

module.exports = Asteroid;
