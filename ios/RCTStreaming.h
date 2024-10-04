//
//  RCTStreaming.h
//  NativeBridging
//
//  Created by Aditya Solanki on 03/10/24.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCTStreaming : RCTEventEmitter <RCTBridgeModule>

@property NSTimer *timer;
@property (nonatomic, assign) NSInteger count;
@end
