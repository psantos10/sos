import React from 'react';
import PropTypes from 'prop-types';
import StepsBar from '../StepsBar';

const RequestHelpStep3 = (props) => {
  if (props.step !== 3) return null;

  return (
    <div className="card">
      <header className="card-header">
        <StepsBar activeStep={3} validSteps={props.validSteps} />
      </header>

      <div className="card-content">
        <div className="field">
          <label className="label">Nome completo *</label>
          <div className="control">
            <input
              name="fullname"
              type="text"
              className="input"
              value={props.helpFormValues.fullname}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Endereço de E-mail</label>
          <div className="control">
            <input
              name="email"
              type="email"
              className="input"
              value={props.helpFormValues.email}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Número de telefone *</label>
          <div className="control">
            <input
              type="text"
              className="input"
              name="cellphone"
              value={props.helpFormValues.cellphone}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Província *</label>
          <div className="control">
            <input
              type="text"
              className="input"
              name="province"
              value={props.helpFormValues.province}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Município *</label>
          <div className="control">
            <input
              type="text"
              className="input"
              name="county"
              value={props.helpFormValues.county}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Distrito</label>
          <div className="control">
            <input
              type="text"
              className="input"
              name="district"
              value={props.helpFormValues.district}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Bairro *</label>
          <div className="control">
            <input
              type="text"
              className="input"
              name="neighborhood"
              value={props.helpFormValues.neighborhood}
              onChange={props.handleInputChange}
            />
          </div>
        </div>

        <div className="field">
          <label className="label">Endereço *</label>
          <div className="control">
            <input
              type="text"
              className="input"
              placeholder="Ex. Rua Amilcar Cabral R17 2º Andar ESQ"
              name="address"
              value={props.helpFormValues.address}
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

RequestHelpStep3.propTypes = {
  step: PropTypes.number.isRequired,
  handlePrev: PropTypes.func.isRequired,
  handleNext: PropTypes.func.isRequired,
  validSteps: PropTypes.array.isRequired,
  helpFormValues: PropTypes.object.isRequired,
};

export default RequestHelpStep3;
