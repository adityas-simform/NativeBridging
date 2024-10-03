import {View, Text, NativeModules} from 'react-native';
import React from 'react';

const {NativeToast} = NativeModules;

const Toast = () => {
  const showNativeToast = () => {
    NativeToast.showNativeToast('Aditya');
  };
  return (
    <View style={{flex: 1, justifyContent: 'center', alignItems: 'center',backgroundColor:'white'}}>
      <Text onPress={showNativeToast}>Show Native Toast</Text>
    </View>
  );
};

export default Toast;
