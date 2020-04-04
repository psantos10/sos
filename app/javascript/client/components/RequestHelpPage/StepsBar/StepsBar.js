import React from 'react';
import PropTypes from 'prop-types';

const StepsBar = (props) => {
  return (
    <div style={{ width: '100%', padding: '10px' }}>
      <div className="steps">
        <div
          className={
            'step-item ' +
            (props.activeStep === 1 ? 'is-active' : null) +
            ' ' +
            (props.validSteps.includes(1) ? 'is-completed' : null)
          }
        >
          <div className="step-marker">1</div>
          <div className="step-details">
            <p>Termos e Condições</p>
          </div>
        </div>
        <div
          className={
            'step-item ' +
            (props.activeStep === 2 ? 'is-active' : null) +
            ' ' +
            (props.validSteps.includes(2) ? 'is-completed' : null)
          }
        >
          <div className="step-marker">2</div>
          <div className="step-details">
            <p>Pedido de Ajuda</p>
          </div>
        </div>
        <div
          className={
            'step-item ' +
            (props.activeStep === 3 ? 'is-active' : null) +
            ' ' +
            (props.validSteps.includes(3) ? 'is-completed' : null)
          }
        >
          <div className="step-marker">3</div>
          <div className="step-details">
            <p>Dados Pessoais</p>
          </div>
        </div>
        <div
          className={
            'step-item ' +
            (props.activeStep === 4 ? 'is-active' : null) +
            ' ' +
            (props.validSteps.includes(4) ? 'is-completed' : null)
          }
        >
          <div className="step-marker">4</div>
          <div className="step-details">
            <p>Finalizar o Pedido</p>
          </div>
        </div>
      </div>
    </div>
  );
};

StepsBar.propTypes = {
  activeStep: PropTypes.number.isRequired,
  validSteps: PropTypes.array.isRequired,
};

export default StepsBar;
