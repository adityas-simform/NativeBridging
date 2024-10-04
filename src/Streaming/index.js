import {View, Text, NativeModules, NativeEventEmitter} from 'react-native';
import React, {useEffect} from 'react';

const {StreamingInterval} = NativeModules;
const eventEmitter = new NativeEventEmitter(StreamingInterval);

const Streaming = () => {
  const [streamingCount, setStreamingCount] = React.useState(0);
  useEffect(() => {
    const eventListener = eventEmitter.addListener('onTimerChange', event => {
      console.log('Streaming Interval', event);
      setStreamingCount(event?.data);
    });

    return () => {
      eventListener.remove();
      StreamingInterval.stopStreaming();
    };
  }, []);

  const startStreaming = () => {
    StreamingInterval.startStreaming();
  };

  const stopStreaming = () => {
    StreamingInterval.stopStreaming();
  };

  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'white',
      }}>
      <Text>Count : {streamingCount}</Text>
      <Text onPress={() => startStreaming()}>Start Streaming</Text>
      <Text onPress={() => stopStreaming()}>Stop Streaming</Text>
    </View>
  );
};

export default Streaming;
