import React from 'react';
import ReactDOM from 'react-dom';
import { AppContainer } from 'react-hot-loader';
import ClientRoot from './root';
import configureStore from './store';

const rootEl = document.getElementById('root');

const stores = configureStore()

ReactDOM.render(
  <AppContainer>
    <ClientRoot stores={stores}/>
  </AppContainer>,
  rootEl
);

if (module.hot) {
  module.hot.accept('./root', () => {
    const NextRoot = require('./root').default
    ReactDOM.render(
      <AppContainer>
        <NextRoot stores={stores} />
      </AppContainer>,
      rootEl
    );

  });
}
