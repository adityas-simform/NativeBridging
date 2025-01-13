// RNTImageManager.m
// NativeBridging
//
// Created by Aditya Solanki on 08/10/24.

#import <React/RCTViewManager.h>
#import <React/RCTConvert.h>
#import <UIKit/UIKit.h>
#import "NativeBridging-Swift.h"  // Import the generated Swift header

@interface RNTImageManager : RCTViewManager
@end

@implementation RNTImageManager

RCT_EXPORT_MODULE(ReactImageView)

// Create the view instance
- (UIView *)view
{
  return [[UIImageView alloc] init];
}

// Expose the "src" property to React Native
RCT_EXPORT_VIEW_PROPERTY(src, NSArray)

// Expose the "borderRadius" property to React Native
RCT_EXPORT_VIEW_PROPERTY(borderRadius, CGFloat)

// Expose the "resizeMode" property to React Native
RCT_EXPORT_VIEW_PROPERTY(resizeMode, NSString)

// Expose the "width" property to React Native
RCT_EXPORT_VIEW_PROPERTY(width, CGFloat)

// Expose the "height" property to React Native
RCT_EXPORT_VIEW_PROPERTY(height, CGFloat)

// Override the setSrc method to call Swift code
- (void)setSrc:(NSArray *)src forView:(UIImageView *)view {
    [[RNTImageView new] setSrc:src forImageView:view];  // Call Swift method
}

// Override the setBorderRadius method to call Swift code
- (void)setBorderRadius:(CGFloat)borderRadius forView:(UIImageView *)view {
  [[RNTImageView new] setBorderRadius:borderRadius forImageView:view];  // Call Swift method
}

// Override the setResizeMode method to call Swift code
- (void)setResizeMode:(NSString *)resizeMode forView:(UIImageView *)view {
  [[RNTImageView new] setResizeMode:resizeMode forImageView:view];  // Call Swift method
}

// Override the setWidth method to call Swift code
- (void)setWidth:(CGFloat)width forView:(UIImageView *)view {
  [[RNTImageView new] setWidth:width forImageView:view];  // Call Swift method
}

// Override the setHeight method to call Swift code
- (void)setHeight:(CGFloat)height forView:(UIImageView *)view {
  [[RNTImageView new] setHeight:height forImageView:view];  // Call Swift method
}

@end
