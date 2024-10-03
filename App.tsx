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

function App(): React.JSX.Element {
  return (
    <View style={{flex: 1}}>
      {/* <Toast /> */}
      {/* <Data /> */}
      <CallbackPromise />
    </View>
  );
}

export default App;
