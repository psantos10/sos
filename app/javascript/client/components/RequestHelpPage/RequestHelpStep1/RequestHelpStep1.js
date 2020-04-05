import React, { useState } from 'react';
import PropTypes from 'prop-types';
import StepsBar from '../StepsBar';

import CautionImg from '../../../images/caution.png';

const RequestHelpStep1 = (props) => {
  if (props.step !== 1) return null;

  return (
    <div className="card">
      <header className="card-header has-text-centered">
        <StepsBar activeStep={1} validSteps={props.validSteps} />
      </header>

      <div className="card-content has-text-centered">
        <img src={CautionImg} alt="Nota Importante" width="250px" />
        <h2 className="subtitle is-size-2">NOTA IMPORTANTE</h2>

        <p className="is-size-4">
          Os pedidos de ajuda serão analisados pelos nossos colaboradores
          voluntários antes de serem publicados.
        </p>
        <br />
        <br />
        <div className="field">
          <input
            id="switchMedium"
            type="checkbox"
            className="switch is-medium is-success"
            checked={props.acceptedTerms}
            onChange={props.toggleAcceptedTerms}
          />
          <label htmlFor="switchMedium">
            Estou de acordo com a Política de Privacidade (lê aqui) e os Termos
            de Uso (lê aqui).
          </label>
        </div>
      </div>

      <div className="card-footer">
        <div className="card-footer-item">
          <button
            onClick={props.handleNext}
            disabled={!props.acceptedTerms}
            className="button is-success is-fullwidth"
          >
            Continuar
          </button>
        </div>
      </div>
    </div>
  );
};

RequestHelpStep1.propTypes = {
  step: PropTypes.number.isRequired,
  handleNext: PropTypes.func.isRequired,
  acceptedTerms: PropTypes.bool.isRequired,
  toggleAcceptedTerms: PropTypes.func.isRequired,
  validSteps: PropTypes.array.isRequired,
};

export default RequestHelpStep1;
