import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { Input } from '../Controls';

const VolunteerLoginForm = (props) => {
  const [volunteerFormData, setVolunteerFormData] = useState({
    email: '',
    password: '',
  });

  const handleInputChange = (e) => {
    setVolunteerFormData({
      ...volunteerFormData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    console.log(volunteerFormData);
  };

  return (
    <div>
      <h1 className="title">Iniciar sessão</h1>
      <form onSubmit={handleSubmit}>
        <Input
          label="Endereço de E-mail"
          name="email"
          type="email"
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

        <div className="filed">
          <div className="control">
            <button className="button is-success">Iniciar sessão</button>
          </div>
        </div>
      </form>
    </div>
  );
};

VolunteerLoginForm.propTypes = {};

export default VolunteerLoginForm;
