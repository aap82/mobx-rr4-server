import Express from 'express';
import React from 'react';
import ReactDOM from 'react-dom/server';
import path from 'path';
import {ServerRouter, createServerRenderContext} from 'react-router';
import { Provider, toJS } from 'mobx-react'
import http from 'http';
import configureStore from '../../store';
import App from '../../App'
import Html from './HTML';


export default function (parameters) {
  let x = 1;
  const app = new Express();
  const port = 3000;

  app.use('/', Express.static(path.join(__ROOT_FOLDER__, 'build')));

  const server = new http.Server(app);


  const chunks = parameters.chunks();

  app.use((req, res) => {

    const context = createServerRenderContext();
    const result = context.getResult();
    const stores = configureStore();
    global._env = {};

    console.log(req.url);
    const component = (

        <ServerRouter
          location={req.url}
          context={context} >
          <Provider {...stores}>

          <App />
          </Provider>
        </ServerRouter>

    );

    const content = ReactDOM.renderToString(
      <Html
        assets={chunks}
        component={component}
        store={stores}
      />
    );

    console.log('--------------')
    console.log(x);
    x = x + 1;
    if (result.missed) {
      res.status(404);
    } else {
      res.status(200);
    }



    res.send(`<!doctype html>\n${content}`);

  });

  server.listen(port, (error) => {
    if (error) {

      throw error;
    }

    console.log(`Webpage server is listening at http://localhost:${port}`);
  });
}