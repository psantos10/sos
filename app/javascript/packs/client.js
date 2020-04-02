import React from 'react';
import ReactDOM from 'react-dom';

import AppRouter from '../client/AppRouter';

import store from '../client/store';
import { Provider } from 'react-redux';

document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(
    <Provider store={store}>
      <AppRouter />
    </Provider>,
    document.getElementById('client-root'),
  );
});
