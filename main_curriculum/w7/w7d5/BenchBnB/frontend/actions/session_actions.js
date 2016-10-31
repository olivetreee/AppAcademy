export const LOGIN = "LOGIN";
export const LOGOUT = "LOGOUT";
export const SIGNUP = "SIGNUP";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

//user is an object coming from the login form
export const login = (user) => ({
  type: LOGIN,
  user
})

export const logout = () => ({
  type: LOGOUT
})

//user is an object coming from the login form
export const signup = (user) => ({
  type: SIGNUP,
  user
})

//currentUser is an object
export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
})

//errors is an array
export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
})
