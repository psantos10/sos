import axios from 'axios';
import { push } from 'connected-react-router';

import volunteersSlice from './slice';

const { actions } = volunteersSlice;

const registerVolunteer = (payload) => {
  return (dispatch, getState) => {
    const state = getState();

    dispatch(actions.registerVolunteerInit());

    axios.defaults.headers.common['X-CSRF-Token'] = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute('content');

    axios
      .post('/api/volunteers', {
        volunteer: {
          fullname: payload.fullname,
          cellphone: payload.cellphone,
          email: payload.email,
          password: payload.password,
          province: payload.province,
          county: payload.county,
        },
      })
      .then((response) => {
        dispatch(
          actions.registerVolunteerSuccess({ volunteer: response.data }),
        );
        // dispatch(push('/quero-ajudar'));
      })
      .catch((error) => {
        dispatch(actions.registerVolunteerFailure(error.response.data));
      });
  };
};

export { registerVolunteer };
