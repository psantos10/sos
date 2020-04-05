import React, { useState, useEffect } from 'react';
import { connect } from 'react-redux';

import { loadHelps } from '../../store/helps/actions';
import HelpCard from './HelpCard';

const HelpsPage = (props) => {
  const [currentPage, setCurrentPage] = useState(1);

  useEffect(() => {
    props.loadHelps(currentPage);
  }, []);

  return (
    <div className="container">
      <br />
      <h1 className="title">Pedidos de ajuda</h1>

      <div>{props.isLoading ? 'Carregando...' : null}</div>

      <div>
        {props.helps.map((help) => (
          <HelpCard key={help.id} help={help} />
        ))}
      </div>
    </div>
  );
};

HelpsPage.propTypes = {};

const mapStateToProps = (state) => {
  return {
    isLoading: state.helps.loading,
    errors: state.helps.errors,
    helps: state.helps.collection,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    loadHelps: (currentPage) => dispatch(loadHelps(currentPage)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(HelpsPage);
