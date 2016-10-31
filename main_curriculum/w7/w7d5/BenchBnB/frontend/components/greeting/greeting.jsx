import React from 'react';

const Greeting = ({currentUser, logout}) => {
  let body;
  if (currentUser) {
    body = (
      <div>
        <h2>Howdy, {currentUser.username}!</h2>
        <button onClick={logout}>Logout</button>
      </div>
    )
  } else {
    body = (
      <h2>No one here</h2>
    )
  };
  return body;
}

export default Greeting;
