/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const DOMNodeCollection = __webpack_require__(1);

	Window.prototype.$l = function(arg) {
	  let nodeList;
	  if ( typeof(arg) !== HTMLElement ) {
	    nodeList = Array.from(document.querySelectorAll(arg));
	  } else {
	    nodeList = [arg];
	  }
	  return new DOMNodeCollection(nodeList);
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DOMNodeCollection{
	  constructor(htmlElements){
	    this.htmlElements = htmlElements;
	  }

	// MAIN METHODS ??
	  html(str) {
	    if (str !== undefined) {
	      this.htmlElements.forEach(el => {
	        el.innerHTML = str;
	      });
	    } else {
	      return this.htmlElements[0].innerHTML;
	    }
	  }

	  empty() {
	    this.htmlElements.forEach(el => {
	      el.innerHTML = "";
	    });
	  }

	  append(arg) {
	    if ( arg instanceof DOMNodeCollection ) {
	      arg.htmlElements.forEach (newEl => {
	        this.htmlElements.forEach (el => {
	          el.innerHTML += newEl.outerHTML;
	        });
	      });
	    } else if (typeof(arg) === HTMLElement) {
	      this.htmlElements.forEach (el => {
	        el.innerHTML += arg.outerHTML;
	      });
	    } else {
	      this.htmlElements.forEach (el => {
	        el.innerHTML += arg;
	      });
	    }
	  }

	  attr(attribute, value) {
	    this.htmlElements.forEach(el => {
	      el.setAttribute(attribute, value);
	    });
	  }

	  addClass(name) {
	    this.htmlElements.forEach(el => {
	      el.className = this.classArray(el).concat([name]).join(" ");
	    });
	  }

	  removeClass(name) {
	    this.htmlElements.forEach(el => {
	      let array = this.classArray(el);
	      let rmIndex = array.indexOf(name);
	      if (rmIndex > -1) {
	        array.splice(rmIndex, 1);
	        el.className = array.join(" ");
	      }
	    });
	  }

	  classArray(el) {
	    if (el.className.length === 0) return [];
	    return el.className.split(" ");
	  }

	  // TRAVERSAL //

	  children() {
	    let result = [];
	    this.htmlElements.forEach(el => {
	      result = result.concat(Array.from(el.children));
	    });
	    return new DOMNodeCollection(result);
	  }

	  parent() {
	    let result = [];
	    this.htmlElements.forEach(el => {
	      result.push(el.parentNode);
	    });
	    return new DOMNodeCollection(result);
	  }

	  find(query) {
	    let result = [];
	    this.htmlElements.forEach(el => {
	      result = result.concat(Array.from(el.querySelectorAll(query)));
	    });
	    return new DOMNodeCollection(result);
	  }

	  remove() {
	    this.htmlElements.forEach((el) => {
	      el.parentNode.removeChild(el);
	    });
	  }
	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);