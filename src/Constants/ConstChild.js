import {View, Text} from 'react-native';
import React, {useEffect} from 'react';

const ConstChild = ({count}) => {

  useEffect(() => {
    console.log('ConstChild Mounted');
  }, [count]);

  return (
    <View>
      <Text>ConstChild</Text>
    </View>
  );
};

export default ConstChild;
