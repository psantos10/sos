import React, { useState, useEffect } from 'react';
import { connect } from 'react-redux';
import Pagination from 'react-js-pagination';

import { loadHelps } from '../../store/helps/actions';
import HelpCard from './HelpCard';

const HelpsPage = (props) => {
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPerPage, setTotalPerPage] = useState(5);

  useEffect(() => {
    props.loadHelps(currentPage, totalPerPage);
  }, [currentPage]);

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  return (
    <div className="container">
      <br />
      <h1 className="title">Pedidos de ajuda</h1>

      <div>{props.isLoading ? 'Carregando...' : null}</div>

      <div>
        {props.helps.map((help) => (
          <HelpCard key={help.id} help={help} />
        ))}

        <nav
          className="pagination is-centered"
          role="navigation"
          aria-label="pagination"
        >
          <Pagination
            activePage={currentPage}
            itemsCountPerPage={totalPerPage}
            totalItemsCount={
              props.helpsMeta.total_count ? props.helpsMeta.total_count : 0
            }
            innerClass="pagination-list"
            linkClass="pagination-link"
            activeLinkClass="is-current"
            onChange={handlePageChange}
          />
        </nav>
        <br />
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
    helpsMeta: state.helps.meta,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    loadHelps: (currentPage, totalPerPage) =>
      dispatch(loadHelps(currentPage, totalPerPage)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(HelpsPage);
