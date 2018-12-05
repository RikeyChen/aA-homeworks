import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: '' };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    e.preventDefault();
    this.setState({ searchTerm: e.target.value });
  }

  handleSubmit() {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  render() {
    return (
      <div>
        <form>
          <input
            onChange={this.handleChange}
            type="text"
            value={this.state.searchTerm}
          />
          <input onClick={this.handleSubmit} type="submit" value="Submit" />
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
