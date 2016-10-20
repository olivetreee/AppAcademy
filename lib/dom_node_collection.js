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

}

module.exports = DOMNodeCollection;
