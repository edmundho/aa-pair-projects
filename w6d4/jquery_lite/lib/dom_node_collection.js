class DOMNodeCollection {


  constructor (els) {
    this.els = els;
  }

  each (callback) {
    this.els.forEach((el) => callback(el));
  }

  html (string) {
    if (string === undefined && this.els.length > 0) {
      return this.els[0].innerHTML();
    } else {
      this.els.forEach((el) => {
        el.innerHTML = string;
      });
    }
  }

  empty () {
    this.html("");
  }

  append (nestedEl) {
    if (nestedEl instanceof DOMNodeCollection) {
      nestedEl.els.forEach((el) => {
        this.each((jel) => {
          jel.innerHTML += el.outerHTML;
        });
      });
    } else if (nestedEl instanceof HTMLElement) {
      this.each((el) => {
        el.innerHTML += nestedEl.outerHTML;
      });
    } else if (typeof nestedEl === "string") {
      console.log("hello");
      this.each((el) => {
        el.innerHTML += nestedEl;
      });
    }
  }

  attr (attribute, value) {
    this.each((el) => {
      el.setAttribute(attribute, value);
    });
  }

  addClass(string){
    this.each((el) => {
      el.className += ` ${string}`;
    });

  }
  removeClass(string){
    this.each((el) => {
      el.classList.remove(string);
    });
  }
}





module.exports = DOMNodeCollection;
