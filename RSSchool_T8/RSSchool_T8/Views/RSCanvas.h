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

@property (nonatomic, weak) RSDrawData *drawData;
@property (nonatomic, strong) NSArray *drawColorsSet;

typedef void(^DrawCompleteBlock)(void);
- (void)startAnimatedDrawWithDuration:(NSTimeInterval)duration complete:(DrawCompleteBlock)complete;
- (void)stopAnimatedDraw;

- (void)resetView;

- (NSData *)getPNG;

@end

NS_ASSUME_NONNULL_END
