import React, { Fragment, useEffect } from 'react';

// apis
import { fetchRestaurants } from '../apis/restaurants';

export const Restaurants = () => {
  useEffect(() => {
    fetchRestaurants()    //成功時はreturn res.data
    .then((data) => 
      console.log(data)
    )
  }, [])
  return (
    <Fragment>
      レストラン一覧
    </Fragment>
  )
}