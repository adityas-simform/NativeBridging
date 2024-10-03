//
//  RCTNativeToast.m
//  NativeBridging
//
//  Created by Aditya Solanki on 01/10/24.
//

// RCTNativeToast.m
#import "RCTNativeToast.h"
#import <UIKit/UIKit.h>
#import "NativeBridging-Bridging-Header.h"
#import "NativeBridging-Swift.h"

@implementation RCTNativeToast

// To export a module named RCTNativeToast
RCT_EXPORT_MODULE(NativeToast);

RCT_EXPORT_METHOD(showNativeToast:(NSString *)name)
{
  NSLog(@"Something To Print %@", name);
  Toast *toastClass = [[Toast alloc] init];
  [toastClass doSomething];
}

@end

