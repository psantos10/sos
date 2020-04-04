import produce from 'immer';
import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  loading: false,
  errors: [],
  collection: [],
};

const helpsSlice = createSlice({
  name: 'helps',
  initialState,

  reducers: {
    createHelpInit: (state) => {
      return produce(state, (draft) => {
        draft.loading = true;
        draft.errors = [];
      });
    },

    createHelpSuccess: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = [];
        draft.collection = [...state.collection, action.payload];
      });
    },

    createHelpFailure: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = action.payload;
      });
    },
  },
});

export default helpsSlice;
