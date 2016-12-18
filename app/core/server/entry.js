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
  const app = new Express();
  const disable_ssr = false;
  const port = 3000;
  app.use('/', Express.static(path.join(__ROOT_FOLDER__, 'build')));

  const server = new http.Server(app);


  const chunks = parameters.chunks();

  app.use((req, res) => {
    const hydrateOnClient = () => {
      res.send(
        ReactDOM.renderToString(<Html assets={chunks} />)
      );
    };

    const context = createServerRenderContext();
    const result = context.getResult();
    const stores = configureStore();
    global._env = {};

    if (disable_ssr) {
      hydrateOnClient();
      return;
    }

    const component = (
      <Provider {...stores}>
        <ServerRouter
          location={req.url}
          context={context} >
          <App />
        </ServerRouter>
      </Provider>
    );

    const content = ReactDOM.renderToString(
      <Html
        assets={chunks}
        component={component}
        store={stores}
      />
    );

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