import React from 'react';
import { Link } from 'react-router';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = this.state;
    this.props.processForm({user});
    if (this.props.formType === "login") this.props.router.push("/");
  }

  update(property) {
    return e => this.setState({[property]: e.target.value})
  }

  render() {
    const alternativeEntrance = (this.props.formType === "login") ? "signup" : "login";
    return (
      <div>
        <h2>{this.props.formType}</h2>
        <label htmlFor="username">Username</label>
        <input type="text" name="user[username]" id="username" onChange={this.update("username")}/>
        <br/>
        <br/>
        <label htmlFor="password">Password</label>
        <input type="password" name="user[password]" id="password" onChange={this.update("password")}/>
        <br/>
        <br/>
        <button onClick={this.handleSubmit}>Submit</button>
        <br/>
        <Link to={"/" + alternativeEntrance}>{alternativeEntrance} instead</Link>
      </div>
    )
  }
}


export default SessionForm;
