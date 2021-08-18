import React, { Fragment, useEffect, useReducer } from 'react';
import styled from 'styled-components';             // https://styled-components.com/
import { Link } from 'react-router-dom';


// components
import Skeleton from '@material-ui/lab/Skeleton';   //「ロード状態」を表すUIパーツ

// apis
import { fetchRestaurants } from '../apis/restaurants';

// reducers
import {
  initialState,
  restaurantsActionTypes,
  restaurantsReducer,
} from '../reducers/restaurants';

// constants
import { REQUEST_STATE } from '../constants';

// images
import MainLogo from '../images/logo.png';
import MainCoverImage from '../images/main-cover-image.png';
import RestaurantImage  from '../images/restaurant-image.jpg';


// styled-components
const HeaderWrapper = styled.div`
  display: flex;
  justify-content: flex-start;
  padding: 8px 32px;
`;

const MainLogoImage = styled.img`
  height: 90px;
`;

const MainCoverImageWrapper = styled.div`
  text-align: center;
`;

const MainCover = styled.img`
  height: 600px;
`;

const RestaurantsContentsList = styled.div`
  display: flex;
  justify-content: space-around;
  margin-bottom: 150px;
`;

const RestaurantsContentWrapper = styled.div`
  width: 450px;
  height: 300px;
  padding: 48px;
`;

const RestaurantsImageNode = styled.img`
  width: 100%;
`;

const MainText = styled.p`
  color: black;
  font-size: 18px;
`;

const SubText = styled.p`
  color: black;
  font-size: 12px;
`;


export const Restaurants = () => {
  const [state, dispatch] = useReducer(restaurantsReducer, initialState);
  // restaurantsReducer => マッチするrestaurantsActionTypsが引数に渡されたら、対応するstate(fetchState)を返す
  // つまり、state      => 対応するstate(fetchState)を返す

  useEffect(() => {
    dispatch({ type: restaurantsActionTypes.FETCHING });    //Load中状態
    fetchRestaurants()    //通信成功時はreturn res.data
    .then((data) => 
      dispatch({          // ※1
        type: restaurantsActionTypes.FETCH_SUCCESS,   
        payload: {
          restaurants: data.restaurants
        }
      })
    )
  }, [])

  return (
    <Fragment>
      <HeaderWrapper>
        <MainLogoImage src={MainLogo} alt="main logo"/>
      </HeaderWrapper>
      <MainCoverImageWrapper>
        <MainCover src={MainCoverImage} alt="main cover" />
      </MainCoverImageWrapper>
      <RestaurantsContentsList>
        {
          state.fetchState === REQUEST_STATE.LOADING ?  //load中の表示内容
            <Fragment>
              <Skeleton variant="rect" width={450} height={300} />
              <Skeleton variant="rect" width={450} height={300} />
              <Skeleton variant="rect" width={450} height={300} />
            </Fragment>
          :                                             //load終了後の表示内容(REQUEST_STATE.OK)
            state.restaurantsList.map((item, index) =>
              <Link to={`/restaurants/${item.id}/foods`} key={index} style={{ textDecoration: 'none' }}>
                <RestaurantsContentWrapper>
                  <RestaurantsImageNode src={RestaurantImage} />
                  <MainText>{item.name}</MainText>
                  <SubText>{`配送料：${item.fee}円 ${item.time_required}分`}</SubText>
                </RestaurantsContentWrapper>
              </Link>
            )
        }
      </RestaurantsContentsList>
    </Fragment>
  )
}

//※1 reducerとdispatch
// dispatch({type: hoge})とすると、
// 対応するreducerのcaseのstateを返す。

// const reducer = (state, action) => {
  // switch (action.type) {
  //   case 'increment':
  //     return {count: state.count + 1};
  //   case 'decrement':
  //     return {count: state.count - 1};
  //   default:
  //     throw new Error();
//   }
// }

// function Counter() {
//   const [state, dispatch] = useReducer(reducer, initialState);   //dispatch => 更新関数
//   return (
//     <>
//       Count: {state.count}
//       <button onClick={() => dispatch({type: 'decrement'})}>-</button>
//       <button onClick={() => dispatch({type: 'increment'})}>+</button>
//     </>
//   );
// }