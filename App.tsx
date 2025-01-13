/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {View} from 'react-native';
import Toast from './src/Toast';
import Data from './src/Data';
import CallbackPromise from './src/CallbackPromises';
import Streaming from './src/Streaming';
import NativeUi from './src/NativeUi';
import Constants from './src/Constants';
import List from './src/List';

function App(): React.JSX.Element {
  return (
    <View style={{flex: 1}}>
      {/* <Toast /> */}
      {/* <Data /> */}
      {/* <CallbackPromise /> */}
      {/* <Streaming /> */}
      <NativeUi />
      {/* <List /> */}
    </View>
  );
}

export default App;
