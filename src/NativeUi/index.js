import {View, Text} from 'react-native';
import React from 'react';
import ImageView from './ImageView';

const NativeUi = () => {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'white',
      }}>
      <ImageView
        src={[{uri: 'https://miro.medium.com/v2/resize:fit:4800/format:webp/1*U4gZLnRtHEeJuc6tdVLwPw.png'}]}
        borderRadius={30}
        resizeMode="cover"
        height={400}
        width={400}
      />
      <Text>Native UI</Text>
    </View>
  );
};

export default NativeUi;
