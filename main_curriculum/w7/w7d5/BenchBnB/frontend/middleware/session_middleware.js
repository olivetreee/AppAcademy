import {
  LOGIN,
  LOGOUT,
  SIGNUP,
  receiveCurrentUser,
  receiveErrors } from '../actions/session_actions';

import { login, logout, signup } from '../util/session_api_util';

//How you got here: Someone dispatched an action, like clicking on the login button. That dispatch got intercepted by the middleware. If the MW cares about it, it will call the appropriate function and then dispatch the success/error callback. If not, it should only next(action) to the next part of the flow (reducer)

// MW signature is a triple curry function:
// const sessionMiddleware = store => next => action => { ... }
// It is common to deconstruct the store and get the dispatch function

const sessionMiddleware = ({ dispatch }) => next => action => {

  const receiveCurrentUserSuccess = (data) => dispatch(receiveCurrentUser(data));
  const receiveCurrentUserErrors = (error) => dispatch(receiveErrors(error));
  switch (action.type) {
    case LOGIN:
      login(action.user, receiveCurrentUserSuccess, receiveCurrentUserErrors);
      return next(action);
    case LOGOUT:
      // When a user logs out, there's no error cb. The success cb should only clear currentUser and the errors array, which is done on the reducer end. Hence, the success cb for the logout API call is to go to the reducer (next(action)).
      logout( () => next(action));
      return next(action);
    case SIGNUP:
      signup(action.user, receiveCurrentUserSuccess, receiveCurrentUserErrors);
      return next(action);
    default:
      return next(action);
  }
}

export default sessionMiddleware;
