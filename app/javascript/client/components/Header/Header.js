import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => (
  <nav
    className="navbar is-success"
    role="navigation"
    aria-label="main navigation"
  >
    <div className="container">
      <div className="navbar-brand">
        <a className="navbar-item" href="/">
          SOS Angola
        </a>

        <a
          role="button"
          className="navbar-burger burger"
          aria-label="menu"
          aria-expanded="false"
          data-target="navbarMain"
        >
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarMain" className="navbar-menu">
        <div className="navbar-start">
          <Link to="/" className="navbar-item">
            Página Inicial
          </Link>
          <Link to="/preciso-de-ajuda" className="navbar-item">
            Preciso de ajuda
          </Link>
          <Link to="/quero-ajudar" className="navbar-item">
            Quero ajudar
          </Link>
          <Link to="/como-funciona" className="navbar-item">
            Como funciona?
          </Link>
        </div>
      </div>
    </div>
  </nav>
);

export default Header;
