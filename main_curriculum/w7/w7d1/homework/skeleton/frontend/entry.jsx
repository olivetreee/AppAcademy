import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './components/widget';
import store from './store';
import { selectCurrency } from './actions';
import reducer from './reducer'

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Widget store={store} />, document.getElementById('root'));
});

window.store = store;
window.selectCurrency = selectCurrency;
window.reducer = reducer;
