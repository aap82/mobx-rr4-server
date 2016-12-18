import '../../style.scss'
import '../../styles/dist/semantic.min.css'
import React, {Component, PropTypes} from 'react';
import {BrowserRouter} from 'react-router';
import { Provider } from 'mobx-react'
import App from '../../App';

export default class extends Component {
  render() {
    return (
      <Provider {...this.props.stores}>
        <BrowserRouter>
          <App />
        </BrowserRouter>
      </Provider>
    );
  }
}