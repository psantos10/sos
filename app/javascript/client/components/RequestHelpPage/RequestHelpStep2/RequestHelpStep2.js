import React from 'react';
import PropTypes from 'prop-types';
import StepsBar from '../StepsBar';

const RequestHelpStep2 = (props) => {
  if (props.step !== 2) return null;

  return (
    <div className="card">
      <header className="card-header">
        <StepsBar activeStep={2} validSteps={props.validSteps} />
      </header>

      <div className="card-content">
        <div className="field">
          <label className="label">Tipo de ajuda *</label>
          <div className="control">
            <div className="select">
              <select
                name="help_type"
                value={props.helpFormValues.help_type}
                onChange={props.handleInputChange}
              >
                <option>-- SELECCIONE UMA OPÇÃO --</option>
                <option value="donation_food_clothes">
                  Doação (Alimentação e Vestuário)
                </option>
              </select>
            </div>
          </div>
        </div>

        <div className="field">
          <label className="label">Título *</label>
          <div className="control">
            <input
              name="title"
              type="text"
              className="input"
              value={props.helpFormValues.title}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Descrição do pedido *</label>
          <div className="control">
            <textarea
              name="description"
              className="textarea"
              value={props.helpFormValues.description}
              onChange={props.handleInputChange}
            />
          </div>
        </div>
      </div>

      <div className="card-footer">
        <div className="card-footer-item">
          <button
            onClick={props.handlePrev}
            className="button is-info is-fullwidth"
          >
            Voltar
          </button>
        </div>
        <div className="card-footer-item">
          <button
            onClick={props.handleNext}
            className="button is-success is-fullwidth"
          >
            Continuar
          </button>
        </div>
      </div>
    </div>
  );
};

RequestHelpStep2.propTypes = {
  step: PropTypes.number.isRequired,
  handlePrev: PropTypes.func.isRequired,
  handleNext: PropTypes.func.isRequired,
  validSteps: PropTypes.array.isRequired,
  helpFormValues: PropTypes.object.isRequired,
  handleInputChange: PropTypes.func.isRequired,
};

export default RequestHelpStep2;
