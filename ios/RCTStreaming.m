//
//  RCTStreaming.m
//  NativeBridging
//
//  Created by Aditya Solanki on 03/10/24.
//

#import "RCTStreaming.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NativeBridging-Swift.h"

@implementation RCTStreaming

RCT_EXPORT_MODULE(StreamingInterval);

RCT_EXPORT_METHOD(startStreaming)
{
  NSLog(@"Data pass from react native to native");
  dispatch_async(dispatch_get_main_queue(), ^{
      // Code to be executed on the main thread
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                  target: self
                                                selector:@selector(sendEventToReactNative:)
                                                userInfo: nil repeats:YES];
    
  });
}

RCT_EXPORT_METHOD(stopStreaming) // Define the stopStreaming method
{
    NSLog(@"Stopping data stream from React Native to native");
    
        // Invalidate the timer and set it to nil
        [self.timer invalidate];
        self.timer = nil;
    
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"onTimerChange"];
}

-(void)sendEventToReactNative:(NSTimer *)timer {
  NSLog(@"sendEventToReactNative");
  self.count = self.count + 1;
  NSDictionary *data = @{@"data": @(self.count)};
  
  [self sendEventWithName:@"onTimerChange" body:data];
}

@end
