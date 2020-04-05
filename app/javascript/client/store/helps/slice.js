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
    loadHelpsInit: (state) => {
      return produce(state, (draft) => {
        draft.loading = true;
        draft.errors = [];
        draft.collection = [];
      });
    },

    loadHelpsSuccess: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = [];
        draft.collection = action.payload;
      });
    },

    loadHelpsFailure: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = action.payload;
        draft.collection = [];
      });
    },

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
