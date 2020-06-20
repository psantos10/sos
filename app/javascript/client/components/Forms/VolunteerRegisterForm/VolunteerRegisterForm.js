import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { Input } from '../Controls';

const VolunteerRegisterForm = (props) => {
  const [volunteerFormData, setVolunteerFormData] = useState({
    fullname: '',
    cellphone: '',
    email: '',
    password: '',
    province: '',
    county: '',
    types_of_availability: '',
  });

  const handleInputChange = (e) => {
    setVolunteerFormData({
      ...volunteerFormData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    props.registerNewVolunteer(volunteerFormData);
  };

  return (
    <div>
      <h1 className="title">Criar nova conta</h1>
      <form onSubmit={handleSubmit}>
        <Input
          label="Nome completo"
          name="fullname"
          value={volunteerFormData.fullname}
          onChange={handleInputChange}
        />

        <Input
          label="Número de telemóvel"
          name="cellphone"
          type="tel"
          value={volunteerFormData.cellphone}
          onChange={handleInputChange}
        />

        <Input
          label="Endereço de E-mail"
          type="email"
          name="email"
          value={volunteerFormData.email}
          onChange={handleInputChange}
        />

        <Input
          label="Palavra-passe"
          name="password"
          value={volunteerFormData.password}
          onChange={handleInputChange}
          type="password"
        />

        <Input
          label="Província"
          name="province"
          value={volunteerFormData.province}
          onChange={handleInputChange}
        />

        <Input
          label="Município"
          name="county"
          value={volunteerFormData.county}
          onChange={handleInputChange}
        />

        <div className="filed">
          <div className="control">
            <button className="button is-success">Criar nova conta</button>
          </div>
        </div>
      </form>
    </div>
  );
};

VolunteerRegisterForm.propTypes = {
  registerNewVolunteer: PropTypes.func.isRequired,
};

export default VolunteerRegisterForm;
