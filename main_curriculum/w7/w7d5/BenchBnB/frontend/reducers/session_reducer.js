import merge from 'lodash/merge';

import {
  LOGOUT,
  RECEIVE_CURRENT_USER,
  RECEIVE_ERRORS
} from '../actions/session_action.js'

const _defaultState = {
  session: {
    currentUser: null,
    errors = []
  }
}

const SessionsReducer = (state = _defaultState, action) => {
  Object.freeze(state); //For security reasons, as we don't want to change state

  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      currentUser = action.currentUser;
      return merge({}, state, currentUser);
    case RECEIVE_ERRORS:
      errors = action.errors;
      return merge({}, state, errors);
    case LOGOUT:
      return _defaultState;
    case default:
      return state;
  }
}

export default SessionsReducer;
