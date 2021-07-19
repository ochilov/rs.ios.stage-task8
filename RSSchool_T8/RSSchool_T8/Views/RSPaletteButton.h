//
//  RSPaletteButton.h
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSPaletteButton : UIButton

@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
