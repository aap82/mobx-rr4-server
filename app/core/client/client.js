import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from '../../store';
import {AppContainer} from 'react-hot-loader';

import Root from './root';
const disable_ssr = false;


const dest = document.getElementById('app');
const stores = configureStore(window.__data);


const component = (
  <AppContainer >
    <Root
      stores={stores}
     />
  </AppContainer>
);

ReactDOM.render(component, dest);

if (process.env.NODE_ENV !== 'production') {
  window.React = React; // enable debugger

  if (
    !disable_ssr
    &&
    (!dest || !dest.firstChild
      ||
      !dest.firstChild.attributes
      ||
      !dest.firstChild.attributes['data-react-checksum']
    )
  ) {
    console.error('Server-side React render was discarded.');
  }
}

if (module.hot) {
  const isString = string => typeof string === 'string';

  const orgError = console.error; // eslint-disable-line no-console

  console.error = (...args) => { // eslint-disable-line no-console
    if (
      args
      && args.length === 1
      && isString(args[0])
      && args[0].indexOf('You cannot change <Router ') > -1
    ) {
      // React route changed
    } else {
      // Log the error as normally
      orgError.apply(console, args);
    }
  };

  module.hot.accept('./root', () => {
    const UpdatedRoot = require('./root').default;
    ReactDOM.render(
      <AppContainer >
        <UpdatedRoot
          stores={stores}

        />
      </AppContainer>,
      dest);
  });
}