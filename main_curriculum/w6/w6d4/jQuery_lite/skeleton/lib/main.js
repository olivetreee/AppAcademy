const Routes = require("./router");
const Inbox = require("./inbox");

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
