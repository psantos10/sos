import React, { useState } from 'react';
import { connect } from 'react-redux';

import { createHelp } from '../../store/helps/actions';

import RequestHelpStep1 from './RequestHelpStep1';
import RequestHelpStep2 from './RequestHelpStep2';
import RequestHelpStep3 from './RequestHelpStep3';
import RequestHelpStep4 from './RequestHelpStep4';

const RequestHelpPage = (props) => {
  const [currentStep, setCurrentStep] = useState(1);
  const [acceptedTerms, setAcceptedTerms] = useState(false);
  const [validSteps, setValidSteps] = useState([]);
  const [helpFormValues, setHelpFormValues] = useState({
    help_type: '',
    title: '',
    description: '',
    fullname: '',
    email: '',
    cellphone: '',
    province: '',
    county: '',
    district: '',
    neighborhood: '',
    address: '',
  });

  const toggleAcceptedTerms = (e) => {
    setAcceptedTerms(e.target.checked);
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;

    setHelpFormValues({ ...helpFormValues, [name]: value });
  };

  const handleNextStep = () => {
    setCurrentStep(currentStep + 1);
  };

  const handlePrevStep = () => {
    setCurrentStep(currentStep - 1);
  };

  const handleFinalSubmit = () => {
    props.saveHelp(helpFormValues);
  };

  return (
    <div className="container">
      <br />
      <h1 className="title">Pedido de Ajuda</h1>

      <div>
        <RequestHelpStep1
          step={currentStep}
          handleNext={handleNextStep}
          acceptedTerms={acceptedTerms}
          validSteps={validSteps}
          toggleAcceptedTerms={(e) => toggleAcceptedTerms(e)}
        />
        <RequestHelpStep2
          step={currentStep}
          validSteps={validSteps}
          handlePrev={handlePrevStep}
          handleNext={handleNextStep}
          helpFormValues={helpFormValues}
          handleInputChange={handleInputChange}
        />
        <RequestHelpStep3
          step={currentStep}
          validSteps={validSteps}
          handlePrev={handlePrevStep}
          handleNext={handleNextStep}
          helpFormValues={helpFormValues}
          handleInputChange={handleInputChange}
        />
        <RequestHelpStep4
          step={currentStep}
          validSteps={validSteps}
          handlePrev={handlePrevStep}
          handleSubmit={handleFinalSubmit}
          helpFormValues={helpFormValues}
          isLoading={props.isLoading}
          errors={props.errors}
        />
      </div>
    </div>
  );
};

const mapStateToProps = (state) => {
  return {
    isLoading: state.helps.loading,
    errors: state.helps.errors,
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    saveHelp: (payload) => dispatch(createHelp(payload)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(RequestHelpPage);
