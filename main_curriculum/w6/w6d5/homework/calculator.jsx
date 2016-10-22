import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { num1: "", num2: "", result: 0}
    this.setNum1 = this.setNum1.bind(this);
  }

  setNum1(e) {
    console.log(e);
    // this.state.num1
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1> // replace this with your code
        // <input type="button" name="name" value="">
      </div>
    );
  }
}

export default Calculator;
