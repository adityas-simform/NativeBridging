import { View, Text, NativeModules } from 'react-native'
import React, { useEffect } from 'react'

const {NativeData} = NativeModules;

const Data = (props) => {

    useEffect(()=>{
        console.log('Data',props);
        NativeData.dataPassToNative('Aditya')
    })

  return (
    <View style={{flex:1,justifyContent:'center',alignItems:'center',backgroundColor:'white'}}>
      <Text>Send data from react native to native</Text>
    </View>
  )
}

export default Data