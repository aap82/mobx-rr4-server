import React, {Component, PropTypes} from 'react';
import ReactDOM from 'react-dom/server';
import serialize from 'serialize-javascript';
import Helmet from 'react-helmet';

export default class Html extends Component {
  render() {
    console.log('html');

    const {assets, component, store} = this.props;
    const content = component ? ReactDOM.renderToString(component) : '';
    const head = Helmet.rewind();

    let data = '';

    if (store) {
      data = `
                window.__data=${serialize(store)};
                window._env=${serialize(_env)}
            `;
    }

    return (
      <html>
      <head>
        <meta name="format-detection" content="telephone=no" />
        <meta name="msapplication-tap-highlight" content="no" />
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width" />
        <meta name="mobile-web-app-capable" content="yes" />

        {__PRODUCTION__ && Object.keys(assets.styles).map((style, key) =>
          <link
            href={assets.styles[style]}
            key={key}
            media="screen, projection"
            rel="stylesheet"
            type="text/css"
            charSet="UTF-8"
          />
        )}
        <link rel="icon" href="data:," />
      </head>
      <body>
      <div id="app" dangerouslySetInnerHTML={{__html: content}} />

      <script
        dangerouslySetInnerHTML={{
          __html: data
        }}
        charSet="UTF-8"
      />

        <script src={assets.javascript.app} charSet="UTF-8" />
      </body>
      </html>
    );
  }
}