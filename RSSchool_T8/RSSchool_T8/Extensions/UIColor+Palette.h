//
//  UIColor+Palette.h
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIColor (Palette)
+ (UIColor *)defaultShadow;
+ (UIColor *)highlightedShadow;
+ (UIColor *)lightGreenSea;
+ (UIColor *)chillSky;

+ (UIColor *)colorWithHex:(UInt32)col;
+ (UIColor *)colorWithHexString:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
