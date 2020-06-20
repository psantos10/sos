import produce from 'immer';
import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  loading: false,
  errors: [],
  authenticatedVolunteer: {},
};

const volunteersSlice = createSlice({
  name: 'volunteers',
  initialState,

  reducers: {
    registerVolunteerInit: (state) => {
      return produce(state, (draft) => {
        draft.loading = true;
        draft.errors = [];
        draft.authenticatedVolunteer = {};
      });
    },

    registerVolunteerSuccess: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = true;
        draft.errors = [];
        draft.authenticatedVolunteer = action.payload.volunteer;
      });
    },

    registerVolunteerFailure: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = action.payload;
        draft.authenticatedVolunteer = {};
      });
    },
  },
});

export default volunteersSlice;
