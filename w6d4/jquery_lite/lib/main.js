const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = (arg) => {

  if (typeof arg === 'string') {

    let domEls = document.querySelectorAll(arg);
    domEls = Array.from(domEls);
    return new DOMNodeCollection(domEls);
  } else if (arg instanceof HTMLElement) {
    let htmlArray = [arg];
    return new DOMNodeCollection(htmlArray);
  }



};
