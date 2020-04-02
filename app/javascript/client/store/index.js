import { combineReducers } from 'redux';
import { configureStore } from '@reduxjs/toolkit';

import helpsSlice from './helps/slice';

const initialState = {};

const rootReducer = combineReducers({
  helps: helpsSlice.reducer,
});

const store = configureStore({
  reducer: rootReducer,
  preloadedState: initialState,
});

export default store;
