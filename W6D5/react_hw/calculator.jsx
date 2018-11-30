import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = { result: 0, num1: "", num2: "" };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNums = this.addNums.bind(this);
    this.subtractNums = this.subtractNums.bind(this);
    this.multiplyNums = this.multiplyNums.bind(this);
    this.divideNums = this.divideNums.bind(this);
  }

  // your code here

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={this.state.num1}/>
        <input onChange={this.setNum2} value={this.state.num2}/>
        <br />
        <button onClick={this.addNums}>+</button>
        <button onClick={this.subtractNums}>-</button>
        <button onClick={this.mutiplyNums}>*</button>
        <button onClick={this.divideNums}>/</button>
      </div>
    );
  }

  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : ""
    this.setState({ num1 });
  }

  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : ""
    this.setState({ num2 });
  }

  addNums(e) {

  }

  subtractNums(e) {

  }

  multiplyNums(e) {

  }

  divideNums(e) {

  }

}

export default Calculator;
