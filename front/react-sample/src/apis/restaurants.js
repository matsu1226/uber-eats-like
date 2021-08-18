import axios from 'axios';
import { restaurantsIndex } from '../urls/index';

export const fetchRestaurants = () => {
  return axios.get(restaurantsIndex)
  .then(res => {
    return res.data
  })
  .catch((e) => console.error(e))
}

// ※axiosの使い方(https://iwb.jp/javascript-library-axios-howto/)
// axios.HTTPRequest.then(res => { return res.data })
// とすることで、JSONデータを取得
// 成功した場合はthen(...)にいき、失敗・例外が帰ってきた場合はcatch(...)へと入る。

// ※then/catchメソッド => https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch