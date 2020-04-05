import axios from 'axios';
import { push } from 'connected-react-router';

import helpsSlice from './slice';

const { actions } = helpsSlice;

const loadHelps = (currentPage, totalPerPage) => {
  return (dispatch, getState) => {
    const state = getState();

    dispatch(actions.loadHelpsInit());

    axios
      .get('/api/helps', {
        params: { page: currentPage, per_page: totalPerPage },
      })
      .then((response) => {
        dispatch(actions.loadHelpsSuccess(response.data));
      })
      .catch((error) => {
        dispatch(actions.loadHelpsFailure(error.response.data));
      });
  };
};

const createHelp = (payload) => {
  return (dispatch, getState) => {
    const state = getState();

    dispatch(actions.createHelpInit());

    axios.defaults.headers.common['X-CSRF-Token'] = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute('content');

    axios
      .post('/api/helps', {
        help: {
          help_type: payload.help_type,
          title: payload.title,
          description: payload.description,
          fullname: payload.fullname,
          cellphone: payload.cellphone,
          email: payload.email,
          province: payload.province,
          county: payload.county,
          district: payload.district,
          neighborhood: payload.neighborhood,
          address: payload.address,
        },
      })
      .then((response) => {
        dispatch(actions.createHelpSuccess({ help: response.data }));
        dispatch(push('/quero-ajudar'));
      })
      .catch((error) => {
        dispatch(actions.createHelpFailure(error.response.data));
      });
  };
};

export { loadHelps, createHelp };
