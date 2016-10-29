import React from 'react';
import ReactDOM from 'react-dom';


/*TESTING*/
import {signup, login, logout} from './util/session_api_util';

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<h1>Hello, bench!</h1>, rootEl);


  /*TESTING*/
  window.success = (data) => console.log(data);
  window.error = (data) => console.log(data);
  window.logout = logout;
  window.valid_user = {user: {username: "eric", password: "blabla"}};
  window.login = login
})
