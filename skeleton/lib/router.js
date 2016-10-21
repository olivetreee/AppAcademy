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
