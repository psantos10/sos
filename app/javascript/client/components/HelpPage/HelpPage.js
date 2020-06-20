import React, { useState, useEffect } from 'react';
import { connect } from 'react-redux';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';

import {
  VolunteerRegisterForm,
  VolunteerLoginForm,
  HelpOfferForm,
} from '../Forms';

import { loadHelp } from '../../store/helps/actions';
import { registerVolunteer } from '../../store/volunteers/actions';

const HelpPage = (props) => {
  const { id } = useParams();
  // TODO : Change default state to false
  const [isHelping, setIsHelping] = useState(true);

  const isAuthenticated = () => {
    true;
  };

  const helpingForms = () => (
    <div className="card" style={{ marginTop: '10px' }}>
      <div className="card-content">
        <div className="columns">
          <div className="column">
            <HelpOfferForm />
          </div>
        </div>
      </div>

      <footer className="card-footer">
        <div className="card-footer-item">
          <button
            className="button is-danger"
            onClick={() => setIsHelping(false)}
          >
            Cancelar
          </button>
        </div>
      </footer>
    </div>
  );

  const autheticationForms = () => (
    <div className="card" style={{ marginTop: '10px' }}>
      <div className="card-content">
        <div className="columns">
          <div className="column">
            <VolunteerLoginForm />
          </div>
          <div className="column">
            <VolunteerRegisterForm
              registerNewVolunteer={props.registerVolunteer}
            />
          </div>
        </div>
      </div>

      <footer className="card-footer">
        <div className="card-footer-item">
          <button
            className="button is-danger"
            onClick={() => setIsHelping(false)}
          >
            Cancelar
          </button>
        </div>
      </footer>
    </div>
  );

  useEffect(() => {
    props.loadHelp(id);
  }, []);

  return (
    <div className="container">
      <br />
      <h2 className="title" style={{ marginBottom: '0px' }}>
        {props.help.title}
      </h2>
      <p style={{ marginBottom: '15px' }}>{props.help.type}</p>

      <div>{props.help.description}</div>
      <br />
      <button
        className="button is-success"
        onClick={() => setIsHelping(true)}
        disabled={isHelping}
      >
        Oferecer Ajuda
      </button>
      <br />

      {isHelping ? (isAuthenticated ? helpingForms : autheticationForms) : null}
      <br />
      <br />
    </div>
  );
};

HelpPage.propTypes = {};

const mapStateToProps = (state) => {
  return {
    isLoading: state.helps.loading,
    errors: state.helps.errors,
    help: state.helps.currentHelp,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    loadHelp: (id) => dispatch(loadHelp(id)),
    registerVolunteer: (payload) => dispatch(registerVolunteer(payload)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(HelpPage);
