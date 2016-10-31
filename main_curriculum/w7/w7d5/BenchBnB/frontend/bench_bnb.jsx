import React from 'react';
import ReactDOM from 'react-dom';


/*TESTING*/
// import { signup, login, logout } from './util/session_api_util';
import { signup, login, logout } from './actions/session_actions';
import configureStore from './store/store';

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  ReactDOM.render(<h1>Hello, bench!</h1>, rootEl);


  /*TESTING*/
  window.success = (data) => console.log(data);
  window.error = (data) => console.log(data);
  window.logout = logout;
  window.valid_user = {user: {username: "eric", password: "blabla"}};
  window.invalid_user_1 = {user: {username: "ericc", password: "blabla"}};
  window.invalid_user_2 = {user: {username: "eric", password: "blabl"}};
  window.store = configureStore(); ///We want the return of configureStore function, which is the createStore function.
  window.login = login;
  window.signup = signup;
})


//Common to have error handler on logout?

// Login Flow:

// ********** FRONT END **********//
// 1) You dispatch(login()) passing in a user (whatever comes from the form);
// 2) Middleware intercepts action.type = LOGIN and makes the API call;
// 3) Neither MW nor reducers care about LOGIN after that, so process continues and ends;

// ********** BACK END **********//
// 4) The API call hits the router, which then forwards it to SessionController#create;
// 5) SessionController#create executes and, if credentials are valid, renders show view;
// 6) View is formatted as JSON, displaying the user obj's columns :id, :username. This is returned to the API success callback

// ********** FRONT END **********//
// 7) API success cb is triggered, receiving the object from the JSON view:
// user { id: 1, username: "eric" };
// 8) Success cb is receiveCurrentUserSuccess, defined on MW, which dispatches receiveCurrentUser action, passing in the user obj (received from JSON show view);
// 9) The action (type: RECEIVE_CURRENT_USER) triggers the MW, which doesn't care about such type and next(action) into the reducer;
// 10) Reducer merges {action.currentUser} obj into the state. If you don't wrap the action.currentUser in {}, you'll be merging :id and :username directly into state, so you'll basically create those 2 keys into the state, instead of merging them under the currentUser key. You'll end up with:
// {currentUser: null, errors: [], id: 1, username: "eric"}
