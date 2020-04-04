import React from 'react';
import { Switch, Route } from 'react-router-dom';
import { ConnectedRouter } from 'connected-react-router';
import { history } from './store';

import Header from './components/Header';
import Footer from './components/Footer';
import HomePage from './components/HomePage';
import RequestHelpPage from './components/RequestHelpPage';

const AppRouter = () => (
  <ConnectedRouter history={history}>
    <Header />
    <Switch>
      <Route exact path="/">
        <HomePage />
      </Route>
      <Route path="/preciso-de-ajuda">
        <RequestHelpPage />
      </Route>
    </Switch>
    <Footer />
  </ConnectedRouter>
);

export default AppRouter;
