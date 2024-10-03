import { View, Text, NativeModules } from 'react-native'
import React, { useEffect } from 'react'

const {NativeData} = NativeModules;

const CallbackPromise = () => {

    useEffect(()=>{
        NativeData.dataPassToNative('callback function',(response)=>{
            console.log('Callback Response',response);
        })

        NativeData.matchName('Aditya').then((response)=>{
            console.log('Promise Response',response);
        }).catch((error)=>{
            console.log('Promise Error',error);
        })
    })

  return (
    <View style={{flex:1,justifyContent:'center',alignItems:'center',backgroundColor:'white'}}>
      <Text>CallbackPromise</Text>
    </View>
  )
}

export default CallbackPromise