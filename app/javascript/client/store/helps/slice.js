import produce from 'immer';
import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  loading: false,
  errors: [],
  collection: [],
  meta: {},
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
        draft.meta = {};
      });
    },

    loadHelpsSuccess: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = [];
        draft.collection = action.payload.helps;
        draft.meta = action.payload.meta;
      });
    },

    loadHelpsFailure: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = action.payload;
        draft.collection = [];
        draft.meta = {};
      });
    },

    createHelpInit: (state) => {
      return produce(state, (draft) => {
        draft.loading = true;
        draft.errors = [];
        draft.meta = {};
      });
    },

    createHelpSuccess: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = [];
        draft.collection = [...state.collection, action.payload.help];
      });
    },

    createHelpFailure: (state, action) => {
      return produce(state, (draft) => {
        draft.loading = false;
        draft.errors = action.payload;
        draft.meta = {};
      });
    },
  },
});

export default helpsSlice;
