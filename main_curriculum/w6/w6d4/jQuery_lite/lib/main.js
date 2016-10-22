const DOMNodeCollection = require('./dom_node_collection');

Window.prototype.$l = function(arg) {
  let nodeList;
  if ( typeof(arg) !== HTMLElement ) {
    nodeList = Array.from(document.querySelectorAll(arg));
  } else {
    nodeList = [arg];
  }
  return new DOMNodeCollection(nodeList);
};
