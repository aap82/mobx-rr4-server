import './style.scss'
import './styles/dist/semantic.min.css'
import BrowserRouter from 'react-router/BrowserRouter'
import React from 'react'
import { Provider } from 'mobx-react'
import App from './App';



const ClientRoot = ({stores}) => (
  <Provider {...stores}>
    <BrowserRouter>
      <App />
    </BrowserRouter>
  </Provider>
);
export default ClientRoot;


