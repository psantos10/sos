import React from 'react';
import PropTypes from 'prop-types';
import StepsBar from '../StepsBar';

const RequestHelpStep4 = (props) => {
  if (props.step !== 4) return null;

  return (
    <div className="card">
      <header className="card-header">
        <StepsBar activeStep={4} validSteps={props.validSteps} />
      </header>

      <div className="card-content">
        <h2 className="subtitle">Confirmar o Pedido</h2>
        <div className="columns">
          <div className="column">
            <p>Tipo de Ajuda: {props.helpFormValues.help_type}</p>
            <p>Título: {props.helpFormValues.title}</p>
            <p>Descrição do Pedido: {props.helpFormValues.description}</p>
          </div>
          <div className="column">
            <p>Nome completo: {props.helpFormValues.fullname}</p>
            <p>Número de Telefone: {props.helpFormValues.cellphone}</p>
            <p>Endereço de E-mail: {props.helpFormValues.email}</p>
            <p>Endereço: {props.helpFormValues.address}</p>
            <p>Bairro: {props.helpFormValues.neighborhood}</p>
            <p>Distrito: {props.helpFormValues.district}</p>
            <p>Município: {props.helpFormValues.county}</p>
            <p>Província: {props.helpFormValues.province}</p>
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
            onClick={props.handleSubmit}
            className="button is-success is-fullwidth"
          >
            Enviar o Pedido
          </button>
        </div>
      </div>
    </div>
  );
};

RequestHelpStep4.propTypes = {
  step: PropTypes.number.isRequired,
  handlePrev: PropTypes.func.isRequired,
  handleSubmit: PropTypes.func.isRequired,
  validSteps: PropTypes.array.isRequired,
  helpFormValues: PropTypes.object.isRequired,
};

export default RequestHelpStep4;
