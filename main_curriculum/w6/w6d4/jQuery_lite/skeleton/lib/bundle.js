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

	const Routes = __webpack_require__(1);
	const Inbox = __webpack_require__(2);

	document.addEventListener("DOMContentLoaded", () => {
	  let routes = {};
	  routes["inbox"] = new Inbox();
	  let router = new Routes(document.querySelectorAll(".content")[0], routes);
	  router.start();


	  document.querySelectorAll(".sidebar-nav li").forEach((li) => {
	    li.addEventListener("click", (e) => {
	      e.preventDefault();

	      const liText = e.target.innerText.toLowerCase();
	      window.location.hash = liText;
	    });
	  });

	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {
	  constructor(node, routes){
	    this.node = node;
	    this.routes = routes;
	  }

	  start() {
	    this.render();
	    window.addEventListener("hashchange", (e) => this.render());
	  }

	  render() {
	    this.node.innerHTML = "";
	    let component = this.activeRoute();
	    if (component !== undefined) {
	      this.node.appendChild(component.render());
	    }
	  }

	  activeRoute() {
	    let location = window.location.hash;
	    return this.routes[location.slice(1)];
	  }
	}

	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	const MessagesStore = __webpack_require__(3);

	class Inbox {
	  constructor() {
	    debugger
	    let messagesStore = new MessagesStore();
	    this.messages = messagesStore.getInboxMessages();
	  }

	  render() {
	    let ulContainer = document.createElement("ul");
	    ulContainer.className = "messages";
	    ulContainer.innerHTML = "An inbox message written by a dinosaur";
	    return ulContainer;
	  }

	}

	module.exports = Inbox;


/***/ },
/* 3 */
/***/ function(module, exports) {

	let messages = {
	  sent: [
	    {to: "friend@mail.com", subject: "Check this out", body: "It's so cool"},
	    {to: "person@mail.com", subject: "zzz", body: "so booring"}
	    ],
	  inbox: [
	    {from: "grandma@mail.com", subject: "Fwd: Fwd: Fwd: Check this out",
	    body: "Stay at home mom discovers cure for leg cramps. Doctors hate her"},
	    {from: "person@mail.com", subject: "Questionnaire",
	    body: "Take this free quiz win $1000 dollars"}
	  ]
	};

	const MessagesStore = {};

	MessagesStore.getInboxMessages = function() {
	  return messages["inbox"];
	};

	MessagesStore.getSentMessages = function() {
	  return messages["sent"];
	};

	module.exports = MessagesStore;


/***/ }
/******/ ]);