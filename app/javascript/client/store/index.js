import { combineReducers } from 'redux';
import { configureStore } from '@reduxjs/toolkit';

const initialState = {};

const rootReducer = combineReducers({});

const store = configureStore({
  reducer: rootReducer,
  preloadedState: initialState,
});

export default store;
