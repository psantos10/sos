import { createSlice } from '@reduxjs/toolkit';

const initialState = {
  loading: false,
  errors: [],
  currentHelp: {},
  collection: [],
  meta: {},
};

const helpsSlice = createSlice({
  name: 'helps',
  initialState,

  reducers: {
    loadHelpInit: (state) => {
      state.loading = true;
      state.errors = [];
      state.currentHelp = {};
      state.collection = [];
      state.meta = {};
    },

    loadHelpSuccess: (state, action) => {
      state.loading = false;
      state.errors = [];
      state.currentHelp = action.payload.help;
      state.collection = [];
      state.meta = {};
    },

    loadHelpFailure: (state, action) => {
      state.loading = false;
      state.errors = action.payload;
      state.currentHelp = {};
      state.collection = [];
      state.meta = {};
    },

    loadHelpsInit: (state) => {
      state.loading = true;
      state.errors = [];
      state.collection = [];
      state.meta = {};
    },

    loadHelpsSuccess: (state, action) => {
      state.loading = false;
      state.errors = [];
      state.collection = action.payload.helps;
      state.meta = action.payload.meta;
    },

    loadHelpsFailure: (state, action) => {
      state.loading = false;
      state.errors = action.payload;
      state.collection = [];
      state.meta = {};
    },

    createHelpInit: (state) => {
      state.loading = true;
      state.errors = [];
      state.meta = {};
    },

    createHelpSuccess: (state, action) => {
      state.loading = false;
      state.errors = [];
      state.collection = [...state.collection, action.payload.help];
    },

    createHelpFailure: (state, action) => {
      state.loading = false;
      state.errors = action.payload;
      state.meta = {};
    },
  },
});

export default helpsSlice;
