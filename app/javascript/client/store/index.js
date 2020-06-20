import { combineReducers } from 'redux';
import { configureStore, getDefaultMiddleware } from '@reduxjs/toolkit';
import { connectRouter, routerMiddleware } from 'connected-react-router';

import { createBrowserHistory } from 'history';

import helpsSlice from './helps/slice';
import volunteersSlice from './volunteers/slice';

export const history = createBrowserHistory();

const middleware = [...getDefaultMiddleware(), routerMiddleware(history)];

const initialState = {};

const rootReducer = (history) =>
  combineReducers({
    router: connectRouter(history),
    helps: helpsSlice.reducer,
    volunteers: volunteersSlice.reducer,
  });

const store = configureStore({
  reducer: rootReducer(history),
  preloadedState: initialState,
  middleware,
});

export default store;
