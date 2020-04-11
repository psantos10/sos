import React, { useEffect } from 'react';
import { connect } from 'react-redux';
import { useParams } from 'react-router-dom';
import PropTypes from 'prop-types';

import { loadHelp } from '../../store/helps/actions';

const HelpPage = (props) => {
  const { id } = useParams();

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
      <button className="button">Oferecer Ajuda</button>
      <br />
      <br />
      <div className="tabs">
        <ul>
          <li className="is-active">
            <a>Ofertas de Ajuda Concluídas</a>
          </li>
          <li>
            <a>Ajudas Pendentes</a>
          </li>
        </ul>
      </div>
      <div>Em Desenvolvimento...</div>
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
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(HelpPage);
