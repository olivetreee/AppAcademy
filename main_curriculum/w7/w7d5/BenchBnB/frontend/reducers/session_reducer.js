import merge from 'lodash/merge';

import {
  LOGOUT,
  RECEIVE_CURRENT_USER,
  RECEIVE_ERRORS
} from '../actions/session_actions.js'

const _defaultState = {
  currentUser: null,
  errors: []
}

const SessionReducer = (state = _defaultState, action) => {
  Object.freeze(state); //For security reasons, as we don't want to change state
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.currentUser;
      // If I'm receiveing currentUser, I don't care about past state's errors, so I'll just merge the new currentUser with the _defaultState
      return merge({}, _defaultState, {currentUser});
    case RECEIVE_ERRORS:
      // We want to store the errors as an array of error objs.
      const errors = [action.errors];
      return merge({}, state, {errors});
    case LOGOUT:
      return _defaultState;
    default:
      return state;
  }
}

export default SessionReducer;
