import React from 'react';
import { FlatList, Text, Image } from 'react-native';
import {FlashList} from '@shopify/flash-list';

enum MessageType {
  Text,
  Image,
}

enum ImageSourcePropType {
  uri,
  require,
}

interface TextMessage {
  text: string;
  type: MessageType.Text;
}

interface ImageMessage {
  image: ImageSourcePropType;
  type: MessageType.Image;
}

type Message = ImageMessage | TextMessage;

const MessageItem = ({ item }: { item: Message }) => {
  switch (item.type) {
    case MessageType.Text:
      return <Text>{item.text}</Text>;
    case MessageType.Image:
      return <Image source={item.image} style={{ width: 100, height: 100 }} />;
  }
};

const generateMessages = (): Message[] => {
  return Array.from({ length: 1000 }, (_, index) => {
    if (index % 2 === 0) {
      return { text: `Message ${index + 1}`, type: MessageType.Text };
    } else {
      return {
        image: { uri: 'https://via.placeholder.com/150' }, // Placeholder image URL
        type: MessageType.Image,
      };
    }
  });
};

// Rendering the actual messages list using FlatList
const MessageList = () => {
  const messages: Message[] = generateMessages()

  return (
    // <FlatList
    //   data={messages}
    //   renderItem={({ item }) => <MessageItem item={item} />}
    //   keyExtractor={(item, index) => index.toString()}
    // />
    <FlashList
      data={messages}
      renderItem={({ item }) => <MessageItem item={item} />}
      keyExtractor={(item, index) => index.toString()}
      estimatedItemSize={100}
      getItemType={(item) => {
        return item.type;
      }}
    />
  );
};

export default MessageList;
