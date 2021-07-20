//
//  RSCanvas.h
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import <UIKit/UIKit.h>
#import "RSDrawData.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSCanvas : UIView

typedef void(^DrawCompleteBlock)(void);

- (void)animatedDraw:(RSDrawData * _Nonnull)drawData complete:(DrawCompleteBlock _Nullable)complete;
- (void)animatedClearWithComplete:(DrawCompleteBlock _Nullable)complete;
- (void)stopAnimation;

- (void)clear;

- (NSData *)getPNG;

@end

NS_ASSUME_NONNULL_END
