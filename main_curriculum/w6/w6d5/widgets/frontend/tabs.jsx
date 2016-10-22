import React from 'react';

class Tab extends React.Component {

  constructor(props) {
    super(props);
    this.state = { index: 0, currentContent: "" };
  }

  render() {
    const { tabData } = this.props;
    const  titles = tabData.map( obj => obj.title);

    return (<div>
      <ul>

        {
          titles.map((title, idx) => (
            <li key={title} onClick={this.showContent.bind(this, idx)}>
              <h1>{title}</h1>
            </li>
          ))
        }

      </ul>
      <article>{this.state.currentContent}</article>
    </div>);
  }

  showContent(idx) {
    const { tabData } = this.props;
    const  contents = tabData.map( obj => obj.content);
    this.setState({ currentContent: contents[idx] });
  }

}

export default Tab;
