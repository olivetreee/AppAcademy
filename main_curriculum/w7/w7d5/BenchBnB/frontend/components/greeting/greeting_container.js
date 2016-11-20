import { connect } from 'react-redux';
import Greeting from './greeting';
import {logout} from '../../actions/session_actions';

const mapStateToProps = ({session}) => ({
  currentUser: session.currentUser
});

const mapDispatchToProps = (dispatch) => ({
  logout: () => {
    this.router.push("/login");
    return dispatch(logout());
  }
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting);
