import React from 'react';
import ReactDOM from 'react-dom';

import AppRouter from '../client/AppRouter';

document.addEventListener('turbolinks:load', () => {
  ReactDOM.render(<AppRouter />, document.getElementById('client-root'));
});
