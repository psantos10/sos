import React from 'react';
import { Link } from 'react-router-dom';
import PropTypes from 'prop-types';

const HelpCard = (props) => {
  return (
    <div className="card" style={{ marginBottom: '18px' }}>
      <div className="card-content">
        <Link to={'/quero-ajudar/' + props.help.id} className="title is-4">
          {props.help.title}
        </Link>
        <br />
        <br />
        <div className="content">{props.help.description}</div>
      </div>

      <footer className="card-footer">
        <Link to="#" className="card-footer-item">
          {props.help.type}
        </Link>
        <Link to="#" className="card-footer-item">
          {props.help.county} - {props.help.province}
        </Link>
      </footer>
    </div>
  );
};

HelpCard.propTypes = {
  help: PropTypes.object.isRequired,
};

export default HelpCard;
