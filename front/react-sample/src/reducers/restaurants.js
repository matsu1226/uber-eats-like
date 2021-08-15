import { REQUEST_STATE } from '../constants';

export const initialState = {
  fetchState: REQUEST_STATE.INITIAL,
  restaurantsList: [],
};

export const restaurantsActionTypes = {
  FETCHING: 'FETCHING',
  FETCH_SUCCESS: 'FETCH_SUCCESS'
}

// マッチするrestaurantsActionTypsが引数に渡されたら、対応するstate(fetchstate)を返す
export const restaurantsReducer = (state, action) => {
  switch (action.type) {
    case restaurantsActionTypes.FETCHING:
      return {
        ...state,       // ...state => stateオブジェクト(配列)の{}や''を外して並べる(スプレッド構文)
        fetchState: REQUEST_STATE.LOADING,
      };
    case restaurantsActionTypes.FETCH_SUCCESS:
      return {
        fetchState: REQUEST_STATE.OK,
        restaurantsList: action.payload.restaurants,
      };
    default:
      throw new Error();
  }
}