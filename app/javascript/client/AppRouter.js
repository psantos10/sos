import React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

import Header from './components/Header';
import Footer from './components/Footer';
import HomePage from './components/HomePage';
import RequestHelpPage from './components/RequestHelpPage';

const AppRouter = () => (
  <Router>
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
  </Router>
);

export default AppRouter;
