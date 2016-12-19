import React from 'react';
import ReactDOM from 'react-dom';
import {AppContainer} from 'react-hot-loader';
import configureStore from '../../store';


import ClientRoot from './root';
const disable_ssr = false;


const rootEl = document.getElementById('app');
const stores = configureStore();


ReactDOM.render(
  <AppContainer>
    <ClientRoot stores={stores}/>
  </AppContainer>,
  rootEl
);

if (module.hot) {
   module.hot.accept('./root', () => {
    const UpdatedRoot = require('./root').default;
    ReactDOM.render(
      <AppContainer >
        <UpdatedRoot stores={stores} />
      </AppContainer>,
      rootEl);
  });
}