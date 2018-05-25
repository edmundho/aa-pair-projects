/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./lib/main.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./lib/dom_node_collection.js":
/*!************************************!*\
  !*** ./lib/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n\n\n  constructor (els) {\n    this.els = els;\n  }\n\n  each (callback) {\n    this.els.forEach((el) => callback(el));\n  }\n\n  html (string) {\n    if (string === undefined && this.els.length > 0) {\n      return this.els[0].innerHTML();\n    } else {\n      this.els.forEach((el) => {\n        el.innerHTML = string;\n      });\n    }\n  }\n\n  empty () {\n    this.html(\"\");\n  }\n\n  append (nestedEl) {\n    if (nestedEl instanceof DOMNodeCollection) {\n      nestedEl.els.forEach((el) => {\n        this.each((jel) => {\n          jel.innerHTML += el.outerHTML;\n        });\n      });\n    } else if (nestedEl instanceof HTMLElement) {\n      this.each((el) => {\n        el.innerHTML += nestedEl.outerHTML;\n      });\n    } else if (typeof nestedEl === \"string\") {\n      console.log(\"hello\");\n      this.each((el) => {\n        el.innerHTML += nestedEl;\n      });\n    }\n  }\n\n  attr (attribute, value) {\n    this.each((el) => {\n      el.setAttribute(attribute, value);\n    });\n  }\n\n  addClass(string){\n    this.each((el) => {\n      el.className += ` ${string}`;\n    });\n\n  }\n  removeClass(string){\n    this.each((el) => {\n      el.classList.remove(string);\n    });\n  }\n}\n\n\n\n\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./lib/dom_node_collection.js?");

/***/ }),

/***/ "./lib/main.js":
/*!*********************!*\
  !*** ./lib/main.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./lib/dom_node_collection.js\");\n\nwindow.$l = (arg) => {\n\n  if (typeof arg === 'string') {\n\n    let domEls = document.querySelectorAll(arg);\n    domEls = Array.from(domEls);\n    return new DOMNodeCollection(domEls);\n  } else if (arg instanceof HTMLElement) {\n    let htmlArray = [arg];\n    return new DOMNodeCollection(htmlArray);\n  }\n\n\n\n};\n\n\n//# sourceURL=webpack:///./lib/main.js?");

/***/ })

/******/ });