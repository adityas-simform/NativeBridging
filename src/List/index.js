import React from 'react';
import {FlatList, Text, View, StyleSheet} from 'react-native';
import {FlashList} from '@shopify/flash-list';
import MessageList from './MessageList';

const List = () => {
  // Generate 1000 items
  const data = Array.from({length: 1000}, (_, index) => ({
    id: index.toString(),
    value: `Item ${index + 1}`,
  }));

  const renderItem = ({item}) => (
    <View style={styles.itemContainer}>
      <Text style={styles.itemText}>{item.value}</Text>
    </View>
  );

  return (
    
    <View
      style={{
        flex: 1,
        backgroundColor: 'white',
        marginTop: 50,
      }}>
        {/* <FlatList
      data={data}
      renderItem={renderItem}
      keyExtractor={(item) => item.id}
      initialNumToRender={20} // Set initial render count
    /> */}
      {/* <FlashList
        data={data}
        renderItem={renderItem}
        keyExtractor={item => item.id}
        estimatedItemSize={50} // Set estimated item size for better performance
      /> */}
      <MessageList/>
    </View>
  );
};

const styles = StyleSheet.create({
  itemContainer: {
    padding: 50,
    borderBottomWidth: 1,
    borderBottomColor: '#ccc',
  },
  itemText: {
    fontSize: 16,
  },
});

export default List;
