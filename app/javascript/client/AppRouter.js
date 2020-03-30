import React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

import Header from './components/Header';
import Footer from './components/Footer';
import HomePage from './components/HomePage';

const AppRouter = () => (
  <Router>
    <Header />
    <Switch>
      <Route path="/">
        <HomePage />
      </Route>
    </Switch>
    <Footer />
  </Router>
);

export default AppRouter;
