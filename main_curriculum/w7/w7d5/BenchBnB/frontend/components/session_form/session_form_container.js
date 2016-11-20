import { connect } from 'react-redux';
import SessionForm from './session_form';
import {login, signup} from '../../actions/session_actions';

const mapStateToProps = ({session}) => ({
  loggedIn: (session.currentUser ? true : false),
  errors: session.errors
});

const defineFormType = (pathName) => {
  return (pathName.includes("login")) ? "login" : "signup";
}

const defineProcessForm = (dispatch, formType) => {
  if (formType === "login") {
    return (user) => dispatch(login(user));
  } else {
    return (user) => dispatch(signup(user));
  };
}


const mapDispatchToProps = (dispatch, ownProps) => {
  const formType = defineFormType(ownProps.location.pathname);
  return {
    //ownProps obj comes from the parent component, defined on the root Route
    formType,
    processForm: defineProcessForm(dispatch, formType)
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
