//
//  RCTData.m
//  NativeBridging
//
//  Created by Aditya Solanki on 03/10/24.
//
#import "RCTData.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation RCTData

// To export a module named RCTNativeToast
RCT_EXPORT_MODULE(NativeData);

RCT_EXPORT_METHOD(dataPassToNative:(NSString *)val myCallback:(RCTResponseSenderBlock)callback)
{
  NSLog(@"Data pass from react native to native %@", val);
  NSString *responseString = @"Callback function called from iOS";

  callback(@[responseString]);
}

RCT_EXPORT_METHOD(matchName:(NSString *)name
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
 
  if ([name isEqualToString:@"Aditya"]) {
    resolve(@"Matched");
  } else {
    reject(@"Name match failure", @"name not matched", nil);
  }
}

@end
