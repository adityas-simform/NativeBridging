import {View, Text, StyleSheet} from 'react-native';
import React, { useMemo } from 'react';
import ConstChild from './ConstChild';

const Constants = () => {
  const [count, setCount] = React.useState(0);

  const increment = () => {
    setCount(count + 1);
  };

  const containerStyle = useMemo(()=>StyleSheet.flatten([{flex:1,justifyContent:'center',alignItems:'center',backgroundColor:'white'},true ? {backgroundColor:'red'} : {backgroundColor:'blue'}]),[]);
console.log(containerStyle,'containerStyle');
  return (
    <View style={containerStyle}>
      <Text onPress={increment}>Constants</Text>
      <ConstChild />
    </View>
  );
};

export default Constants;
