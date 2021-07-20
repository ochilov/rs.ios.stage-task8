//
//  RSSettings.h
//  RSSchool_T8
//
//  Created by JohnO on 20.07.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSSettings : NSObject

+ (instancetype)defaultSettings;

@property (atomic) NSTimeInterval drawDuration;
@property (atomic, strong) NSArray* drawColors;

@end

NS_ASSUME_NONNULL_END
