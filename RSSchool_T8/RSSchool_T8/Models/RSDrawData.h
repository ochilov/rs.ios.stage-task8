//
//  RSDrawData.h
//  RSSchool_T8
//
//  Created by JohnO on 19.07.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: -
@interface RSDrawDataPath : NSObject
@property (nonatomic, strong) UIBezierPath *bezier;
@property (nonatomic) BOOL needFill;
@property (nonatomic) CGFloat lineWidth;

- (instancetype)initWithBezier:(UIBezierPath *)bezier;
@end


// MARK: -
@interface RSDrawData : NSObject
- (NSArray *)pathes;
- (RSDrawDataPath *)addPath:(UIBezierPath *)path;

+ (instancetype)head;
+ (instancetype)tree;
+ (instancetype)landscape;
+ (instancetype)planet;
@end

NS_ASSUME_NONNULL_END
