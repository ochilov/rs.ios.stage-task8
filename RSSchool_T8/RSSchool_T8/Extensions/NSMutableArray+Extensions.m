//
//  NSMutableArray+Extensions.m
//  RSSchool_T8
//
//  Created by JohnO on 19.07.2021.
//

#import "NSMutableArray+Extensions.h"

@implementation NSMutableArray(NSMutableArrayExtensions)

- (void)shuffle {
	NSUInteger count = [self count];
	if (count <= 1) return;
	for (NSUInteger i = 0; i < count - 1; ++i) {
		NSInteger remainingCount = count - i;
		NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
		[self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
	}
}

@end
