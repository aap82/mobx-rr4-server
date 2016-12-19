import '../../style.scss'
import '../../styles/dist/semantic.min.css'
import BrowserRouter from 'react-router/BrowserRouter'
import React from 'react';
import { Provider } from 'mobx-react'
import App from '../../App';

const ClientRoot = ({stores}) => (

    <BrowserRouter>
      {({ router }) => (
        <Provider {...stores}>
          <App router={router}/>
        </Provider>
      )}
    </BrowserRouter>

);
export default ClientRoot;