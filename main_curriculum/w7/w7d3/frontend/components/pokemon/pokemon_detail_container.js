import {connect} from 'react-redux';
import {receiveOnePokemon, requestOnePokemon} from '../../actions/pokemon_actions';
import {PokemonDetails} from './pokemon_detail';

const mapStateToProps = state => ({
  pokemon: state.pokemon
});

export default connect(
  mapStateToProps
)(PokemonDetails);
